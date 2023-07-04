Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702DD7ED
	for <llvm@lists.linux.dev>; Tue,  4 Jul 2023 05:30:56 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A1C923F328
	for <llvm@lists.linux.dev>; Tue,  4 Jul 2023 05:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1688448098;
	bh=1v+am1Z8ymQUGghyM5chvEt9+BuF/dKqLqYQx56m9zI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=Ww71aXkw6LHlz3VZtLTlzA6XJUoP4o459CfviZLjE37O8JvuBVHs+nm4dfU2S2hki
	 IvvkEmFTMKnBcK8DezrSs3LpV5+AtpHZ+k7k9lkl+ONgTHgDGspYPYZp96M3C3Ia01
	 hrfvkte4n9BJx4vyBFgnsFURvUH25Wjg4y9902bh5FBn7HkcXTaitZ5K/0zSPTyv1C
	 fdvJAl+rAFnZh4yNKGaPpgo8j0u0wF4mH+cZMr3LpkXS5qVsi5EZjApoCY1ICc89GS
	 ZoVTiOUtpJZSBfMp13plxStKFFp4H0SxvrUaHy3AjWxNXYCaPH7n+ZOcnAx70po8E7
	 QebnXk96cvNSA==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-992e6840901so450508866b.0
        for <llvm@lists.linux.dev>; Mon, 03 Jul 2023 22:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688448098; x=1691040098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1v+am1Z8ymQUGghyM5chvEt9+BuF/dKqLqYQx56m9zI=;
        b=Mjmqw9T9fdivc748ngpTdFyagQ76qTaJ3rvhV1uDoi8V2HWvuiByiJc3QUnTH1jwB7
         wayU3XHubskNYi4A4QrYgR5S5V8EO4yfuDVA7ByDQiMUbS8kWMRsfxahMVATPYp+KVtp
         lflbg/5bDVKrEMIglx6MLA+saC7+ptlq+JK0vT29p7Ut+qC/MUtDJjhiYPQ5rgh/jE+v
         BxS9Ff2qL0ghaMO4jwKooiliykSv9zIsopMIT4m5zqRyqDRSmbYyiO0r3eYcnyQgnSJU
         7qdfOAMcTAFByujWcq1fPBqhrpRJhFWqMDAIBfHYJZQdY121iR5fknUbbtpw9glqGY0A
         ovGg==
X-Gm-Message-State: AC+VfDzKtnffJUQdyO5eQobJgcTXw/OvwjDCamSchm8clF6sqMPzaQDT
	OTmBTWxIe7vaFOzl50SUZ+1QPU8DCAFLP21Qa/AovHPWl5tTumN+JbKj+lvlkQ3lRj/jFerFk0/
	lI9coNqPWko7zQ04wAs50VJzLeUxSoZo=
X-Received: by 2002:a17:907:6e1b:b0:98e:1c4b:10e2 with SMTP id sd27-20020a1709076e1b00b0098e1c4b10e2mr13287228ejc.20.1688448098177;
        Mon, 03 Jul 2023 22:21:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6KaBtBsknIGzT43R9yW1TZOTc6kL/88ouJOfFvTX2qde5kXfxpEFdhmAwOmJNRYKLkFyB6Sg==
X-Received: by 2002:a17:907:6e1b:b0:98e:1c4b:10e2 with SMTP id sd27-20020a1709076e1b00b0098e1c4b10e2mr13287209ejc.20.1688448097892;
        Mon, 03 Jul 2023 22:21:37 -0700 (PDT)
Received: from righiandr-XPS-13-7390.homenet.telecomitalia.it (host-95-234-206-203.retail.telecomitalia.it. [95.234.206.203])
        by smtp.gmail.com with ESMTPSA id a10-20020a17090640ca00b0098e025cda3bsm12706377ejk.141.2023.07.03.22.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 22:21:37 -0700 (PDT)
From: Andrea Righi <andrea.righi@canonical.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] btf, scripts: rust: drop is_rust_module.sh
Date: Tue,  4 Jul 2023 07:21:36 +0200
Message-Id: <20230704052136.155445-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit c1177979af9c ("btf, scripts: Exclude Rust CUs with pahole")
we are now able to use pahole directly to identify Rust compilation
units (CUs) and exclude them from generating BTF debugging information
(when DEBUG_INFO_BTF is enabled).

And if pahole doesn't support the --lang-exclude flag, we can't enable
both RUST and DEBUG_INFO_BTF at the same time.

So, in any case, the script is_rust_module.sh is just redundant and we
can drop it.

NOTE: we may also be able to drop the "Rust loadable module" mark
inside Rust modules, but it seems safer to keep it for now to make sure
we are not breaking any external tool that may potentially rely on it.

Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 rust/macros/module.rs     |  2 +-
 scripts/Makefile.modfinal |  2 --
 scripts/is_rust_module.sh | 16 ----------------
 3 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100755 scripts/is_rust_module.sh

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index fb1244f8c2e6..d62d8710d77a 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -199,7 +199,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             /// Used by the printing macros, e.g. [`info!`].
             const __LOG_PREFIX: &[u8] = b\"{name}\\0\";
 
-            /// The \"Rust loadable module\" mark, for `scripts/is_rust_module.sh`.
+            /// The \"Rust loadable module\" mark.
             //
             // This may be best done another way later on, e.g. as a new modinfo
             // key or a new section. For the moment, keep it simple.
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index fc19f67039bd..b3a6aa8fbe8c 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -41,8 +41,6 @@ quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
 	if [ ! -f vmlinux ]; then					\
 		printf "Skipping BTF generation for %s due to unavailability of vmlinux\n" $@ 1>&2; \
-	elif [ -n "$(CONFIG_RUST)" ] && $(srctree)/scripts/is_rust_module.sh $@; then 		\
-		printf "Skipping BTF generation for %s because it's a Rust module\n" $@ 1>&2; \
 	else								\
 		LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) --btf_base vmlinux $@; \
 		$(RESOLVE_BTFIDS) -b vmlinux $@; 			\
diff --git a/scripts/is_rust_module.sh b/scripts/is_rust_module.sh
deleted file mode 100755
index 464761a7cf7f..000000000000
--- a/scripts/is_rust_module.sh
+++ /dev/null
@@ -1,16 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-#
-# is_rust_module.sh module.ko
-#
-# Returns `0` if `module.ko` is a Rust module, `1` otherwise.
-
-set -e
-
-# Using the `16_` prefix ensures other symbols with the same substring
-# are not picked up (even if it would be unlikely). The last part is
-# used just in case LLVM decides to use the `.` suffix.
-#
-# In the future, checking for the `.comment` section may be another
-# option, see https://github.com/rust-lang/rust/pull/97550.
-${NM} "$*" | grep -qE '^[0-9a-fA-F]+ [Rr] _R[^[:space:]]+16___IS_RUST_MODULE[^[:space:]]*$'
-- 
2.40.1

