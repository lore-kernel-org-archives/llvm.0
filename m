Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5AC423B0
	for <llvm@lists.linux.dev>; Sat, 31 Dec 2022 06:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9997C4339B;
	Sat, 31 Dec 2022 06:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672468944;
	bh=TYz0+owbHpGu+NR39J76tZxgsfupHoR+sq24KGH4hCc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jbLzN1vLnGdFxz6Adw0JsfkXLylFO2Yig/xSLeltOj76v04uIB0qr8w9U8fC9yxc0
	 zX/ExraGY59B6/wRZCqtE4FRXMznLSiawWCGDPxaK1Rqfe/O8bCyTBT8ijswIXPO8h
	 Rc4bsePiBpvGj05fLuy9yMDOiBFGme1U9hSfHW6FpdM7Jw+tvUtvb3Has1BC8lcN1t
	 9RKEWr4RwkS8I6bjKGZTMayzkuNN6D6EvonR+4c90Lc9bnoAezKjx9Z44hYHdrZszG
	 O9Whunggbozgl1J5x0pouDZoezTbClazpvb9qgmN1LFDf9W6dsP+pIWrWMagvK+DCt
	 gHyST7dx9MB3Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rix <trix@redhat.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	llvm@lists.linux.dev,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 3/6] kbuild: remove sed commands after rustc rules
Date: Sat, 31 Dec 2022 15:42:00 +0900
Message-Id: <20221231064203.1623793-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221231064203.1623793-1-masahiroy@kernel.org>
References: <20221231064203.1623793-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rustc may put comments in dep-info, so sed is used to drop them before
passing it to fixdep.

Now that fixdep can remove comments, Makefiles do not need to run sed.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 rust/Makefile          |  6 ++----
 scripts/Makefile.build | 18 ++++--------------
 scripts/Makefile.host  |  3 +--
 3 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 0e2a32f4b3e9..c8941fec6955 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -333,8 +333,7 @@ quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro \
-		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<; \
-	sed -i '/^\#/d' $(depfile)
+		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
 
 # Procedural macros can only be used with the `rustc` that compiled it.
 # Therefore, to get `libmacros.so` automatically recompiled when the compiler
@@ -349,8 +348,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 		$(filter-out $(skip_flags),$(rust_flags) $(rustc_target_flags)) \
 		--emit=dep-info=$(depfile) --emit=obj=$@ --emit=metadata=$(dir $@)$(patsubst %.o,lib%.rmeta,$(notdir $@)) \
 		--crate-type rlib -L$(objtree)/$(obj) \
-		--crate-name $(patsubst %.o,%,$(notdir $@)) $<; \
-	sed -i '/^\#/d' $(depfile) \
+		--crate-name $(patsubst %.o,%,$(notdir $@)) $< \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
 
 rust-analyzer:
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 40de20246e50..76323201232a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -289,9 +289,6 @@ rust_common_cmd = \
 	--crate-name $(basename $(notdir $@)) \
 	--emit=dep-info=$(depfile)
 
-rust_handle_depfile = \
-	sed -i '/^\#/d' $(depfile)
-
 # `--emit=obj`, `--emit=asm` and `--emit=llvm-ir` imply a single codegen unit
 # will be used. We explicitly request `-Ccodegen-units=1` in any case, and
 # the compiler shows a warning if it is not 1. However, if we ever stop
@@ -301,9 +298,7 @@ rust_handle_depfile = \
 # would not match each other.
 
 quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
-      cmd_rustc_o_rs = \
-	$(rust_common_cmd) --emit=obj=$@ $<; \
-	$(rust_handle_depfile)
+      cmd_rustc_o_rs = $(rust_common_cmd) --emit=obj=$@ $<
 
 $(obj)/%.o: $(src)/%.rs FORCE
 	$(call if_changed_dep,rustc_o_rs)
@@ -311,24 +306,19 @@ $(obj)/%.o: $(src)/%.rs FORCE
 quiet_cmd_rustc_rsi_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
       cmd_rustc_rsi_rs = \
 	$(rust_common_cmd) -Zunpretty=expanded $< >$@; \
-	command -v $(RUSTFMT) >/dev/null && $(RUSTFMT) $@; \
-	$(rust_handle_depfile)
+	command -v $(RUSTFMT) >/dev/null && $(RUSTFMT) $@
 
 $(obj)/%.rsi: $(src)/%.rs FORCE
 	$(call if_changed_dep,rustc_rsi_rs)
 
 quiet_cmd_rustc_s_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
-      cmd_rustc_s_rs = \
-	$(rust_common_cmd) --emit=asm=$@ $<; \
-	$(rust_handle_depfile)
+      cmd_rustc_s_rs = $(rust_common_cmd) --emit=asm=$@ $<
 
 $(obj)/%.s: $(src)/%.rs FORCE
 	$(call if_changed_dep,rustc_s_rs)
 
 quiet_cmd_rustc_ll_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
-      cmd_rustc_ll_rs = \
-	$(rust_common_cmd) --emit=llvm-ir=$@ $<; \
-	$(rust_handle_depfile)
+      cmd_rustc_ll_rs = $(rust_common_cmd) --emit=llvm-ir=$@ $<
 
 $(obj)/%.ll: $(src)/%.rs FORCE
 	$(call if_changed_dep,rustc_ll_rs)
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 4434cdbf7b8e..bc782655d09e 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -148,8 +148,7 @@ $(host-cxxobjs): $(obj)/%.o: $(src)/%.cc FORCE
 # host-rust -> Executable
 quiet_cmd_host-rust	= HOSTRUSTC $@
       cmd_host-rust	= \
-	$(HOSTRUSTC) $(hostrust_flags) --emit=link=$@ $<; \
-	sed -i '/^\#/d' $(depfile)
+	$(HOSTRUSTC) $(hostrust_flags) --emit=link=$@ $<
 $(host-rust): $(obj)/%: $(src)/%.rs FORCE
 	$(call if_changed_dep,host-rust)
 
-- 
2.34.1

