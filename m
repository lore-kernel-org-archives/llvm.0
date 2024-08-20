Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AFE15C126
	for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 19:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724183358; cv=none; b=pJIqNOqRJOu8wIcQ3UZBfogigrf+RTxfBOoxpKgwxoISl5tZjTSC+CJSjGRAj3Ev9eW4/qOh5kcdWmOUJ7ULt8+YHXUFhTmxpCELMP8FvkbwfaPMX39nBOlclwVzlqL4Zl32oaXIX0xptgbNX42OVrg4d2rS/v086iZiBdzTMSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724183358; c=relaxed/simple;
	bh=GgcZBZ3py3YLrVIfBlwdZnVS+QKge2hV/IBQXET6NX0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uNW1tZUikrwSwrCyy8reCPgwXpSGCXmJlPZnUdJDLFNXM8so27uVvuvtQFDj4mzXlG1tv0IoLq+vu0tFiSQTMtRp57oEPDd6JkIE4Q8z3RjIwdj0aCDUPFmSgAXf6Ab85si/XIJz1FlxTdEjXoOCNUb4qa+z8KymBGLkTDeiOLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v9KJmPvJ; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v9KJmPvJ"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6addeef41a2so107114697b3.2
        for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 12:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724183356; x=1724788156; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iaH1ZLIse1MjjuwT90Rd2NUzJfAssHJQQ3PmJWNR6mE=;
        b=v9KJmPvJHd2iO/S1TwghxsYcj6OJt3ZnMP+bJwDB0N6UsEbAb96tUU6FrPMJBQeqR4
         tZ5dSChqEV/nFZmtbbc/ptQ4CKMA+URPIF8r2Gk+7NYrUBTdQfuXrnQd8W2tFbIpShKR
         ULI/NVIDwE5VgDq24y6Kw+c9TTcSnYBPqqVQ/bVsdwEI4ehXt5Jn/jtmVuHXXu4a79OF
         OVbbeNPaXTcaYtPXnFODOV1IE9vrhk+WX8slwfizfI+EcvJH9IQKJHIcGnW1CbyRkkB6
         +gythOe0vJY89toZnpXtG173c8XNOX2B4nvhkDAL7reVcbmaKddTaS3CNqNZQMKrKdrN
         uj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724183356; x=1724788156;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iaH1ZLIse1MjjuwT90Rd2NUzJfAssHJQQ3PmJWNR6mE=;
        b=kTYyvWDFrZ4BGt9kP54jqrZ3aeFu/aR6XGnxek3wblNEu4bwbpHAYzyWOujJ599+FQ
         IMNeLo4MI3+4Vba1pDPLtb6TkQSxQPZ9KrUdMpPx/qzujGxwvC5GAtAh0m6nS5WD8fYw
         QeDGOr3pzw5CNWLNuIRMSEgTSyCEse1gmVPis6vVUMWd3foX7p9YiemuRdoyTGrNO5tW
         UOhM0LSsQ8sAyoBgJRnTRMzgA/E2/133nKp6D2/8lxLnnzLLWveFfERsx/Cr61tl07C4
         Kx1Wg6bz0ycwhgHKr9Ejc4nz4H7V8sVuGxBM6RuuzvCbz0CarKthXLATWIvyuKaxM7l+
         Lh+w==
X-Forwarded-Encrypted: i=1; AJvYcCVxrwK3Sb8fBOvJO1HumqxlZAle89XdRJlKUMytnFl41d0a0upUZXc36mAmW6cwdxbPMZRr@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc0l3osBfua5Ujw6mVf5jh4yHkyelDesZunFQcDWZfsSsgihDu
	lPAyUVl8JnSPWKzGPeKMcGgVnWXGl3zEz7vxmjhiU7KNcmoVrT9Vbqi20xLR7EGJodcVGGP3s4M
	oFI3FKQ==
X-Google-Smtp-Source: AGHT+IF8OgALjQtKTTwFni7Lx7ggfIQZWs8ZGeUB4Cj9Y3JpdH2/tw6PpjEDsZeBYcnnz1TYn5eZQOxDFr9J
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:4813:b0:6be:9d4a:f097 with SMTP
 id 00721157ae682-6c0a0236c74mr8387b3.7.1724183356156; Tue, 20 Aug 2024
 12:49:16 -0700 (PDT)
Date: Tue, 20 Aug 2024 19:48:56 +0000
In-Reply-To: <20240820194910.187826-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240820194910.187826-2-mmaurer@google.com>
Subject: [PATCH v4 1/4] kbuild: rust: Define probing macros for rustc
From: Matthew Maurer <mmaurer@google.com>
To: andreyknvl@gmail.com, ojeda@kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: dvyukov@google.com, aliceryhl@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	ryabinin.a.a@gmail.com, Matthew Maurer <mmaurer@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Creates flag probe macro variants for `rustc`. These are helpful
because:

1. The kernel now supports a minimum `rustc` version rather than a
   single version.
2. `rustc` links against a range of LLVM revisions, occasionally even
   ones without an official release number. Since the availability of
   some Rust flags depends on which LLVM it has been linked against,
   probing is necessary.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/Kconfig.include   |  8 ++++++++
 scripts/Makefile.compiler | 15 +++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 3ee8ecfb8c04..bdb187af45fd 100644
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
+# CONFIG_RUST_IS_AVAILABLE is not set.
+# If you are testing for unstable features, consider testing RUSTC_VERSION
+# instead, as features may have different completeness while available.
+rustc-option = $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(RUSTC) $(1) --crate-type=rlib /dev/null --out-dir=.tmp_$$ -o .tmp_$$/tmp.rlib)
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 92be0c9a13ee..057305eae85c 100644
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
+	$(1) $(2) $(3) --crate-type=rlib /dev/null --out-dir=$$TMPOUT -o "$$TMP",$(3),$(4))
+
+# rustc-option
+# Usage: rustflags-y += $(call rustc-option,-Cinstrument-coverage,-Zinstrument-coverage)
+rustc-option = $(call __rustc-option, $(RUSTC),\
+	$(KBUILD_RUSTFLAGS),$(1),$(2))
+
+# rustc-option-yn
+# Usage: flag := $(call rustc-option-yn,-Cinstrument-coverage)
+rustc-option-yn = $(call try-run,\
+	$(RUSTC) $(KBUILD_RUSTFLAGS) $(1) --crate-type=rlib /dev/null --out-dir=$$TMPOUT -o "$$TMP",y,n)
-- 
2.46.0.184.g6999bdac58-goog

