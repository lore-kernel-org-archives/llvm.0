Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6214A2E54B6
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 20:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775505735; cv=none; b=FFaZh9VsLgLl+UfRI5Jl5NjJ04WpXCb6LpWpREsSVxvlRek+HxhqbhsrPWEH0C/7uIamPqdZjwUTgn8XduwX2VaaPffm/MG/fE6ON0Pqnzr3qjTv4hwpP7tcspBxUEPQ/uULPeanvIETPhkKqeWPEWGKhzoesujWtxB++W1TJ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775505735; c=relaxed/simple;
	bh=aJyqZgEiU7gadN2ONUZgp8589ILXEazRUR3likQHx7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ByTobmVRNfRE+N9yeurxtH6abqpalGfjAJBM0nkGizGnO6896ix4jKy4ZcfT8iEjmL2RHi5AnJdoit+/4PM/OmVrDUzdfCmg7+1T54zEKgQcOIRwJYnyWs6jR9735htcQ/XiJ1/XQRUrmkoE97UPO8ynT/POS/GfIHtrtWpuobQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMs3Qtjl; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMs3Qtjl"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b2ae8a0103so445835ad.0
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 13:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775505733; x=1776110533; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPSLhEO/t1n98OrRH4+WlgtQBOSzWDBbT00u5q2kC9Y=;
        b=cMs3Qtjl2ddHmRsuLsapUKtpWwf9AQwrZd/GloglmkZIN+d+AOP0cOl7ExToE2EjQy
         lXBcofn7VfpuvHCD13iraAybeMswTeg6jnN5AMSEObpsJDLZPxrgD/bBxM/8l0Pmn8la
         /t9DqUW2jHJe5/Yi7LORmekSwPoZjxfJk22ODJq98JLRnzPejMHSJUIabGQzc3DzCVT7
         6/EIWkoAYXXgj8a1+LXMy9B2jGHsPnjfYFmKdCJxElZkardcVs3ukhvhFZ4kX7tVeAO0
         FrcA+ZAt9byxmxhEZA9dmMKuAP5x9S7T27EqtITYa4khNMXJpL9NROAJ6h5gXmXTcLr6
         Z4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775505733; x=1776110533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lPSLhEO/t1n98OrRH4+WlgtQBOSzWDBbT00u5q2kC9Y=;
        b=BMxZ75bsbSs8ZwixZwVzgWsIS8tkANgOu0MMmHinbNXQT+RPyttiLFrfDoMjFWZvB/
         nwsAPxNltKoqjzb81fWkps85Ho02I69huZj1kMCEn95Y+L7vTmadQo5m9MrFQXIIVGro
         0NPVBsAOExTWZGB0hc+NxeVWfgTaVYes8GtdyjHlRC+rEtlhWzGLDGgLNthur4GTqLIQ
         IFfZN64IBGxPdG0AcaWJ09gAykHdWUTrOgCyk6N56Z4tKZijkJi5OCG5dp4iylD4Kp+u
         Z02evWyyTba2pGBHuvFhVQlEBr+LMDpIQTXxSO7dbDbZSu7cTUo9QhjbkKRTsf3qRZwH
         TWhw==
X-Forwarded-Encrypted: i=1; AJvYcCVVzY9mFI8vzhJTY5C4u7MWxaZfUO586zbncs1iLyJ110EVcniOukTZ5vdXSeq+2Es/3doC@lists.linux.dev
X-Gm-Message-State: AOJu0YxZUcXWorb7fcTxieklBG40/+PCXkK8kwLGVkOOmAm8L+tytywX
	ECNX7Jd22PBb/Dz+gtpbVF4bTiZBYWCguOwryMnFYoAFhSBQtf2qEg+i
X-Gm-Gg: AeBDieslyycl0rRFFnzsGsG0w1/CQj6kwhjhiq4uCwLsB3k5QeIBS3zDrYkhFCnTTiA
	NBazZl2u+6VweYpaM5+Hm6Jv+dGeTVO9vughFYiZOpAnP3r1TIur1DcPTXJXPEnYME+HIi0x0eq
	RcEW6OgUA2ieiNcImV5bIrBpIxGy9dqKCcP4rwTHvNq/269BEwBdmC5ceCbvDsrDQ7iTV9TTvq/
	wqWg3aUw946M6e0BL6KSpqeAYvcUxnEDgNf+tQl4jpIOiKHJEzWkVnhCzwEv9njJzWloJ2PnfzQ
	/RDJ0jyagm78QJ5V/iXuru3ylI6TOVYDb9glbxdLpOCWzzesUzvbB6m8wF2I28VbOnFE0Cc/5fe
	HwlVG5NlbsH+cUa2EbwbIxnPs4+i/AiMUkj+6KuJJnk/82GQZASUVVmwptMQbq9kAa6V1yGuwdu
	1YzkFCcm/F/cBeEKp3KH2DzF38Vz+tomgDd2uoiRobmNmzTYBzPeX8OLS/UZZjwW3fX5a7jvTie
	Yw=
