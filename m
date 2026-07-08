Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F91402428
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499135; cv=none; b=pRSt0RXhhMeA+BCtjV6JHw3BRzcp2UnnlRF2d6PJKequHBcVqHcQuW/9yza/afEklsPvCvwteX+CCoyP9rB1PKShJhW7NmfWjZGj5gyhckFP/BSJG7NauW96HY57Wu8Y2IyW0gcz3liPu/0UUZYlseSV0Ws/KdQBowIevxK8tts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499135; c=relaxed/simple;
	bh=uV4k2f8/fiWG5QwZfIZIbmPLrhF5ER9yMDh4lwxe6QU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bkNllIplR9k5U/SkaxrSewFj7qk8z3dWy37ram2MW2MWEITwfIi6QOvEMKfSYkawFo18MP51jbzGzp1KQtF2my3uwzcb/OI/BeR+2tymsUJAFkzt4jS5sC+G9SXUhHb5akLIvx+/Jqe7LH5aqieo9A/bBEkepoVFndmRfbQk2JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Votcnf8Y; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Votcnf8Y"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-382ef647e20so459045a91.1
        for <llvm@lists.linux.dev>; Wed, 08 Jul 2026 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499124; x=1784103924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kqHcDJLpqtPG3b1h3n4CGDV6Uky+owIJPUMSqpt6iVU=;
        b=Votcnf8YVx911nTbSBESGCIG1WzbZHBLxz1nXubBg+8R+5pXB4ppfofjKCOYQNjRSk
         kszUgCYOjuFyQXcuaCeJzxZBf0j4c/kZVWKDyAbYSHnSY+qrYdId0idK8eFPNXPIoX+5
         NyKzqGAlqYOAhLCn8RsSJ2HD2WCmfs0WddCh/kFhBaxuPY1H4wGmbg8MkGym/5tB7WFN
         WvvvxA93iQSlUrTUYVs4+qBqODRhsCFGU4jFtGLUPqJJ3QwZ6NvPRGdGFKNrrv56KY9+
         qml/aNJrqxt7xnQoIzCRhi96QW3ZIOHOJThB02XPr+UnCY9JOgi9BReuZHkIkBj6axrJ
         xTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499124; x=1784103924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kqHcDJLpqtPG3b1h3n4CGDV6Uky+owIJPUMSqpt6iVU=;
        b=pqCk4STCyg+JbVLoaiRqfbHSrJz2B6ZMty2Yv8SoEfogWimaH8uEl4k7EqqRwyW5wd
         +SrxInaYwP93j3AJxmSDebJs2e/kDKjyRpNAk9oRkHgBWHe+nk3B0vL2B9FyECcMD55m
         2gE6tbEeCyjyfVopDmVTmTgOSDsGpmZRo6N5QEgA1eHQ4qJjuipx0EJMt2LekzJ1qYvg
         w9u3cPxoa+tXZu7j4QS5U7/0EI1p82zwzXACkOv8e2JBa1kseLOow69N9e4zbrEHCq+v
         xBmwXYX68eiQt+2o9T6wANS+mXIn5iPmu50c+bOeAbRUi4Iu10pHVe4sRwdl/kQNPxRE
         0O+Q==
X-Forwarded-Encrypted: i=1; AHgh+RqTJVp8i1KHKgbkiU0usQRXt66asS6erQiBCpIThhoJMWCAtdIwe9u7QmeBh/CVVZHB1Uhi@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6R1XA4GpDcnjjU2k2uHRs6t2EuFrnw7lu+9dSA+uHJtWIZCoI
	rKyOUmzsSzJoFwKMJCyvFB77QHIZP/eHxxmiBiPdOOkLjwkJARtFsodS
