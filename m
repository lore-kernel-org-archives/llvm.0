Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEAA346AFB
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 05:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009691; cv=none; b=BbtYii2hks3MSkg41KCpEz2Hk/8pietp5JmbcQ1D/HRfzG6gDoW/qgrqfxNmn8v6bJ3Aw1DlUiHfvQLNsb5iy2huzY714ayCb6Z+s6tVuylgzZ4R/Hv9jxFycuIzLTmGM09MjSxwyzoc875hfphniBsHCK/3R9QZ/w7uDI9b3YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009691; c=relaxed/simple;
	bh=DaJD+iC/4t/zDn6B6rcfGqjo/dCgt4gKeEwY5aGTxec=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0H3FvIZSUlfYEUGEUmLU6t3UCbgp9O77RP8+zten7HjphCv675/ytm7AWpi2twAOCJPseSmfK4cfwZoYMYDtvkNYOf1KPU4KvnNdSDoY+pfbjXYqgLBdTWGCmjklsLyCfllhet+RPul3tior3bf/E/3wbjolJ4LNikGAEW9Bfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aU2CxqBk; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aU2CxqBk"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ab077e3f32so32121135ad.3
        for <llvm@lists.linux.dev>; Thu, 23 Apr 2026 22:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009689; x=1777614489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avSEhYLX24df+mZ+6wWnK3u2AMb0siNB32CpS+CSjqU=;
        b=aU2CxqBkLHIZHEl9oqGj+2iYJSHvGyatMLeMtEk5oNARUjUADn3L6r4na6kEq8Esbq
         Bsu8+A2v3FtiUgBOPSwukkk16UdCo+mo4HuUFrj5NjHXl71XxJAx038lQhuEhQlDytv1
         XbjKwwzA1ziveEIIUClKFlm5nvm5thwuGobslsLSMyGuL61pdkZHwM+PhyAwVQ45KGcv
         njkOXb1IZyj/UGH+n5+9WFhlvRJp7i5smq+nOUsbrtTrOCJUr26cQ9tY7qKYqiHAa/9A
         HKO5E+UEw1PMaFjFHgBKo4peDKn2ND7RHXG5+u0tfbA//nMSqJDrarxDOAogtYc3de9W
         r4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009689; x=1777614489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=avSEhYLX24df+mZ+6wWnK3u2AMb0siNB32CpS+CSjqU=;
        b=HLT3SiYLaY9QPY79IPmNIJY8dmZ5lBpSCe8EEvWb8OlF6mlokM6y9Xlu8JxnmcxM2b
         RZP1KCf43ZlNMHc1jQuKlPu6WJQfH8z9DdpxfAckycxQivI1IXVvmJ7vAoE3s20D3jn2
         d1mgS15wQtiAwcL79pcIwHF7SGpDfr08Ayg92d60hY7TBuw8i1gAuN+FOiCN4tPPcuWk
         LV6oSGcQwzQkQ3myLYbszWIcaUWlDdg95YKFh8pwVXwc8l2G5oBqGT30VrbcU10RkVuh
         3Ur2Zy5l82BArosEwoPU0LBciZDicR/S1O9nl6cW1oerLiQfvgOSLyA1XWBfnE2ojxRj
         JVsA==
X-Forwarded-Encrypted: i=1; AFNElJ9U/4p1pPs4xKudC9yRzvvDEsL56ZAf+A9/jiRA5nFFxQ32H9KxEkh6rY3gNe7Dc1gJnc2l@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7gMYTTOodxZYKIoIIpk7YJo96IbSPogcyvIfHAPiaSJIScMDG
	ECtBTXYEISURrDUDqPh97qQxgNYl7ePAV1nQ5Ft04llarkcOZIQIlN2D
