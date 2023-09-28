Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89931110B
	for <llvm@lists.linux.dev>; Thu, 28 Sep 2023 19:48:10 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5a23ad271d7so2831257b3.1
        for <llvm@lists.linux.dev>; Thu, 28 Sep 2023 12:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695930489; x=1696535289; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8iFw0tvjrP+bKthnM1Ar6RitIykCJfydYWlbU6QKJSo=;
        b=e53ZsTjeUNm5Jiiji39QZh/ZrKh4FHDcoEZlIkdrAwtnRkB0VYly7CEET2VHqIvRJM
         e121UhbIt+LokGJ2ydwbjY3lqw9h/sD65iOhuHYRAEo0KKtfZQCYqYbSWpagn4jA66ZL
         +l0fk/qwELWeOoTDYPwtaXQ61DVktHLVo064wpHFh3V1RHkdSdn6dBFX89mtWtukHQjH
         tgraZK6gIObssYn0FH3ZQr7yQvM1TIsdmAW1uyGnqq9btpQeLerRoXlUU84U1MvnTOcm
         2HjITQ3bSr8J3LSVwXmotfxFX4u5AIrb7pPQ3pZJDR4D48Aw2QJ83FLczS2cK6QWo+24
         fm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695930489; x=1696535289;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8iFw0tvjrP+bKthnM1Ar6RitIykCJfydYWlbU6QKJSo=;
        b=ffBnBgGLquByHz2DsdBnIQQWOVSc+uq/kTV8TCEXGkOEe5g+BNbQ4NiNtISHxEw03U
         tNp6zGq/Su75LtQvaOaYLoFZ7URNMYAGqZoqHB95xpMaqSBAyHcnJ6GoyCB17EFPJxUd
         EUh3UrCQgihHu8C7/mTJFmv/Pzco84D5B30M6NNj8vo88/K9FauUnl5I0iEFCWyM+bBg
         7CoILeqpb9zVP/962Xq0MXNJahdBaWM2JvCKrTr8y79U/1w+/uXWMzVot1TpGvvQwLL+
         gGEuFlgctAC9N1PUEcy4FamExzsexMywvdHO0E7HBpkgXibY9xD40dH6X0wJCpJTKAbp
         d/mA==
X-Gm-Message-State: AOJu0YxBpIL23m7q0MQAqWDp5+XwEqz8VZwhcaH8tRJ0wVv3sHIfn26N
	WrXXU+T7hcI215dHVyu46EqCq4mwdHyb
X-Google-Smtp-Source: AGHT+IHmbhxmxw0u7t9poI7VDoNjrSv2+5OQoPENUEo3sqSzgMufa0dh2YWPxi+AEsKixH41b4COj6rIWJJN
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:440d:0:b0:59b:ebe0:9fd3 with SMTP id
 r13-20020a81440d000000b0059bebe09fd3mr29132ywa.7.1695930489339; Thu, 28 Sep
 2023 12:48:09 -0700 (PDT)
Date: Thu, 28 Sep 2023 19:48:01 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
Message-ID: <20230928194801.2278999-1-mmaurer@google.com>
Subject: [PATCH v3] rust: Respect HOSTCC when linking for host
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
resulting in build failures in hermetic environments where `cc` does not
exist. This includes both hostprogs and proc-macros.

Since we are setting the linker to `HOSTCC`, we set the linker flavor to
`gcc` explicitly. The linker-flavor selects both which linker to search
for if the linker is unset, and which kind of linker flags to pass.
Without this flag, `rustc` would attempt to determine which flags to
pass based on the name of the binary passed as `HOSTCC`. `gcc` is the
name of the linker-flavor used by `rustc` for all C compilers, including
both `gcc` and `clang`.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/Makefile         | 2 ++
 scripts/Makefile.host | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 87958e864be0..da664d7aed51 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -383,6 +383,8 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
+		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		-Clink-args='$(subst ','\'',$(KBUILD_HOSTLDFLAGS))' \
 		--emit=dep-info=$(depfile) --emit=link=$@ --extern proc_macro \
 		--crate-type proc-macro \
 		--crate-name $(patsubst lib%.so,%,$(notdir $@)) $<
diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 8f7f842b54f9..08d83d9db31a 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -91,6 +91,8 @@ hostcxx_flags  = -Wp,-MMD,$(depfile) \
 # current working directory, which may be not accessible in the out-of-tree
 # modules case.
 hostrust_flags = --out-dir $(dir $@) --emit=dep-info=$(depfile) \
+		 -Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		 -Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
                  $(KBUILD_HOSTRUSTFLAGS) $(HOST_EXTRARUSTFLAGS) \
                  $(HOSTRUSTFLAGS_$(target-stem))
 
-- 
2.42.0.582.g8ccd20d70d-goog

