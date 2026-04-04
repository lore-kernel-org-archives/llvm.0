Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2738618CBE1
	for <llvm@lists.linux.dev>; Sat,  4 Apr 2026 12:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775304997; cv=none; b=EpnTU++2kQ7a0BkWUzgLzICrB1fP9dXiNgZ+YyY0h6ZNzSAxDbB2hgXYLd6j0yMuAFfzk0Yy7+1QtQwyeGAXHSv39/48T1E9UHGOBeDKOE3Oeq6+jBiY4swR2wNZitUiM4z6PufokPXDMGwsva3WrpO7DvYistW7Umxn7kMxcko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775304997; c=relaxed/simple;
	bh=V6gRG34tCn/e450RJTTcFmxjzp+9fzaprTt6dAiYIxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RrE0KVo5azS4VCE2N6+gIFay3/DB+Vhi50Tm3Xbc4qU/Cjr9SSHlgcTByR41KFkLvzIUqSZ1VayCrYJim8/cTsrGrgTNsSsHsmAGEH4bOjQgRMvGcYP/pZ8F8AFzIG3cfLxKmq05FW3zondb7Z2D+Eeq94WWbuBcqTGs3qOfphs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PeXIJ2Wd; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PeXIJ2Wd"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35c238f1063so1595710a91.1
        for <llvm@lists.linux.dev>; Sat, 04 Apr 2026 05:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775304994; x=1775909794; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRC8yozcX9QSmNG0yIA7nVyNQgWhlHJbCL9t4pSEkxw=;
        b=PeXIJ2WdutxlwMPmPyOJ0Swmsgu2Vjnon88jcnCbWEIlAFpoBKgcUIFRS2Muatye/4
         bP3slpvFmyjCRtYaUOzS6G3GwApc5UW3ipY56zPeJiZKjk0wSZp5MYQSNeYNp1N10ukO
         H/fPL67dRuMSWiEpyCEl82A/mQ2i0BkF+KKopVfIucVbSRC0xMartCh8nskaXzBJdCDp
         GZC5mSzGZf5H7AIms3KfK7ltxOwIsSQOybEG63GMnTWfb0Gh7wjD1uBKofLc1qllyqbZ
         eZq/A+b6co3ijPNnHkwWNZGd1dvHugS5JZdaEYAP2rVcUh8z8m6/Ne3TiO1gOmW9FIRP
         LBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775304994; x=1775909794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QRC8yozcX9QSmNG0yIA7nVyNQgWhlHJbCL9t4pSEkxw=;
        b=Q67yk6WLfM3LVK2XOkYkswNipZSj0abLrckWPYs326dr09LTGsNnPq9CergGQb/hgg
         w5MWAsmeqqnTZGo5gK+9myjiiTgPMLpawHIyWN61kgonLVAnojem4wingQKoKEDh0B+j
         4fbGtMmXOfDM+NfyYR5CTyu4s63PnfX2rGOd4D8rftEx9Q1zg97mco2dnEiFq/POxCAZ
         dHXcBXf2jCM+e6uRioxa7M4jYR4YoxJwO5X3SLKgPpJSe/oZEu8bvPsC6uIKwDuwgWL/
         OHQ0YSHUBi2gRuqrbx6jcxe3VLx2cpcSJlHJpBrBqCYQ6mlmtj7eelOOwAp9Ti/SgONO
         W1RQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMO2v+7BFTeYDeTnV0a4hTJ62N2B/QuHFP8BrynRw0aoanlWHEMbuLXL0kkEtqWZ52tnWm@lists.linux.dev
X-Gm-Message-State: AOJu0YzvF/DKY63r3/Osoa5ZgjpgvUoBoYz40fC3u8D3BYYAPDFmlR8k
	X75ZqxmSNGAuK6H2vcj8LYzI9q0LXgXdjqamxGqdJpi/HYyPh5qJx8/K