X-Gm-Gg: AfdE7ck3GFT1K/jAFf2+yD4JiA/BVVXMkb+sXmBHLsUM/hFR4qaX2MaCZ4eUy/31IAH
	juj2UNXlcIJa+onCxkjs/5Fn7VkCKf/dF/6kkJB2R2906sMxId9aMAI9p9U6EdiyRz7XO+1yOec
	REzmrdYBOlaaGjR9sqLBvqGAIVX8leZWsDUvZYnLaAriVnDK4eBAZwi2gLtXkk47NdngbaoF75l
	F3RazSOz4X5nJ0J0ISUHKV5lOxrtdjftBCpxx5xP3W4UtKrRXchzYP6oI6hbtSnaj29VFTY7Q39
	JtlEfPCYuEsw5Ga/1kGCLSp3XcJCruEHzzyy08jvsCXJf/fvuFNlhij6jg5a3M4+tfo8a68atHe
	TQgw6tYQRyy54sNAZ9VgIm02IqeTu/xgV8emzsoMWBp3TlJVqNzOdKP4xmhwDXaXCgMgri2A9w/
	G0syDc7AtOqR3u/8LBQ9IpzlGCd1awYTI0P64Da3Y/14RxOU1QgSq9RZN18Xsgt/3VQg==
X-Received: by 2002:a05:6a20:5482:b0:3b3:be1f:c89b with SMTP id adf61e73a8af0-3c0bcff89edmr1826587637.22.1783499123695;
        Wed, 08 Jul 2026 01:25:23 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:25:23 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V17 1/7] rust: Fix "multiple candidates for rmeta dependency core" error
Date: Wed,  8 Jul 2026 13:54:48 +0530
Message-ID: <20260708082454.1254320-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708082454.1254320-1-mkchauras@gmail.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building Rust code for powerpc64le with LLVM=1 and -j1, rustc
encounters an error: "multiple candidates for `rmeta` dependency `core`
found", with two candidates:
1. The host's standard library from the rustup toolchain
2. The kernel's custom libcore.rmeta in the rust/ directory

This occurs because the build system uses `-L$(objtree)/rust` for host
library builds (proc_macro2, quote, syn), which causes rustc to search
the rust/ directory. During this search, rustc finds both the kernel's
custom libcore.rmeta and gains access to the host's standard library,
creating a conflict.

The solution is to separate host libraries into a dedicated rust/host/
subdirectory and use `-L$(objtree)/rust/host` for host builds instead
of `-L$(objtree)/rust`. This ensures that:

1. Host library builds (proc_macro2, quote, syn) only search rust/host/
   and never encounter the kernel's libcore.rmeta
2. Proc macro builds use `-L$(objtree)/rust/host` to find their
   dependencies

Special handling is added for rustdoc-pin_init, which is a host build
(to access the alloc crate) but depends on proc macros from the main
rust/ directory. It uses explicit `--extern` paths to reference the
proc macros without adding `-L$(objtree)/rust`, which would reintroduce
the conflict.

The rust/host/ directory is added to clean-files to ensure it's removed
during `make clean`.

Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/Makefile | 42 +++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index a870d1616c71..17b2f329c13d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -3,6 +3,9 @@
 # Where to place rustdoc generated documentation
 rustdoc_output := $(objtree)/Documentation/output/rust/rustdoc
 
+# Clean generated host directory
+clean-files := host/
+
 obj-$(CONFIG_RUST) += core.o compiler_builtins.o ffi.o
 always-$(CONFIG_RUST) += exports_core_generated.h
 
@@ -33,7 +36,7 @@ endif
 
 obj-$(CONFIG_RUST) += exports.o
 
-always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib libsyn.rlib
+always-$(CONFIG_RUST) += host/libproc_macro2.rlib host/libquote.rlib host/libsyn.rlib
 
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
@@ -163,7 +166,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
 	$(rustc_target_envs) \
 	OBJTREE=$(abspath $(objtree)) \
 	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-scope=%,$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
-		$(rustc_target_flags) -L$(objtree)/$(obj) \
+		$(rustc_target_flags) -L$(objtree)/$(obj)$(if $(rustdoc_host),/host) \
 		-Zunstable-options --generate-link-to-definition \
 		--output $(rustdoc_output) \
 		--crate-name $(subst rustdoc-,,$@) \
@@ -261,6 +264,7 @@ rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
 
 rustdoc-pin_init: private rustdoc_host = yes
 rustdoc-pin_init: private rustc_target_flags = $(pin_init-flags) \
