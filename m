Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416090;
	b=o/xOZPgQFy+YdU6ORcMlvx1j/vOAp1T3QuEk+DYLpVSCag8U/esJmz0SDLUR9bPXd39m
	 yKbttaXWy9B5OvsJFcITmWBhOanMxNGi8tyPub7C/Pnc5vCsujIc+zxpz2182IZ64a4kv
	 ZQICTBOz0yXCoRjO2r9qFRTyZG2JudRnVJbzfmjuGOwPigm5+urpGz2FsoatRmLNGQ/f3
	 3gA091FNiSMcfJ2tLA7SbE7gZV2M9uMEB0245MMWMfVVZVX7AzJFmmuDokvrTtcFpLYc4
	 p/AhwWZQIZZ4YQDJrBJyWOebGEATAMbUGNiU7xZndVWPwPXFo7KWGH9IDV1RCfWOisA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=f5aloOxgBcfJJK8SvXENQRlRRIiOwSu/Xe/rRaruUWM=;
	b=ZziptxbcZCQqHM5E+6f8hzX1Y9A9bRCCYFkd3TaOpMeoKzZZklFvMqYnaYwUtkvKnCFA
	 Zkne9fAayMb9WDiE1hm5/suJ2JJFW/mvbqtdqNVCmNiUBV1w8nPbn5f8TKySqGD8wLL0z
	 nnv9PsVYr+dGfpPn3cXpcFfrcqFM/cvEi43mIRyKYRCJfa24OPZUJAFVOCluaqTOozg0i
	 4ps4zXifdZOYlXnTh8hulLjy/jlxABvFLA+kVXGjBm06xa0AFiiUmOOCrUbjr9RJ3kTkC
	 ug1cK1ZHVqen6tzRLMERlZyi1lTpZg+b6Ns2kfC9WNBj59hZNTdUZNvA2fxNsVsSljg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RXC02agP;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C60606A31F
	for <llvm@lists.linux.dev>; Sat, 31 Oct 2026 03:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C60606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RXC02agP
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so1148582b3a.1
        for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 20:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793416089; x=1794020889; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f5aloOxgBcfJJK8SvXENQRlRRIiOwSu/Xe/rRaruUWM=;
        b=RXC02agPiTE8rNvf6JGqfZvMBGpnjZUPMw1yjJ3KEnncDYgrUnEigVwq1J16reF4IY
         +xVMWJY1G1saq4nJ3ahrRUF++9CQV9rmNBSUW9bxUmcz+62X97w5VwEkZzpugqZwNKt1
         A/keNuK4rcksswIxnC3IUkSDp4JwH1BYcpMLOoo29aE0dOd5fMxasNg8URJBqoz5tq/W
         DLJ6DR4bkMjhdNrP5NHOL0mIiI6bDCTollW9aYbPcWhsu5yaGtc3VSfnPih2kVvPVkWu
         MELRPzcFM3AXjd6QsALM5bkOEcB85VErtvmVaWrOpzJ31ZwNZVXGdIV+W6B0O0xpjB0r
         B3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793416089; x=1794020889;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f5aloOxgBcfJJK8SvXENQRlRRIiOwSu/Xe/rRaruUWM=;
        b=O0AyOpWhEYg+qbtgF18Nad+8zZ3pJYyM2jWYJwIU62w0hXAGbTV6KY/+U/+boR8tZS
         7zPSmeYTniFBWc3lDdLnU1zIzZQVecZzDzHTri9MoBKxaKswwAeQRLSaric1TycsEuGs
         Qo0qccm3CPbF4XmDC4HD+T/8kr4Xa94cHDJHJgJXEIyhXd5v3kTIEM8PhBDoGrOeJln/
         Ul6ZtohXWYLjzsdT+L1xQ6CixqOcReUdhyZnbeOIEMqatIxQAEFndFEh4V6IDG0dBVCD
         td5/vSsoDE0s1FRdOqKq1kGR590M4o7YViUgRUzU9MzO+HkrjlC+vxbj9CoPVoa5ue6I
         yoNw==
X-Forwarded-Encrypted: i=1; AKwUvBwcTyCR/oWKsnKHVz8zlfuH8HYzw05gD5ysuAfmspCiiDoMWCBRGaQgQ9MWTxS9nS8+hslr@lists.linux.dev
X-Gm-Message-State: AFq9FYKjrjakYi/b9+B74aM3LgypFZ1zmx8DJHFTmS748mdbKzh4IYPW
	oPB8N6fwveYZUmVGBjrwBa8fMPsP+hfwYf4o2HQRyW1fItSyvx5vbOMh9VXQSQ9fWVZT7Q4SN79
	xOkLJj7YR63R6jIVZEr/KgA==
X-Received: from pfbft2.prod.google.com ([2002:a05:6a00:81c2:b0:8a2:dc6e:fcd0])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:10c9:b0:878:34d7:699e with SMTP id d2e1a72fcca58-8a9bfa0326bmr3697231b3a.46.1793416089082;
 Fri, 30 Oct 2026 20:08:09 -0700 (PDT)
