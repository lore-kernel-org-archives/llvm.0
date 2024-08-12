Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BC71991AF
	for <llvm@lists.linux.dev>; Mon, 12 Aug 2024 23:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723505360; cv=none; b=ZF1ub28R8W6sxO0s7zOWermYaP4w8XRL8HlvXm6R2L4OHM/cNLUipIzHh4LYt6o2osT30nYify6Y8A7NUFXJJgoFECDMOtL70jIk3P9TcpwEJRCLQPgivc6ObRe3Ce94n32RxQmKGLO143eCFUgd9N+ogppnwP4JSJoXqPs+dzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723505360; c=relaxed/simple;
	bh=WNJRbJEWl/JK8Az8ghGCXWH3fm68Jwe8K6UK0+dCVTQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C0FgDvGZdWaZgy8kQFImTKH7yPTSzK5jvecljMEHiyeMPs4I0mE13q5GfJSW8RkJcbN21a5lfhBQIpyPDJxVawZKp1IbPStOJGxIijypCgetBhw6/F5mDs+z8HrPDH5TEWJzEUK5MCdUfrCxs0yAOLLK2uzeZnymrmDRgwlgs+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PLWvdrkc; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PLWvdrkc"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-664fc7c4e51so101180377b3.3
        for <llvm@lists.linux.dev>; Mon, 12 Aug 2024 16:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723505357; x=1724110157; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7N7Zf7M9w/vAcr3WmdKFD5NuAFU2ocCw/qlD1RHyGfQ=;
        b=PLWvdrkcf9MBo5RzI5cvwYpnbVveFDGK5dZ2LFIzyfybbqB4wnhWeRHCTkssopQv+6
         hKtyqUWG4Vqu4/hgD5g/Y/lUsJQa5CbD9JEYKq72yje3JLF8zYhAjvJnfL52x7eZ56JH
         eRG1sMHd1AMn7tQyp3D9xYCMMoBG9YIlH8uY5KrYzzTDlunA3DvhtJwtxBS8sHvOuWXn
         nzSkAQ8i0MIrAzabX5vkyHit3X8TLuiLXES0x7DsGLIxVOtafxsnGlZsagT+7PGjIhEu
         udd9IDCcJG+z4tRL4wYkOJ6qwUVKvBFXQ5wvxBYV94fToZ+ozAYKr+yUTTUEqSCDTUtu
         uIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723505357; x=1724110157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7N7Zf7M9w/vAcr3WmdKFD5NuAFU2ocCw/qlD1RHyGfQ=;
        b=oChuYWYf1StQF76i60FSEIMXQXydOEkAGx3nHj+VOqHffpdjxOll0xMmlmYrKmfJ1i
         jBWdzZwYTf/sRF7RpTUbu1ZDlfcPtDVEO6Zm9e64XYz6aGn9WveRTPg/N+fquPMFeE7T
         ZCgAz0OIFa2JaGyftfF5Rhx7paYwkND11M1jPxVhOju+5yvF+uzGcgrttISMEK2UDa59
         qvvzJIsPG53Ggj69xx6Ayy+uP5jLgL5gQhgw7JAByNl1LdhILigbJTZWWUo7zyPopcFR
         4+jfUPn08croJLXK2N/iQeZtbtoJLPwmKBp66i2t7CoZFetAA4Z1YKSflXYApp8TnRLs
         u2+g==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6hdMyaVIHoRHPj/tNeMKPhf4wBt5dYLNQoIB2MHNOmdV1vEG9D/ux6CswP0UdWZg2hUsZS8f3Vv7AwOoPRhJ5xXVEw==
X-Gm-Message-State: AOJu0YyL1K/S8W7BRTwqCdCJ2ElgZ37aJapwde1yAP9LwEm8AiaZqNvf
	Mm0NxdnhizIGfBME0x7qHGIE4cKrRqW94EIxF7eCx5TkTaA/5n1Klnv/1RiDIyvc6Rsg/Ti8Aa/
	eVvj91A==
X-Google-Smtp-Source: AGHT+IGRZ7bB9Rd9wSfHyVUbB3/tTwK9kGhukQq3NaerqGLW14qddIs8Na8NhFcz/b5szJZ/mPTFY0ftUxja
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a0d:e943:0:b0:68f:dfc2:98ee with SMTP id
 00721157ae682-6a9755e3147mr733687b3.5.1723505357680; Mon, 12 Aug 2024
 16:29:17 -0700 (PDT)
Date: Mon, 12 Aug 2024 23:29:01 +0000
In-Reply-To: <20240812232910.2026387-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240812232910.2026387-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Message-ID: <20240812232910.2026387-2-mmaurer@google.com>
Subject: [PATCH v2 1/3] kbuild: rust: Define probing macros for rustc
From: Matthew Maurer <mmaurer@google.com>
To: dvyukov@google.com, ojeda@kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: aliceryhl@google.com, samitolvanen@google.com, 
	Matthew Maurer <mmaurer@google.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Creates flag probe macro variants for `rustc`. These are helpful
because:

1. `rustc` support will soon be a minimum rather than a pinned version.
2. We already support multiple LLVMs linked into `rustc`, and these are
   needed to probe what LLVM parameters `rustc` will accept.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/Kconfig.include   |  8 ++++++++
 scripts/Makefile.compiler | 15 +++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 3500a3d62f0d..becad3d0b1fd 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -64,3 +64,11 @@ ld-version := $(shell,set -- $(ld-info) && echo $2)
 cc-option-bit = $(if-success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null,$(1))
 m32-flag := $(cc-option-bit,-m32)
 m64-flag := $(cc-option-bit,-m64)
+
+# $(rustc-option,<flag>)
+# Return y if the Rust compiler supports <flag>, n otherwise
+# Calls to this should be guarded so that they are not evaluated if
+# CONFIG_HAVE_RUST is not set.
+# If you are testing for unstable features, consider `rustc-min-version`
+# instead, as features may have different completeness while available.
+rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null -o .tmp_$$/tmp.rlib)
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 92be0c9a13ee..485d66768a32 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -72,3 +72,18 @@ clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
 # ld-option
 # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
 ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
+
+# __rustc-option
+# Usage: MY_RUSTFLAGS += $(call __rustc-option,$(RUSTC),$(MY_RUSTFLAGS),-Cinstrument-coverage,-Zinstrument-coverage)
+__rustc-option = $(call try-run,\
+	$(1) $(2) $(3) --crate-type=rlib /dev/null -o "$$TMP",$(3),$(4))
+
+# rustc-option
+# Usage: rustflags-y += $(call rustc-option,-Cinstrument-coverage,-Zinstrument-coverage)
+rustc-option = $(call __rustc-option, $(RUSTC),\
+	$(KBUILD_RUSTFLAGS),$(1),$(2))
+
+# rustc-option-yn
+# Usage: flag := $(call rustc-option-yn,-Cinstrument-coverage)
+rustc-option-yn = $(call try-run,\
+	$(RUSTC) $(KBUILD_RUSTFLAGS) $(1) --crate-type=rlib /dev/null -o "$$TMP",y,n)
-- 
2.46.0.76.ge559c4bf1a-goog

