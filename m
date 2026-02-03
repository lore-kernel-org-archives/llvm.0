Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3D0339871
	for <llvm@lists.linux.dev>; Tue,  3 Feb 2026 11:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118471; cv=none; b=AU7Lc47AszQfDaptI4dojsPWXf0vFEN+VMlyfemXp10vDhdHrzyUkfRNtZngoxl2Ywc1E2HfiywvZOREJEKGz4358O4gHqpAcY+46PvX5pqh5AjUUupQrSbVDSDKKi4/weEtendsPBYWeMraSsROuqVOR30e9rwRA/kST0jRw/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118471; c=relaxed/simple;
	bh=//P1rk5eFGynhrO1/9spa/pn1mv9PbMqJLjl3bUpxoU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ya7a9iMeRyu7GKCV+yj1Ru+adVZtSi4Jv0WtdUrHMsqDlXRM7whyZJDhxmPpxNFX66snTwkdZvlcHav+5dEhNHssyWuU+29KxTEXmgJ81uGg2ttggzv3E7o5bvNOuvENoywiJPksd34DEUBfP363a3n2bbLe0xJjPJKQjvP2dHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gd7ujV4S; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gd7ujV4S"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-430ffc4dc83so5617029f8f.3
        for <llvm@lists.linux.dev>; Tue, 03 Feb 2026 03:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770118467; x=1770723267; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aE0I4qCeFvAhyrBrsfU7k4O+fmQQ+xM6mESOeLTMWYY=;
        b=gd7ujV4S/QA67gJmH7WGHecolUV5s9K+g468GPk30XCeLmF+96ZDj27TZN2BNguS1U
         T1dc0n7Qv9ZDL8RwvhABAQ9U5hUQROsD2cYwrrDfYMapqCYhWXG1rFaGTH8+5Qfb27kO
         ulhz7rGFNiqEWWN99eJ+qyxVvYiTG9RwFnsBqmU27gncshDP6GE18Klavq2lALvMcdwV
         lvoWVy10Ed7njQtEDbMstmxkPMBqOSYPTW2ZTNUf+HJPdSZpBkmogpFOj0rCloJdqfB+
         /nb8JxFisHFmeEUMA57QZFBUnuZMaake5d2EMRYU4XZOy5MxrIBrAsXaXtAH2m9Ikxeo
         h/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770118467; x=1770723267;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aE0I4qCeFvAhyrBrsfU7k4O+fmQQ+xM6mESOeLTMWYY=;
        b=q9q65nGYUAuMHUt4kRnvnQtddvBPqRqTY0fwBF4Ds6D4GAe/v8eN9pqUC7lrIfJaMU
         9zrBncd5Sg073rHelNKFtCLQUHl6MYO+g5W0nhbrqX4g0HPwRMa80pKQopFxZtJoFPSK
         hB1PDVwK633dX/Li9GNzdxc/1F/f04Ile00cnS2HA1W8Z7g1FhJkQLf9GA2RNtX7u2wv
         4DNrgOWwuO0+mrbwbpfFkfiU6Wpa7hXY5S6R9hXDK4M+CaoNd6up39zOCrX8kNVErcYa
         J1pFA7vEk2pwKCRoXDd9eoLOnE9QWUjQM5dJQ/0OY0qQm7jBRI1/zRjhO8kHSB4ZHtVV
         XyeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4JKN9gnND/K3s7YPcfEBtB/FTF+kELDdyoGcQ2urKTCRH/M3gocG3tj0fsXg5Ad0A9gJ1@lists.linux.dev
X-Gm-Message-State: AOJu0YyKttCiyx6dK2mufIyrseLL1sF+K9luMvAZc0PZSys/Rfh/y4Iu
	4NsVexBTM3OBFqOlKQTb7Mvcwjw5LTXGtleGtoiCt2Ps0irg8QsZ4gMQJSJBTY2R4brG8GeMmct
	80RV6PmD92VT3xxkB+w==