Date: Sat, 31 Oct 2026 03:08:07 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261031030807.4101384-1-jenhaochen@google.com>
Subject: [PATCH] kbuild: rust: pass AutoFDO flags to Clang with inline helpers
From: Jenhao Chen <jenhaochen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, Rong Xu <xur@google.com>, 
	Han Shen <shenhan@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

When CONFIG_RUST_INLINE_HELPERS=y, cmd_rustc_o_rs and cmd_rustc_library
compile Rust sources to LLVM bitcode (.bc), link rust/helpers/helpers.bc
via llvm-link, and then invoke $(CC) to compile the combined bitcode
into the final ELF object (.o).

When commit a960c2cdb19e ("kbuild: rust: add AutoFDO support") was
tested with CONFIG_RUST_INLINE_HELPERS=y and CONFIG_LTO_CLANG_THIN=y,
cmd_rustc_o_rs skipped the post-llvm-link $(CC) step under
CONFIG_LTO_CLANG and handed the linked bitcode directly to ld.lld, where
the ThinLTO backend applied --lto-sample-profile,
-plugin-opt=-split-machine-functions, and LLD's default function
sections. Non-LTO builds (!CONFIG_LTO_CLANG), however, ran the
post-llvm-link $(CC) step without $(CFLAGS_AUTOFDO_CLANG) ever since
commit 3a2486cc1da5 ("kbuild: rust: provide an option to inline C
helpers into Rust").

Subsequently, commit 5febf432df1c ("kbuild: rust: keep Rust objects out
of Clang LTO with inline helpers") updated cmd_rustc_o_rs and
rust/Makefile to always invoke $(CC) on the linked bitcode even when
CONFIG_LTO_CLANG=y. Because that $(CC) invocation only passes
$(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) and does not include
$(CFLAGS_AUTOFDO_CLANG) (which is normally appended to _c_flags in
scripts/Makefile.lib), the final code generation step for Rust objects
is compiled without -ffunction-sections, -fsplit-machine-functions,
-fprofile-sample-use, or flow-sensitive discriminator flags whenever
CONFIG_RUST_INLINE_HELPERS=y.

As a result, Rust crates built with both CONFIG_RUST_INLINE_HELPERS=y
and CONFIG_AUTOFDO_CLANG=y emit all functions into a single monolithic
.text section (0 .text.<func> sections instead of 417 in
rust_binder_main.o and 424 in rust/kernel.o on arm64 with
CLANG_AUTOFDO_PROFILE set), preventing the linker from performing
AutoFDO hot/cold function clustering and discarding SamplePGO weights on
the inlined C helpers during final code generation.

Factor out _autofdo_c_flags in scripts/Makefile.lib (preserving per-file
and per-directory AUTOFDO_PROFILE opt-outs) and pass it to the
post-llvm-link $(CC) invocation in scripts/Makefile.build and
rust/Makefile.

Fixes: 3a2486cc1da5 ("kbuild: rust: provide an option to inline C helpers into Rust")
Fixes: 5febf432df1c ("kbuild: rust: keep Rust objects out of Clang LTO with inline helpers")
Signed-off-by: Jenhao Chen <jenhaochen@google.com>
---
 rust/Makefile          | 2 +-
 scripts/Makefile.build | 2 +-
 scripts/Makefile.lib   | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 0ac9ab28cc2b..f2d9b4411720 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -658,7 +658,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 	$(if $(link_helper),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
 		$(obj)/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
 		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
-		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
+		$(_autofdo_c_flags) $(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
 	$(cmd_objtool)
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6127feb970c6..bd7bd05e9fe9 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -369,7 +369,7 @@ quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
 	$(if $(CONFIG_RUST_INLINE_HELPERS),;$(LLVM_LINK) --internalize --suppress-warnings $(patsubst %.o,%.bc,$@) \
 		$(objtree)/rust/helpers/helpers$(if $(part-of-module),_module).bc -o $(patsubst %.o,%.m.bc,$@); \
 		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
-		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
+		$(_autofdo_c_flags) $(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(cmd_objtool)
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 19e96b30a122..e72efa5c6c05 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -120,9 +120,10 @@ endif
 # enable (depends on variables AUTOFDO_PROFILE_obj.o and AUTOFDO_PROFILE).
 #
 ifeq ($(CONFIG_AUTOFDO_CLANG),y)
-_c_flags += $(if $(patsubst n%,, \
+_autofdo_c_flags = $(if $(patsubst n%,, \
 	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object)), \
 	$(CFLAGS_AUTOFDO_CLANG))
+_c_flags += $(_autofdo_c_flags)
 _rust_flags += $(if $(patsubst n%,, \
 	$(AUTOFDO_PROFILE_$(target-stem).o)$(AUTOFDO_PROFILE)$(is-kernel-object)), \
 	$(RUSTFLAGS_AUTOFDO_CLANG))
-- 
2.56.0.317.g454f8302e1-goog

