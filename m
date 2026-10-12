Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C405375F8E
	for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 13:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812528; cv=none; b=AEhDg4vchMWXaZAg5IffI4yZxxhivAdwXDW8vq0lZJZMTkV6Yy7nYuBqUyrW2dr0TaqF/c/ttQIHrjqxmj3JhfG+94SiWxM7md+hwwNn4gdFfk74Sz66LbgsqKQp0BPrBMue2HIK7jaINQ3i+VzNP8WKTI9bnFHlqTZll2Q70rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812528; c=relaxed/simple;
	bh=834HCsT+yG6FoiMCNmsSF0KuEbbYNjXGWtFDC+r4/lU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=rYBuWviqM+4SxUZElIvLxlmMTV0W3sQhoBen/Nt0EeloOjBD1z1EHoMeYV02kd3k3Obk1/iYn9o0WghNJ64sYuzei8Oq9wF2SsSqNbHPgV3mqHtslDrY0TZwJroyaCOZXYButd+Ta26G2XOig9Zf/TcaJwzw7fMFvul4T9u4nNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZSSmGy4G; arc=none smtp.client-ip=209.85.128.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZSSmGy4G"
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a028616bebso12849645e9.1
        for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 06:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791812525; x=1792417325; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PWBgbU9wWHlrfBumGJ2ey37GLEs4mFig313aUL/JPgY=;
        b=ZSSmGy4GM01Sm5ty8zznachJpmmDkXUsQRIqyGejrMeyaeG8XYbE7smvd3KICZnI8a
         rwHwNdhmswAgKeOS061k75FpWX7cvqWGWO7Wv89P7nFz1KWwKq79jVRNhtMFqzpndMTJ
         uS3N/P/DC6j10UALY6uKld1AejGSnYhvxiMtyGPyQm22JNxCaxmMVGiabyUAfXkqH+gJ
         uBwAtzYLDOEOzCS16S9iLktuuy79EtT2sEzoGw5+njojN1zfxPpA5dCVEc4SsWeIQsKL
         Xm1QkYza8YExhbedSutQ2bmTIOC8Qbt9zmv7UDchoYC7JFQSwOFSwbFnEncjhonfR5ni
         qPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812525; x=1792417325;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWBgbU9wWHlrfBumGJ2ey37GLEs4mFig313aUL/JPgY=;
        b=LPgDKGRljDDv563vQEBzHgfcFcJ3lEjyfbtkyF4CoqKtHXqfhoph+Ut0NNVhopH75o
         yPZuPLmD+nKQgnzexxrrIxZfW353c10ee+Bqc53UdkusqYm3QlVuloVgldS4pqOTFopI
         KiQw3eB1fZAuz7XeYGjbrUZdpSoNDHboGuGHGEW5F1PJi1AtyhMRy/0WBsNB2XIvnq0j
         fPh9s8cr7WxZBxFR9hG4QnvOXLFf3OQmLFD0jSFiKWPe56ERW3t89N2lY81dSyivtQPq
         qCIU066VpVIY3UX1k11TJjkkXyvdgzK2OakqDmvN5JmYTOY1VfvpAUmpIVbPEKU+aC0a
         MRjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvTUhkm3CDuxBBEcgQxco+pPDWFHIY7QYVrRliDoePN/xsN7YhM9khZydkZREnxKflu4Ui@lists.linux.dev
X-Gm-Message-State: AFq9FYLucbO2FmD54yoYcX0SC5jtJ7MS6D6OJkPrYByU0qnMRiXkjVW2
	PVku2dTOB+1ElujSeI2kbQpLXoslogMU4yIVU7gnHQLu54pBUCH+Ay05M2m5AbfVSsJWeB77Mqx
	xXQ==
X-Received: from wmrp18.prod.google.com ([2002:a05:600c:8a92:b0:4a1:9311:9d1d])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8518:b0:49f:cbf3:551c
 with SMTP id 5b1f17b1804b1-4a18e4a8ca6mr166715615e9.12.1791812524523; Mon, 12
 Oct 2026 06:42:04 -0700 (PDT)
Date: Mon, 12 Oct 2026 13:39:14 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261012134159.912183-1-elver@google.com>
Subject: [PATCH 1/2] kbuild: rust: enable KCSAN support
From: Marco Elver <elver@google.com>
To: elver@google.com, Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>
Cc: Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Rust supports ThreadSanitizer instrumentation via LLVM, which is what
KCSAN relies on; however, Rust code is not currently instrumented.

Pass -Zsanitizer=thread and the same TSan backend options used for C
code to rustc. Wire up KCSAN_SANITIZE in scripts/Makefile.lib for parity
with C (though rustc currently rejects linking crates with mismatched
instrumentation).

rustc only accepts -Zsanitizer=thread for targets that declare support
for it. Of the targets used by the kernel, this is only possible for the
generated x86_64 target specification, so restrict instrumentation of
Rust code to x86_64 for now via HAVE_KCSAN_RUSTC. On other architectures
Rust code remains uninstrumented as before.