X-Gm-Gg: AeBDieueCrnB8feRxU+hWu25p5HuMK2a65NatkVhICL/FvmrTJg4yuqxDV+wwtAHnWc
	KZxsIuQtRecsLRmVVkVRVMLmpOspXYA6lCWbm/O9Tj+87jfnt4dDnBEn2P3kjybLkger9M6g3md
	MzWR+OQs7Zsy5R2sObe0Cr7KMBTZYXOta+Arj62VZB+9bl5UeG2q7Ibyyk+rcRAKNDKbYS7XSGY
	oswITLBomLKBa6fYIy9saltyduR5BO1BymfE+p+kvViInibKUASQlSMv19KOgpkLv2xhbCCHmMW
	KAEszJNR/d93dju5OWi60jjkWJGgqQi+6z144DVAW+U8CCAAPica7P09tgR4yTfPpuyXrtUvq7s
	azBAzdA9FruFDFmnUfxwc3HGrllmKGUIxc8yj2lPJQBKBSsBUXESPIh2qfXLtZgVCAWhlZiF0qP
	NNEbpjQCo2/SjssKXlosMfvDPlQWSts8kPv/wdV07yFzDVyb+M4MX1fUuFpeaf0qPWN+9ayr+p4
	RI=
X-Received: by 2002:a17:90b:2fcb:b0:35d:972c:b3d6 with SMTP id 98e67ed59e1d1-35de68688damr6047728a91.9.1775304994508;
        Sat, 04 Apr 2026 05:16:34 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de500c42fsm2702745a91.0.2026.04.04.05.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:16:33 -0700 (PDT)
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
Subject: [PATCH V9 1/4] rust: Fix "multiple candidates for rmeta dependency core" error
Date: Sat,  4 Apr 2026 17:46:07 +0530
Message-ID: <20260404121610.1956528-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404121610.1956528-1-mkchauras@gmail.com>
References: <20260404121610.1956528-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building Rust code with LLVM=1 with -j1, rustc was encountering
an error:
"multiple candidates for `rmeta` dependency `core` found", with two
candidates:
1. The host's standard library from the rustup toolchain
2. The kernel's custom libcore.rmeta in the rust/ directory

This occurred because the build system was using `-L$(objtree)/rust`
for host library builds (proc_macro2, quote, syn), which caused rustc
to search the rust/ directory. During this search, rustc would find
both the kernel's custom libcore.rmeta and gain access to the host's
standard library, creating a conflict.

The solution is to separate host libraries into a dedicated rust/host/
subdirectory and use `-L$(objtree)/rust/host` for host builds instead
of `-L$(objtree)/rust`. This ensures that:

1. Host library builds (proc_macro2, quote, syn) only search rust/host/
   and never encounter the kernel's libcore.rmeta
2. Proc macro builds use `-L$(objtree)/rust/host` to find their
   dependencies

Special handling is added for rustdoc-pin_init, which is a host build
(to access the alloc crate) but depends on proc macros from the main
rust/ directory. It uses explicit `--extern` paths with absolute paths
to reference the proc macros without adding `-L$(objtree)/rust`, which
would reintroduce the conflict.

The rust/host/ directory is added to clean-files to ensure it's removed
during `make clean`.

As there is a lot going on, here's a summary of changes:
- Add clean-files := host/ to clean the generated directory
- Change host library targets from lib*.rlib to host/lib*.rlib
- Update cmd_rustc_procmacrolibrary to create host/ directory
- Update cmd_rustc_procmacro to use -L$(objtree)/rust/host
- Update cmd_rustdoc to use -L$(objtree)/rust/host for host builds
- Update rustdoc-pin_init to use explicit --extern paths for proc macros
  as pin-init also needs alloc crate from -L$(objtree)/rust. So the proc
  macros needs an absolute path

Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 rust/Makefile | 57 +++++++++++++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 9801af2e1e02..5f726a332d9e 100644
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
@@ -150,7 +153,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
 	OBJTREE=$(abspath $(objtree)) \
 	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-prefix=% --remap-path-scope=%, \
 			$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
