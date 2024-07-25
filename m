Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A218F149C70
	for <llvm@lists.linux.dev>; Thu, 25 Jul 2024 23:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721949709; cv=none; b=r3UKG+UYwBjC5YYb8DHnnc7LVtvA8axPuthaVnKu6Fx8jkpIoDkezbhP2QQjDoSDanKBQBCbzd26bg/A2qzqdet7EckBunHb5cFu556a5ekLfWww46Zn/1spis3EOazVoplsq6O7eUqhO0E3Pg5W5sSOYHuOuKAr934W/EcoH2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721949709; c=relaxed/simple;
	bh=qH2ob/GPMxW6QjGdFk/NsUTwDcqVg3OStezb0PUZxuM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kfyKRqAxJUKUwVGlvWmcN6s9+s3rWSWM3TcCexLUd+n9C0fHXXJ/eVPImvupCiFsBbo1eP92LrSGb5DHyON//khk+jsbr+e75OtnxO3836SEPmyGu7fp6I5/eDIgOm4awqfbecvk59+c4AZmS7KnlR0ej7PaKAAjAt0dNzW7gGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=11VyFJ9j; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="11VyFJ9j"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e0b2fb62a07so1917668276.0
        for <llvm@lists.linux.dev>; Thu, 25 Jul 2024 16:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721949706; x=1722554506; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NIeg3QD3T42p/ZQnVld0CvS5klyquBslVZ8Cnqk2AWw=;
        b=11VyFJ9jVVfd1JgCxOkhobMX3YPpakG4d/BV73U5YZteyNIxHBvwFLyJUZoeCh99V5
         Re7WQjg5qUi/JH4HxyKfl8igrhXh+SRuZLP068wweMvQTLhu2Vn1LJIYh4Y8xMVsznEw
         vB7wt2BHc15Ff721Or68Pagbwt0Mue0VlaQOZ/o8gsouED6J/XGIalRLbitl51esI4ur
         CuXA20OgfBd8sm8lGBgzg1hf4e2YSuDIC2qDO7wxDj8XPp/i+jPZK1kIM5a3tzxs+WJM
         A/WgFn52/NNcjZsQ9A0LofNkNy96EGDGmO4UZvIF0ypaisjp1EWMc4QrtXmbUerMGu42
         BV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721949706; x=1722554506;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIeg3QD3T42p/ZQnVld0CvS5klyquBslVZ8Cnqk2AWw=;
        b=bKcYXECVhma13SSD3wXTHp3oMupFtfQBbUtQeTOw6I/C6WaGsYgxUtzr7z3IgdxQzj
         qIMUxOQuhvH/IkI3hLBKdbAgsOuS1TkVpdarMRi9va0x76iT24717Nv3zOzki62XfVP6
         tJpsrcoCMxx+TXgdqcqnEIFdZiCdGTUxjWoulJFZCv3VXeluCJeeJKxeXq76EbuG9PtG
         pbtAxErmgjvWXexA7Tq687ME3paqB7flzNYK8LqcoT+fmNf5MogvMQi4f12uF80qA5v5
         vRbjcznouQpVZfHL1wIJyr5Kc3HnzJX1ruSvd02TrsEQNLArLKpw8sOxa+KkLyYpSMLU
         LW5w==
X-Forwarded-Encrypted: i=1; AJvYcCXwo0hxIv59J9CpJGsYc5O6pFeR4YlH/QQLMmsqYp4HQiAAUGm1EfXKycipdb+3Iere+z/TmlZFSn1mePENd7QNHvHuWw==
X-Gm-Message-State: AOJu0YwETWhAdHfuuZ2VYcgpaPqm05uQSMMBRghdSMrX59jf9FrJI/xZ
	ZQdk2fvaQLiOurGvqdU1wCgVTpBdh+TqRIx9I+eTW1M6wrVAWTfgidi5Dz+cCQZMpmq6+y5bahU
	ahaUr1Q==
X-Google-Smtp-Source: AGHT+IGFgF07K78Xk6HyAkYV734bKuaNSlYnh+LI6ONN4gJdXx4TMFBTavf54CUZ0w26vWpdASB/dVOetoAt
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:9bc1:0:b0:e08:6c33:7334 with SMTP id
 3f1490d57ef6-e0b2cd29922mr30221276.8.1721949706306; Thu, 25 Jul 2024 16:21:46
 -0700 (PDT)
Date: Thu, 25 Jul 2024 23:20:47 +0000
In-Reply-To: <20240725232126.1996981-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240725232126.1996981-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240725232126.1996981-3-mmaurer@google.com>
Subject: [PATCH 2/2] kbuild: rust: Enable KASAN support
From: Matthew Maurer <mmaurer@google.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Rust supports KASAN via LLVM, but prior to this patch, the flags aren't
set properly.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/Makefile.kasan | 46 +++++++++++++++++++++++++++++++++++++++++-
 scripts/Makefile.lib   |  3 +++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 390658a2d5b7..84572c473e23 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -12,6 +12,7 @@ endif
 KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
 
 cc-param = $(call cc-option, -mllvm -$(1), $(call cc-option, --param $(1)))