All TSan options used are supported by the LLVM versions of the minimum
supported rustc, so no rustc-option checks are needed (they would also
fail, because x86_64-unknown-none used for option checks does not
support -Zsanitizer=thread).

With this enabled we can detect data races in kernel Rust code and
between Rust and C code.

Signed-off-by: Marco Elver <elver@google.com>
---
 Documentation/dev-tools/kcsan.rst |  7 +++++++
 lib/Kconfig.kcsan                 |  7 +++++++
 scripts/Makefile.kcsan            | 13 +++++++++++++
 scripts/Makefile.lib              |  3 +++
 scripts/generate_rust_target.rs   |  2 +-
 5 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kcsan.rst b/Documentation/dev-tools/kcsan.rst
index 8575178aa87f..3bb8754f844b 100644
--- a/Documentation/dev-tools/kcsan.rst
+++ b/Documentation/dev-tools/kcsan.rst
@@ -14,6 +14,9 @@ Usage
 KCSAN is supported by both GCC and Clang. With GCC we require version 11 or
 later, and with Clang also require version 11 or later.
 
+Rust code is instrumented as well on architectures whose Rust target supports
+it (currently only x86_64; see ``CONFIG_HAVE_KCSAN_RUSTC``).
+
 To enable KCSAN configure the kernel with::
 
     CONFIG_KCSAN = y
@@ -121,6 +124,10 @@ the below options are available:
 
     KCSAN_SANITIZE := n
 
+  Note that ``rustc`` rejects linking crates built with and without KCSAN
+  instrumentation, so ``KCSAN_SANITIZE`` and ``KCSAN_SANITIZE_<target>.o``
+  cannot currently be used for Rust code.
+
 .. _"Marking Shared-Memory Accesses" in the LKMM: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/memory-model/Documentation/access-marking.txt
 
 Furthermore, it is possible to tell KCSAN to show or hide entire classes of
diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
index 4ce4b0c0109c..f0096e1c8b61 100644
--- a/lib/Kconfig.kcsan
+++ b/lib/Kconfig.kcsan
@@ -10,6 +10,13 @@ config HAVE_KCSAN_COMPILER
 	  For the list of compilers that support KCSAN, please see
 	  <file:Documentation/dev-tools/kcsan.rst>.
 
+config HAVE_KCSAN_RUSTC
+	def_bool RUST && X86_64
+	help
+	  rustc only accepts -Zsanitizer=thread for targets that declare
+	  support for it; of the kernel's Rust targets, only x86_64 does.
+	  Elsewhere, Rust code is not instrumented.
+
 menuconfig KCSAN
 	bool "KCSAN: dynamic data race detector"
 	depends on HAVE_ARCH_KCSAN && HAVE_KCSAN_COMPILER
diff --git a/scripts/Makefile.kcsan b/scripts/Makefile.kcsan
index 19f693b68a96..01af6fd71006 100644
--- a/scripts/Makefile.kcsan
+++ b/scripts/Makefile.kcsan
@@ -24,3 +24,16 @@ kcsan-cflags += $(call cc-option,$(call cc-param,tsan-instrument-func-entry-exit
 endif
 
 export CFLAGS_KCSAN := $(kcsan-cflags)
+
+ifdef CONFIG_HAVE_KCSAN_RUSTC
+# The minimum supported rustc's LLVM supports all of these options.
+rustc-param = -Cllvm-args=-$(1)
+kcsan-rustflags := -Zsanitizer=thread \
+	$(call rustc-param,tsan-compound-read-before-write=1) \
+	$(call rustc-param,tsan-distinguish-volatile=1)
+ifndef CONFIG_KCSAN_WEAK_MEMORY
+kcsan-rustflags += $(call rustc-param,tsan-instrument-func-entry-exit=0)
+endif
+endif
+
+export RUSTFLAGS_KCSAN := $(kcsan-rustflags)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0a4fdd8bd975..78f1c23e54be 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -98,6 +98,9 @@ ifeq ($(CONFIG_KCSAN),y)
 _c_flags += $(if $(patsubst n%,, \
 	$(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-object)), \
 	$(CFLAGS_KCSAN))
+_rust_flags += $(if $(patsubst n%,, \
+	$(KCSAN_SANITIZE_$(target-stem).o)$(KCSAN_SANITIZE)$(is-kernel-object)), \
+	$(RUSTFLAGS_KCSAN))
 # Some uninstrumented files provide implied barriers required to avoid false
 # positives: set KCSAN_INSTRUMENT_BARRIERS for barrier instrumentation only.
 _c_flags += $(if $(patsubst n%,, \
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 7687b0dd5474..4b02bffa6b46 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -231,7 +231,7 @@ fn main() {
         }
         ts.push("features", features);
         ts.push("llvm-target", "x86_64-linux-gnu");
-        ts.push("supported-sanitizers", ["kcfi", "kernel-address"]);
+        ts.push("supported-sanitizers", ["kcfi", "kernel-address", "thread"]);
         if cfg.rustc_version_atleast(1, 91, 0) {
             ts.push("target-pointer-width", 64);
         } else {
-- 
2.56.0.385.gd3acb90ef8-goog