-		$(rustc_target_flags) -L$(objtree)/$(obj) \
+		$(rustc_target_flags) -L$(objtree)/$(obj)$(if $(rustdoc_host),/host) \
 		-Zunstable-options --generate-link-to-definition \
 		--output $(rustdoc_output) \
 		--crate-name $(subst rustdoc-,,$@) \
@@ -193,13 +196,15 @@ rustdoc-proc_macro2: $(src)/proc-macro2/lib.rs rustdoc-clean FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-quote: private rustdoc_host = yes
-rustdoc-quote: private rustc_target_flags = $(quote-flags)
+rustdoc-quote: private rustc_target_flags = $(quote-flags) \
+    --extern proc_macro2
 rustdoc-quote: private skip_flags = $(quote-skip_flags)
 rustdoc-quote: $(src)/quote/lib.rs rustdoc-clean rustdoc-proc_macro2 FORCE
 	+$(call if_changed,rustdoc)
 
 rustdoc-syn: private rustdoc_host = yes
-rustdoc-syn: private rustc_target_flags = $(syn-flags)
+rustdoc-syn: private rustc_target_flags = $(syn-flags) \
+    --extern proc_macro2 --extern quote
 rustdoc-syn: $(src)/syn/lib.rs rustdoc-clean rustdoc-quote FORCE
 	+$(call if_changed,rustdoc)
 
@@ -236,7 +241,10 @@ rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
 	+$(call if_changed,rustdoc)
 
 rustdoc-pin_init: private rustdoc_host = yes
-rustdoc-pin_init: private rustc_target_flags = $(pin_init-flags) \
+rustdoc-pin_init: private rustc_target_flags = \
+    --extern pin_init_internal=$(abspath $(objtree)/$(obj)/$(libpin_init_internal_name)) \
+    --extern macros=$(abspath $(objtree)/$(obj)/$(libmacros_name)) \
+    $(call cfgs-to-flags,$(pin_init-cfgs)) \
     --extern alloc --cfg feature=\"alloc\"
 rustdoc-pin_init: $(src)/pin-init/src/lib.rs rustdoc-pin_init_internal \
     rustdoc-macros FORCE
@@ -525,48 +533,53 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 
 quiet_cmd_rustc_procmacrolibrary = $(RUSTC_OR_CLIPPY_QUIET) PL $@
       cmd_rustc_procmacrolibrary = \
+	mkdir -p $(dir $@); \
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
 		--emit=dep-info=$(depfile) --emit=link=$@ --crate-type rlib -O \
-		--out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
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
+$(obj)/host/libquote.rlib: private rustc_target_flags = $(quote-flags) \
+	-L$(objtree)/$(obj)/host --extern proc_macro2
+$(obj)/host/libquote.rlib: $(src)/quote/lib.rs $(obj)/host/libproc_macro2.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
-$(obj)/libsyn.rlib: private skip_clippy = 1
-$(obj)/libsyn.rlib: private rustc_target_flags = $(syn-flags)
-$(obj)/libsyn.rlib: $(src)/syn/lib.rs $(obj)/libquote.rlib FORCE
+$(obj)/host/libsyn.rlib: private skip_clippy = 1
+$(obj)/host/libsyn.rlib: private rustc_target_flags = $(syn-flags) \
+	-L$(objtree)/$(obj)/host --extern proc_macro2 --extern quote
+$(obj)/host/libsyn.rlib: $(src)/syn/lib.rs $(obj)/host/libquote.rlib FORCE
 	+$(call if_changed_dep,rustc_procmacrolibrary)
 
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
-	$(RUSTC_OR_CLIPPY) $(rust_common_flags) $(rustc_target_flags) \
+	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
-		--crate-type proc-macro -L$(objtree)/$(obj) \
+		--crate-type proc-macro \
+		-L$(objtree)/$(obj)/host \
 		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) \
-		@$(objtree)/include/generated/rustc_cfg $<
+		@$(objtree)/include/generated/rustc_cfg \
+		$(rustc_target_flags) \
+		$<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
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
2.53.0

