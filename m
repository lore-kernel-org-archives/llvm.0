Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BBD405D8
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 21:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T5/mFP+b"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-59f4f2a9ef0so21532667b3.2
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 14:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696542060; x=1697146860; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g+0XZ4668oG273eR0HIMNtDUIA8UJt38oxH6S2htmGo=;
        b=T5/mFP+bsLrAiEIppld/GASXxluz78u0Dbwu5UNNNZ5Gg1NIqu1MV5WrheCDe1fSJk
         jSsFG7+1at/t+3TVSN97Z0kmiZmFPdQdSfP0EMo6j/0GobGzz7E6KNd9U/6kIh52XQHV
         c9LY5LgNIzLq7b4Ajf0FXsg42zHZg//yvFXqMbUKW7RcEToCyWkObRqJaWEWjHZShkGh
         mg1iaD0DK7VrmwI763FreaDadm8lTCkEWhAkmXS7OT3/VnbHEsG1foS4e0Ro4uDFgbk+
         Lf0e0QWnjz57z0KkrBF52xswDxuPRtZm+JO/a7KjOEN3OXteRGDM4seFD/H9scR9PvpI
         P3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696542060; x=1697146860;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+0XZ4668oG273eR0HIMNtDUIA8UJt38oxH6S2htmGo=;
        b=MmjlOMUUY0JS6d52pGq82RoJqyIhfEEYdZeIlVEOKnn/XjEXgQXIKiPMD/QHIXsxT7
         vT1vMAAmhtyndq8cYdqO4bjAnTpkMEVjavqhBasO02iHqUjUgkHsvoURy54vt9mUVkis
         5FXiZUluIVImvIqVMlryNsKskCvkqP3Rux4AWEMXN5D3264G+B4vYuwzkGH6Hz71XA1N
         dq9SkFZOWPdH9hfYGzoL4V0EyH7uf4wkC/LraYir9XG+J53iYgjhQvZN7I1lViZ9cCrp
         FCPiEeCYQltJ79KpePbCOVq3XA652PlJDz63r1KA5NE1IQuLULs7MoF14Q6uztGhUeAv
         Z2lA==
X-Gm-Message-State: AOJu0YxMOWaVZLxt5xoalT3GgfUBsyYUyb7zXUSr4xeXwg60YqlIu4BO
	9UY1JgVo00QNh1pQqTJ29PpUwqP4y5Zn
X-Google-Smtp-Source: AGHT+IH18mcFZBjno7qcVSdfTIMzXCbUraSNB9ezxjSbMDxqPIDOGA0bbTBdtYlQKSDXozX4E88C3YDA594E
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a81:bc47:0:b0:57a:118a:f31 with SMTP id
 b7-20020a81bc47000000b0057a118a0f31mr112123ywl.7.1696542060316; Thu, 05 Oct
 2023 14:41:00 -0700 (PDT)
Date: Thu,  5 Oct 2023 21:39:58 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
Message-ID: <20231005214057.759089-1-mmaurer@google.com>
Subject: [PATCH v4] rust: Respect HOSTCC when linking for host
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

Edited to use escsq in both Makefiles, as per Masahiro Yamada's
suggestion.

 rust/Makefile         | 2 ++
 scripts/Makefile.host | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/rust/Makefile b/rust/Makefile
index 87958e864be0..2ddd821d9435 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -383,6 +383,8 @@ $(obj)/exports_kernel_generated.h: $(obj)/kernel.o FORCE
 quiet_cmd_rustc_procmacro = $(RUSTC_OR_CLIPPY_QUIET) P $@
       cmd_rustc_procmacro = \
 	$(RUSTC_OR_CLIPPY) $(rust_common_flags) \
+		-Clinker-flavor=gcc -Clinker=$(HOSTCC) \
+		-Clink-args='$(call escsq,$(KBUILD_HOSTLDFLAGS))' \
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
2.42.0.609.gbb76f46606-goog