+    --extern pin_init_internal=$(objtree)/$(obj)/$(libpin_init_internal_name) \
     --extern alloc --cfg feature=\"alloc\"
 rustdoc-pin_init: $(src)/pin-init/src/lib.rs rustdoc-pin_init_internal \
     rustdoc-macros FORCE
@@ -572,23 +576,23 @@ quiet_cmd_rustc_procmacrolibrary = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_Q
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
 		--emit=dep-info=$(depfile) --emit=link=$@ --crate-type rlib -O \
-		--out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
+		--out-dir $(objtree)/$(obj)/host -L$(objtree)/$(obj)/host \
 		--crate-name $(patsubst lib%.rlib,%,$(notdir $@)) $<
 
-$(obj)/libproc_macro2.rlib: private skip_clippy = 1
-$(obj)/libproc_macro2.rlib: private rustc_target_flags = $(proc_macro2-flags)
-$(obj)/libproc_macro2.rlib: $(src)/proc-macro2/lib.rs FORCE
+$(obj)/host/libproc_macro2.rlib: private skip_clippy = 1
+$(obj)/host/libproc_macro2.rlib: private rustc_target_flags = $(proc_macro2-flags)
+$(obj)/host/libproc_macro2.rlib: $(src)/proc-macro2/lib.rs FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
-$(obj)/libquote.rlib: private skip_clippy = 1
-$(obj)/libquote.rlib: private skip_flags = $(quote-skip_flags)
-$(obj)/libquote.rlib: private rustc_target_flags = $(quote-flags)
-$(obj)/libquote.rlib: $(src)/quote/lib.rs $(obj)/libproc_macro2.rlib FORCE
+$(obj)/host/libquote.rlib: private skip_clippy = 1
+$(obj)/host/libquote.rlib: private skip_flags = $(quote-skip_flags)
+$(obj)/host/libquote.rlib: private rustc_target_flags = $(quote-flags)
+$(obj)/host/libquote.rlib: $(src)/quote/lib.rs $(obj)/host/libproc_macro2.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
-$(obj)/libsyn.rlib: private skip_clippy = 1
-$(obj)/libsyn.rlib: private rustc_target_flags = $(syn-flags)
-$(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
+$(obj)/host/libsyn.rlib: private skip_clippy = 1
+$(obj)/host/libsyn.rlib: private rustc_target_flags = $(syn-flags)
+$(obj)/host/libsyn.rlib: $(src)/syn/lib.rs $(obj)/host/libquote.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
 quiet_cmd_rustc_procmacro = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) P $@
@@ -598,26 +602,26 @@ quiet_cmd_rustc_procmacro = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET))
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
-		--crate-type proc-macro -L$(objtree)/$(obj) \
+		--crate-type proc-macro -L$(objtree)/$(obj)/host \
 		--crate-name $(patsubst lib%.$(procmacro-extension),%,$(notdir $@)) \
 		@$(objtree)/include/generated/rustc_cfg $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
 $(obj)/$(libzerocopy_derive_name): private skip_clippy = 1
 $(obj)/$(libzerocopy_derive_name): private rustc_target_flags = $(zerocopy_derive-flags)
-$(obj)/$(libzerocopy_derive_name): $(src)/zerocopy-derive/lib.rs $(obj)/libproc_macro2.rlib \
-    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
+$(obj)/$(libzerocopy_derive_name): $(src)/zerocopy-derive/lib.rs $(obj)/host/libproc_macro2.rlib \
+    $(obj)/host/libquote.rlib $(obj)/host/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 $(obj)/$(libmacros_name): private rustc_target_flags = \
     --extern proc_macro2 --extern quote --extern syn
-$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
-    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
+$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/host/libproc_macro2.rlib \
+    $(obj)/host/libquote.rlib $(obj)/host/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 $(obj)/$(libpin_init_internal_name): private rustc_target_flags = $(pin_init_internal-flags)
 $(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs \
-    $(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
+    $(obj)/host/libproc_macro2.rlib $(obj)/host/libquote.rlib $(obj)/host/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 # `rustc` requires `-Zunstable-options` to use custom target specifications
-- 
2.55.0

