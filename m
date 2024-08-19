Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846951D6191
	for <llvm@lists.linux.dev>; Mon, 19 Aug 2024 21:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724103346; cv=none; b=GHflcAUPeWAg6f1urB4AGOkbYmBX7S3w0oXbQ1Yb7Y3ECqAdlmYmu8jVz8EX17edFrT8xeV/XKfRwGoxFW5i/H9dn5dy0pnfic3C/IPajiEqt2e4udDeeIuHQ7AGKzYrIoelnYbAG3BFu2vtZzwdXya39PoYSGRhFttuHjXHgP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724103346; c=relaxed/simple;
	bh=uOhiT0jp1CouEzn/qv7waMQHRkLl2sOBHy2Im7EqXS4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UkHGe+9qGlNaRL8jWgAK0h4COChkPjTUrKZa0ECp8QEdnAR/W/Lx0Q1aevHC+JIdwA8TFTCTtWP2fWHmynxm6arYbOzKCk09/nKgex5z+zo7bQ05CVjGnEn9Ak7mj0NVEvHyzTyVhc+MrHOn6b16uTD55iM01HLatExdLIhmHRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PMFDhs51; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PMFDhs51"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6adcb88da08so95594557b3.3
        for <llvm@lists.linux.dev>; Mon, 19 Aug 2024 14:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724103343; x=1724708143; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYHfB1jRSques99oHkY91uNPL3BC6i2xvsHR0qX5+O4=;
        b=PMFDhs51Kk87PYYT3H3PbdrYVmWQA+eeK4EfQLgvdSvboAlTBA2W8WKM4OKPOoNNxe
         LN1l6Rp9i0Aaw9B9c1sMojtpjK98loYF/c253TmT30r5Y5OEC13Dc6SpyBPqtQqPlP0G
         +CJyVQW0dRMqZzQwuCwZ1JxzQVhRe75/y4ypEpuE+ybvsgm5Vj8NgHAnjbzqjw0yAICW
         ZVxvjVQte8Tuox2fGFVqOm1ER86yJifHfiyo4qrUp5IrBAaKOEJts0iwwsq0iPXIlYX5
         OtsBRDlo6cI3JwJ4aqy7FBGA5OgTXsiw7N1qGIq6LTTnr1xozOQDv8pzZMBQlsMI0sbr
         Wcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724103343; x=1724708143;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dYHfB1jRSques99oHkY91uNPL3BC6i2xvsHR0qX5+O4=;
        b=bOJBVP1wYoc8j7QwmrcB83EdEUtDs70qlTqbgQLIjy0ExUEIQw9IjA/twvTUF22Z4x
         WgdeFHLJ8YSkASUfTUHv4mQPFCEVs2Qh9GzMk+YkNqK3kwGQIBaYTqM3sX2+AZqRNcNs
         bOhtw3wH0MlBxK7fbzOLnrAcN+nBHsjZIzz3h0xsdpBdnYcV116oftRbzZHc9p2ErGFX
         0dtpbqrcqWlOCjnAGYzOH2ZjFXYnY8pmHOMo6snCXNovexugOd/vNxdB5puh0LeyL4us
         3WVAdCbUIoBwczS2TS9HD2OeiC8aWpTcfNZ5JVew8KUzEKmNQr/aTRpOK5ekstnek6cU
         vDUg==
X-Forwarded-Encrypted: i=1; AJvYcCW76BkLnzsfRxqGGy2qcNXaxijwKkf4w8a/8ircouOECg0HgQXHjLRlApfYwB0mdrKDsMmLmGoYAzEUcdY4TywEJP4YPg==
X-Gm-Message-State: AOJu0YyIeJxgEoCuVJdzBQiKQhHETww5fsKPAgyDON8qXhifw+4ldoM9
	4L0buPDlx8lO/umf7cvJ5JpoOO3kLd++KPvCa5WMQ82g/beqfb/rhGg+VsxvdC/LqNUrpYNjqbI
	pxpDtGw==
X-Google-Smtp-Source: AGHT+IFwshO87RfhTzH1yMuE+dB46zbPZ1Eu9OzIlegM79V4EtZO9MXEpG14lmgTuz2TbiBW6ciN753E2AAE
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:2912:b0:62f:f535:f41 with SMTP id
 00721157ae682-6b1bc5e4037mr4097737b3.9.1724103343636; Mon, 19 Aug 2024
 14:35:43 -0700 (PDT)
Date: Mon, 19 Aug 2024 21:35:19 +0000
In-Reply-To: <20240819213534.4080408-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240819213534.4080408-2-mmaurer@google.com>
Subject: [PATCH v3 1/4] kbuild: rust: Define probing macros for rustc
From: Matthew Maurer <mmaurer@google.com>
To: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: aliceryhl@google.com, samitolvanen@google.com, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, glider@google.com, ryabinin.a.a@gmail.com, 
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
index 3ee8ecfb8c04..ffafe269fe9e 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -63,3 +63,11 @@ ld-version := $(shell,set -- $(ld-info) && echo $2)
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
2.46.0.184.g6999bdac58-goog