X-Received: by 2002:a17:903:3b8f:b0:2ae:cb0e:fd59 with SMTP id d9443c01a7336-2b28164cfebmr148221295ad.8.1775505732659;
        Mon, 06 Apr 2026 13:02:12 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af26sm151098205ad.49.2026.04.06.13.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:02:12 -0700 (PDT)
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
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V10 1/4] rust: Separate host libraries to fix rmeta dependency conflict
Date: Tue,  7 Apr 2026 01:31:46 +0530
Message-ID: <20260406200149.3727922-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406200149.3727922-1-mkchauras@gmail.com>
References: <20260406200149.3727922-1-mkchauras@gmail.com>
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

Separate all host-side build artifacts (host libraries and proc macros)
into a dedicated rust/host/ subdirectory and use `-L$(objtree)/rust/host`
for host builds. This ensures host builds only search rust/host/ and
never encounter the kernel's libcore.rmeta.

The `--out-dir` flag is removed from cmd_rustc_procmacrolibrary because
the output directory is now created explicitly with `mkdir -p $(dir $@)`
and the output file path is specified directly with `--emit=link=$@`,
making `--out-dir` redundant.

Moving the proc macros (libmacros and libpin_init_internal) to rust/host/
eliminates the need for special handling in rustdoc-pin_init, which can
now use the pin_init-flags variable directly instead of duplicating the
flags with absolute paths.

The rust/host/ directory is added to clean-files to ensure it's removed
during `make clean`.

Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/Makefile | 56 +++++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 9801af2e1e02..d8f34c4858b8 100644
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
 
@@ -27,7 +30,7 @@ endif
 
 obj-$(CONFIG_RUST) += exports.o
 
-always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib libsyn.rlib
+always-$(CONFIG_RUST) += host/libproc_macro2.rlib host/libquote.rlib host/libsyn.rlib
 
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
@@ -49,7 +52,7 @@ libmacros_extension := $(patsubst libmacros.%,%,$(libmacros_name))
 libpin_init_internal_name := $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name pin_init_internal --crate-type proc-macro - </dev/null)
 libpin_init_internal_extension := $(patsubst libpin_init_internal.%,%,$(libpin_init_internal_name))
 
-always-$(CONFIG_RUST) += $(libmacros_name) $(libpin_init_internal_name)
+always-$(CONFIG_RUST) += host/$(libmacros_name) host/$(libpin_init_internal_name)
 
 # `$(rust_flags)` is passed in case the user added `--sysroot`.
 rustc_sysroot := $(shell MAKEFLAGS= $(RUSTC) $(rust_flags) --print sysroot)
@@ -150,7 +153,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
 	OBJTREE=$(abspath $(objtree)) \
 	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-prefix=% --remap-path-scope=%, \
 			$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
-		$(rustc_target_flags) -L$(objtree)/$(obj) \
+		$(rustc_target_flags) -L$(objtree)/$(obj)$(if $(rustdoc_host),/host) \
 		-Zunstable-options --generate-link-to-definition \
 		--output $(rustdoc_output) \
 		--crate-name $(subst rustdoc-,,$@) \
@@ -247,7 +250,7 @@ rustdoc-kernel: private rustc_target_flags = --extern ffi --extern pin_init \
     --extern build_error --extern macros \
     --extern bindings --extern uapi
 rustdoc-kernel: $(src)/kernel/lib.rs rustdoc-core rustdoc-ffi rustdoc-macros \
-    rustdoc-pin_init rustdoc-compiler_builtins $(obj)/$(libmacros_name) \
+    rustdoc-pin_init rustdoc-compiler_builtins $(obj)/host/$(libmacros_name) \
     $(obj)/bindings.o FORCE
 	+$(call if_changed,rustdoc)
 