X-Received: from wrfu10.prod.google.com ([2002:a05:6000:38a:b0:436:1564:8b38])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:26c6:b0:435:a815:dd81 with SMTP id ffacd0b85a97d-435f3a6a9e4mr23351106f8f.11.1770118466723;
 Tue, 03 Feb 2026 03:34:26 -0800 (PST)
Date: Tue, 03 Feb 2026 11:34:10 +0000
In-Reply-To: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=9996; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=ccYqFunpYUJ3E9tFyGaM8o4GOz90mNx5YokAm40heqc=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpgd09hi110q+7UOnBQB1eL+5EOe+WuCfuQr49U
 unbqQxlHpmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaYHdPQAKCRAEWL7uWMY5
 RmdyEAC8Gb4J7AKABnGI1ESN5mKs8wfRAVbeEptQbCRE5TG56C8/CwBu3BxngSIJaR/jsj4cg+v
 7E0sKl/e97o+ZFQ1e9+FgXjFE7mVT12T4WUYBVqLBjTCamAok2TTrixp+zYddUq+ccwGolxU2MY
 wBGy5AIj3hlrdI1XTXv0NYJa4I4Glhfer2cK5LuX/6pkbjv7AQywMBrJtEapUtDvygG+cs0Uz4n
 zHRznz9Xh6RSnlT17RKc8EABqA3R7Z/Y1TfSPuiYNT+i1vFhkHNGluu0cxtkBL/PEZd15dIpN9B
 CXvT+lZRPcrEVVL2fuqYe+gQgP56/sgeJvjD7jcfyJI3zXMfQpMyFC8pB+rbFKJIVG7GNB7L0Rt
 4WqgYZBp0kM9WfQ+cmN7CaAFLaSsq6PDDnQFm61oEIBCoup6Q5tW2ceX6RNTUETpSUxy80qbzu8
 Rhm7tuiSWxxpbMg+aRVGw5nFrxnliAzu/PFfSdq7Ro9SOo045XuS6+UKMlWE9o9WbFN/DB0TD9L
 w8uffrD51wqql0njRGx4d6VDYm6dS3Zi9JOQVznM/Z2AIqWquCTTwpocObwK8qDoX6PwKhb9ix/
 H5C5Hb9A4mUHv16LwURptoWOxXnWZP3I9pTQEulcrf6CnuKSZ9eQszFn5hXt60Q4x6yPGd9DXBd EsK/t8LslrkpMww==
X-Mailer: b4 0.14.2
Message-ID: <20260203-inline-helpers-v2-3-beb8547a03c9@google.com>
Subject: [PATCH v2 3/3] build: rust: provide an option to inline C helpers
 into Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Alice Ryhl <aliceryhl@google.com>, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

From: Gary Guo <gary@garyguo.net>

A new experimental Kconfig option, `RUST_INLINE_HELPERS` is added to
allow C helpers (which were created to allow Rust to call into
inline/macro C functions without having to re-implement the logic in
Rust) to be inlined into Rust crates without performing global LTO.

If the option is enabled, the following is performed:
* For helpers, instead of compiling them to an object file to be linked
  into vmlinux, they're compiled to LLVM IR bitcode. Two versions are
  generated: one for built-in code (`helpers.bc`) and one for modules
  (`helpers_module.bc`, with -DMODULE defined). This ensures that C
  macros/inlines that behave differently for modules (e.g. static calls)
  function correctly when inlined.
* When a Rust crate or object is compiled, instead of generating an
  object file, LLVM bitcode is generated.
* llvm-link is invoked with --internalize to combine the helper bitcode
  with the crate bitcode. This step is similar to LTO, but this is much
  faster since it only needs to inline the helpers.
* clang is invoked to turn the combined bitcode into a final object file.
* Since clang may produce LLVM bitcode when LTO is enabled, and objtool
  requires ELF input, $(cmd_ld_single) is invoked to ensure the object
  is converted to ELF before objtool runs.

The --internalize flag tells llvm-link to treat all symbols in
helpers.bc using `internal` linkage [1]. This matches the behavior of
`clang` on `static inline` functions, and avoids exporting the symbol
from the object file.