X-Gm-Gg: AeBDiestOE9xTN8MTHwK78RBkzjO5ZnpISJoD6sL9GUi9O52mUtN3uSPVPuluuqlk8i
	p9uDm7BbRZrHTPv7qQGV9YTuffAGsByZp7IGCcGB3lRS3heh/q+dhvCM0d5pHyb6rgVl7V5uRkd
	8YGKT4RV8sNxmF//UTUX4CHkQotYtpd8sMv/8WP0ORxcIfqcZyBG63z5lzs2RmKSfZcxhx6znp+
	GW4Vagn1JkDd0QydZOlxN+6jGCMm5CvUZh5BIag/dqQE8oHevSm3Es0q6DqHILGQ6iq5g0QrR8k
	o7wfjxCly1sXty18ZEXaR0DQnX/9WSF5jC71dsMqM5d4RE93MvYgqjbTYJ7y0Him1Fcmp+3h75k
	B94t7rkF7fE91+VQ3aLgZRYU+uLD+/kFik44iZLOKkyGr+Ztl8oN6cmeSfkj2rNWsmR7ZGFO5Pu
	28xPeWgasIM12m0QbTdNgoeQdmwm4rh1OZHxnhzZ8db61SKBJ74hq6E21n3oFimNZ8tvhLxRTE0
	BYGagjDYMAHs695dLorH0CCEw==
X-Received: by 2002:a17:903:3b88:b0:2b2:ec31:25be with SMTP id d9443c01a7336-2b5f9f35acamr294635205ad.24.1777009689388;
        Thu, 23 Apr 2026 22:48:09 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:09 -0700 (PDT)
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
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
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
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V13 1/7] rust: Fix "multiple candidates for rmeta dependency core" error
Date: Fri, 24 Apr 2026 11:17:36 +0530
Message-ID: <20260424054742.45832-2-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
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
 rust/Makefile | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index b361bfedfdf0..2a5428a5503d 100644
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
 
@@ -31,7 +34,7 @@ endif
 
 obj-$(CONFIG_RUST) += exports.o
 
-always-$(CONFIG_RUST) += libproc_macro2.rlib libquote.rlib libsyn.rlib
+always-$(CONFIG_RUST) += host/libproc_macro2.rlib host/libquote.rlib host/libsyn.rlib
 
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated.rs
 always-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.c
@@ -146,7 +149,7 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
       cmd_rustdoc = \
 	OBJTREE=$(abspath $(objtree)) \
 	$(RUSTDOC) $(filter-out $(skip_flags) --remap-path-scope=%,$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \
-		$(rustc_target_flags) -L$(objtree)/$(obj) \
+		$(rustc_target_flags) -L$(objtree)/$(obj)$(if $(rustdoc_host),/host) \
 		-Zunstable-options --generate-link-to-definition \
 		--output $(rustdoc_output) \
 		--crate-name $(subst rustdoc-,,$@) \
@@ -231,6 +234,7 @@ rustdoc-pin_init_internal: $(src)/pin-init/internal/src/lib.rs \
 
 rustdoc-pin_init: private rustdoc_host = yes
 rustdoc-pin_init: private rustc_target_flags = $(pin_init-flags) \
+    --extern pin_init_internal=$(objtree)/$(obj)/$(libpin_init_internal_name) \
     --extern alloc --cfg feature=\"alloc\"
 rustdoc-pin_init: $(src)/pin-init/src/lib.rs rustdoc-pin_init_internal \
     rustdoc-macros FORCE
@@ -520,23 +524,23 @@ quiet_cmd_rustc_procmacrolibrary = $(RUSTC_OR_CLIPPY_QUIET) PL $@
 	$(if $(skip_clippy),$(RUSTC),$(RUSTC_OR_CLIPPY)) \
 		$(filter-out $(skip_flags),$(rust_common_flags) $(rustc_target_flags)) \
 		--emit=dep-info=$(depfile) --emit=link=$@ --crate-type rlib -O \
-		--out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \
+		--out-dir $(objtree)/$(obj)/host -\L$(objtree)/$(obj)/host \
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
@@ -545,20 +549,20 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
 		-Clink-args='$(call escsq,$(KBUILD_PROCMACROLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
-		--crate-type proc-macro -L$(objtree)/$(obj) \
+		--crate-type proc-macro -L$(objtree)/$(obj)/host \
 		--crate-name $(patsubst lib%.$(libmacros_extension),%,$(notdir $@)) \
 		@$(objtree)/include/generated/rustc_cfg $<
 
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