@@ -299,14 +302,14 @@ rusttestlib-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
 
 rusttestlib-pin_init: private rustc_target_flags = $(pin_init-flags)
 rusttestlib-pin_init: $(src)/pin-init/src/lib.rs rusttestlib-macros \
-    rusttestlib-pin_init_internal $(obj)/$(libpin_init_internal_name) FORCE
+    rusttestlib-pin_init_internal $(obj)/host/$(libpin_init_internal_name) FORCE
 	+$(call if_changed,rustc_test_library)
 
 rusttestlib-kernel: private rustc_target_flags = --extern ffi \
     --extern build_error --extern macros --extern pin_init \
     --extern bindings --extern uapi
 rusttestlib-kernel: $(src)/kernel/lib.rs rusttestlib-bindings rusttestlib-uapi \
-    rusttestlib-build_error rusttestlib-pin_init $(obj)/$(libmacros_name) \
+    rusttestlib-build_error rusttestlib-pin_init $(obj)/host/$(libmacros_name) \
     $(obj)/bindings.o FORCE
 	+$(call if_changed,rustc_test_library)
 
@@ -525,26 +528,27 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 
 quiet_cmd_rustc_procmacrolibrary = $(RUSTC_OR_CLIPPY_QUIET) PL $@
       cmd_rustc_procmacrolibrary = \
+	mkdir -p $(dir $@); \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
 		--emit=dep-info=$(depfile) --emit=link=$@ --crate-type rlib -O \
-		--out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
+		-L$(objtree)/$(obj)/host \
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
 
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
@@ -553,20 +557,20 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
-		--crate-type proc-macro -L$(objtree)/$(obj) \
+		--crate-type proc-macro -L$(objtree)/$(obj)/host \
 		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) \
 		@$(objtree)/include/generated/rustc_cfg $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
-$(obj)/$(libmacros_name): private rustc_target_flags = \
+$(obj)/host/$(libmacros_name): private rustc_target_flags = \
     --extern proc_macro2 --extern quote --extern syn
-$(obj)/$(libmacros_name): $(src)/macros/lib.rs $(obj)/libproc_macro2.rlib \
-    $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
+$(obj)/host/$(libmacros_name): $(src)/macros/lib.rs $(obj)/host/libproc_macro2.rlib \
+    $(obj)/host/libquote.rlib $(obj)/host/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
-$(obj)/$(libpin_init_internal_name): private rustc_target_flags = $(pin_init_internal-flags)
-$(obj)/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs \
-    $(obj)/libproc_macro2.rlib $(obj)/libquote.rlib $(obj)/libsyn.rlib FORCE
+$(obj)/host/$(libpin_init_internal_name): private rustc_target_flags = $(pin_init_internal-flags)
+$(obj)/host/$(libpin_init_internal_name): $(src)/pin-init/internal/src/lib.rs \
+    $(obj)/host/libproc_macro2.rlib $(obj)/host/libquote.rlib $(obj)/host/libsyn.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacro)
 
 # `rustc` requires `-Zunstable-options` to use custom target specifications
@@ -665,7 +669,7 @@ $(obj)/compiler_builtins.o: $(src)/compiler_builtins.rs $(obj)/core.o FORCE
 $(obj)/pin_init.o: private skip_gendwarfksyms = 1
 $(obj)/pin_init.o: private rustc_target_flags = $(pin_init-flags)
 $(obj)/pin_init.o: $(src)/pin-init/src/lib.rs $(obj)/compiler_builtins.o \
-    $(obj)/$(libpin_init_internal_name) $(obj)/$(libmacros_name) FORCE
+    $(obj)/host/$(libpin_init_internal_name) $(obj)/host/$(libmacros_name) FORCE
 	+$(call if_changed_rule,rustc_library)
 
 # Even if normally `build_error` is not a kernel object, it should still be
@@ -699,7 +703,7 @@ $(obj)/uapi.o: $(src)/uapi/lib.rs \
 $(obj)/kernel.o: private rustc_target_flags = --extern ffi --extern pin_init \
     --extern build_error --extern macros --extern bindings --extern uapi
 $(obj)/kernel.o: $(src)/kernel/lib.rs $(obj)/build_error.o $(obj)/pin_init.o \
-    $(obj)/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o FORCE
+    $(obj)/host/$(libmacros_name) $(obj)/bindings.o $(obj)/uapi.o FORCE
 	+$(call if_changed_rule,rustc_library)
 
 ifdef CONFIG_JUMP_LABEL
-- 
2.53.0