To ensure that RUST_INLINE_HELPERS is not incompatible with BTF, we pass
the -g0 flag when building helpers. See commit 5daa0c35a1f0 ("rust:
Disallow BTF generation with Rust + LTO") for details.

We have an intended triple mismatch of `aarch64-unknown-none` vs
`aarch64-unknown-linux-gnu`, so we pass --suppress-warnings to llvm-link
to suppress it.

We add $(cmd_ld_single) before $(cmd_objtool). Otherwise objtool fails
to parse the resulting files as Elf when CONFIG_LTO is enabled.

I considered adding some sort of check that KBUILD_MODNAME is not
present in helpers_module.bc, but this is actually not so easy to carry
out because .bc files store strings in a weird binary format, so you
cannot just grep it for a string to check whether it ended up using
KBUILD_MODNAME anywhere.

Link: https://github.com/llvm/llvm-project/pull/170397 [1]
Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Co-developed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Gary Guo <gary@garyguo.net>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 Makefile               |  3 ++-
 lib/Kconfig.debug      | 15 +++++++++++++++
 rust/Makefile          | 29 +++++++++++++++++++++++++----
 rust/exports.c         |  5 ++++-
 scripts/Makefile.build |  7 ++++++-
 5 files changed, 52 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index c97f06ee0dda1c922aa23bd5249052591d528eb6..155db03cf489d931eefdb4bd7e3b93e5aa3ea2d6 100644
--- a/Makefile
+++ b/Makefile
@@ -519,6 +519,7 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
 OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
 READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
 STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
+LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
 else
 CC		= $(CROSS_COMPILE)gcc
 LD		= $(CROSS_COMPILE)ld
@@ -627,7 +628,7 @@ export RUSTC_BOOTSTRAP := 1
 export CLIPPY_CONF_DIR := $(srctree)
 
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
-export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
+export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN LLVM_LINK
 export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
 export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 7570a694d54e6170ae6738634218b37e38a4b76a..c44c08b49f3a3c2e06fca42adeb9e04304e7a869 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3551,6 +3551,21 @@ config RUST_KERNEL_DOCTESTS
 
 	  If unsure, say N.
 
+config RUST_INLINE_HELPERS
+	bool "Inline C helpers into Rust code"
+	depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
+	depends on EXPERT
+	help
+	  Inlines C helpers into Rust code using Link Time Optimization.
+
+	  If this option is enabled, C helper functions declared in
+	  rust/helpers/ are inlined into Rust code, which is helpful for
+	  performance of Rust code. This requires a matching LLVM version for
+	  Clang and rustc.
+
+	  If you are sure that you're using Clang and rustc with matching LLVM
+	  versions, say Y. Otherwise say N.
+
 endmenu # "Rust"
 
 endmenu # Kernel hacking
diff --git a/rust/Makefile b/rust/Makefile
index 63464bd2c1e9734cd6e659f7ee3db58bf995d6dd..a6839f2d39feefcfea497384ae202a7c6b475942 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -6,15 +6,19 @@ rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
 obj-$(CONFIG_RUST) += core.o compiler_builtins.o ffi.o
 always-$(CONFIG_RUST) += exports_core_generated.h
 
+ifdef CONFIG_RUST_INLINE_HELPERS
+always-$(CONFIG_RUST) += helpers/helpers.bc helpers/helpers_module.bc
+else
+obj-$(CONFIG_RUST) += helpers/helpers.o
+always-$(CONFIG_RUST) += exports_helpers_generated.h
+endif
 # Missing prototypes are expected in the helpers since these are exported
 # for Rust only, thus there is no header nor prototypes.
-obj-$(CONFIG_RUST) += helpers/helpers.o
 CFLAGS_REMOVE_helpers/helpers.o = -Wmissing-prototypes -Wmissing-declarations
 
 always-$(CONFIG_RUST) += bindings/bindings_generated.rs bindings/bindings_helpers_generated.rs
 obj-$(CONFIG_RUST) += bindings.o pin_init.o kernel.o
-always-$(CONFIG_RUST) += exports_helpers_generated.h \
-    exports_bindings_generated.h exports_kernel_generated.h
+always-$(CONFIG_RUST) += exports_bindings_generated.h exports_kernel_generated.h
 
 always-$(CONFIG_RUST) += uapi/uapi_generated.rs
 obj-$(CONFIG_RUST) += uapi.o
@@ -480,6 +484,14 @@ $(obj)/bindings/bindings_helpers_generated.rs: private bindgen_target_extra = ;
 $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE
 	$(call if_changed_dep,bindgen)
 
+quiet_cmd_rust_helper = HELPER  $@
+      cmd_rust_helper = \
+	$(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) \
+		-c -g0 $< $(if $(filter %_module.bc,$@),-DMODULE) -emit-llvm -o $@
+
+$(obj)/helpers/helpers.bc $(obj)/helpers/helpers_module.bc: $(src)/helpers/helpers.c FORCE
+	+$(call if_changed_dep,rust_helper)
+
 rust_exports = $(NM) -p --defined-only $(1) | awk '$$2~/(T|R|D|B)/ && $$3!~/__(pfx|cfi|odr_asan)/ { printf $(2),$$3 }'
 
 quiet_cmd_exports = EXPORTS $@
@@ -561,12 +573,16 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 	OBJTREE=$(abspath $(objtree)) \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_flags)) $(rustc_target_flags) \
-		--emit=dep-info=$(depfile) --emit=obj=$@ \
+		--emit=dep-info=$(depfile) --emit=$(if $(link_helper),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) \
 		--emit=metadata=$(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \
 		--crate-type rlib -L$(objtree)/$(obj) \
 		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
 		--sysroot=/dev/null \
+	$(if $(link_helper),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
+		$(obj)/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
+		$(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@) \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
+	$(cmd_ld_single) \
 	$(cmd_objtool)
 
 rust-analyzer:
@@ -696,4 +712,9 @@ $(obj)/kernel.o: $(obj)/kernel/generated_arch_warn_asm.rs $(obj)/kernel/generate
 endif
 endif
 
+ifdef CONFIG_RUST_INLINE_HELPERS
+$(obj)/kernel.o: private link_helper = 1
+$(obj)/kernel.o: $(obj)/helpers/helpers.bc
+endif
+
 endif # CONFIG_RUST
diff --git a/rust/exports.c b/rust/exports.c
index 587f0e776aba52854080f15aa91094b55996c072..1b52460b0f4eeef6df9081abb9b7e054a28c3c21 100644
--- a/rust/exports.c
+++ b/rust/exports.c
@@ -16,10 +16,13 @@
 #define EXPORT_SYMBOL_RUST_GPL(sym) extern int sym; EXPORT_SYMBOL_GPL(sym)
 
 #include "exports_core_generated.h"
-#include "exports_helpers_generated.h"
 #include "exports_bindings_generated.h"
 #include "exports_kernel_generated.h"
 
+#ifndef CONFIG_RUST_INLINE_HELPERS
+#include "exports_helpers_generated.h"
+#endif
+
 // For modules using `rust/build_error.rs`.
 #ifdef CONFIG_RUST_BUILD_ASSERT_ALLOW
 EXPORT_SYMBOL_RUST_GPL(rust_build_error);
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 0c838c467c764e14a51ad132444544373e90a84c..7176d997ecab7c3ffd1e00400a8a79a8309485e1 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -343,7 +343,12 @@ rust_common_cmd = \
 # would not match each other.
 
 quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
-      cmd_rustc_o_rs = $(rust_common_cmd) --emit=obj=$@ $< $(cmd_objtool)
+      cmd_rustc_o_rs = $(rust_common_cmd) --emit=$(if $(CONFIG_RUST_INLINE_HELPERS),llvm-bc=$(patsubst %.o,%.bc,$@),obj=$@) $< \
+	$(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
+		$(objtree)/rust/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
+		$(CC) $(CLANG_FLAGS) $(KBUILD_CFLAGS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@) \
+	$(cmd_ld_single) \
+	$(cmd_objtool)
 
 define rule_rustc_o_rs
 	$(call cmd_and_fixdep,rustc_o_rs)

-- 
2.53.0.rc1.225.gd81095ad13-goog