+rustc-param = $(call rustc-option, -Cllvm-args=-$(1),)
 
 ifdef CONFIG_KASAN_STACK
 	stack_enable := 1
@@ -28,6 +29,7 @@ else
 endif
 
 CFLAGS_KASAN_MINIMAL := -fsanitize=kernel-address
+RUSTFLAGS_KASAN_MINIMAL := -Zsanitizer=kernel-address -Zsanitizer-recover=kernel-address
 
 # -fasan-shadow-offset fails without -fsanitize
 CFLAGS_KASAN_SHADOW := $(call cc-option, -fsanitize=kernel-address \
@@ -36,13 +38,36 @@ CFLAGS_KASAN_SHADOW := $(call cc-option, -fsanitize=kernel-address \
 			-mllvm -asan-mapping-offset=$(KASAN_SHADOW_OFFSET)))
 
 ifeq ($(strip $(CFLAGS_KASAN_SHADOW)),)
+	KASAN_SHADOW_SUPPORTED := n
+else
+	KASAN_SHADOW_SUPPORTED := y
+endif
+
+ifdef CONFIG_RUST
+	RUSTFLAGS_KASAN_SHADOW := $(call rustc-option $(RUSTFLAGS_KASAN_MINIMAL) \
+				  -Cllvm-args=-asan-mapping-offset=$(KASAN_SHADOW_OFFSET))
+	ifeq ($(strip $(RUSTFLAGS_KASAN_SHADOW)),)
+		KASAN_SHADOW_SUPPORTED := n
+	endif
+endif
+
+ifeq ($(KASAN_SHADOW_SUPPORTED),y)
 	CFLAGS_KASAN := $(CFLAGS_KASAN_MINIMAL)
+	ifdef CONFIG_RUST
+		RUSTFLAGS_KASAN := $(RUSTFLAGS_KASAN_MINIMAL)
+	endif
 else
 	# Now add all the compiler specific options that are valid standalone
 	CFLAGS_KASAN := $(CFLAGS_KASAN_SHADOW) \
 	 $(call cc-param,asan-globals=1) \
 	 $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
 	 $(call cc-param,asan-instrument-allocas=1)
+	ifdef CONFIG_RUST
+		RUSTFLAGS_KASAN := $(RUSTFLAGS_KASAN_SHADOW) \
+		 $(call rustc-param,asan-globals=1) \
+		 $(call rustc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
+		 $(call rustc-param,asan-instrument-allocas=1)
+	endif
 endif
 
 CFLAGS_KASAN += $(call cc-param,asan-stack=$(stack_enable))
@@ -52,6 +77,11 @@ CFLAGS_KASAN += $(call cc-param,asan-stack=$(stack_enable))
 # memintrinsics won't be checked by KASAN on GENERIC_ENTRY architectures.
 CFLAGS_KASAN += $(call cc-param,asan-kernel-mem-intrinsic-prefix=1)
 
+ifdef CONFIG_RUST
+	RUSTFLAGS_KASAN += $(call rustc-param,asan-stack=$(stack_enable))
+	RUSTFLAGS_KASAN += $(call rustc-param,asan-kernel-mem-intrinsic-prefix=1)
+endif
+
 endif # CONFIG_KASAN_GENERIC
 
 ifdef CONFIG_KASAN_SW_TAGS
@@ -73,6 +103,20 @@ ifeq ($(call clang-min-version, 150000)$(call gcc-min-version, 130000),y)
 CFLAGS_KASAN += $(call cc-param,hwasan-kernel-mem-intrinsic-prefix=1)
 endif
 
+ifdef CONFIG_RUST
+	ifdef CONFIG_KASAN_INLINE
+		rust_instrumentation_flags := $(call rustc-param,hwasan-mapping-offset=$(KASAN_SHADOW_OFFSET))
+	else
+		rust_instrumentation_flags := $(call rustc-param,hwasan-instrument-with-calls=1)
+	endif
+	RUSTFLAGS_KASAN := -Zsanitizer=kernel-hwaddress -Zsanitizer-recover=kernel-hwaddress \
+			   $(call rustc-param,hwasan-instrument-stack=$(stack_enable)) \
+			   $(call rustc-param,hwasan-use-short-granules=0) \
+			   $(call rustc-param,hwasan-inline-all-checks=0) \
+			   $(call rustc-param,hwasan-kernel-mem-intrinsic-prefix=1) \
+			   $(instrumentation_flags)
+endif
+
 endif # CONFIG_KASAN_SW_TAGS
 
-export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE
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
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

