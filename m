Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E9A110E
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 07:12:50 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4161E3F04B
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 07:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1680851147;
	bh=7wCvsU3M9Fv6Z9EHNIgdooWMu4RgxKEfVO+unBDF31s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=ANQ4GMe/v5ozCnem/VXwddG15K/fgWHlJrrMgJwMixrP51E3+a+vxG3ae0U2Vk4g4
	 o5YaT0krqaF0KyYIMymPmA2joUw1+eFnPZ64bCaPLngkQmGpgQMsUX8bqTnyDG3ZPn
	 MkiY4Jfl7U03gaaHznxKegO7ZB+PDepiRsAQaWG+WIJZNIzPMUYkbZGlGCIELXMikm
	 okMrdT3+c69Thn5zRNSBaeZbizJmY61ZRgVrNR0pTafnfjaKZDLsO9AUUd+7KZR9qS
	 q6sYFz/RBwQm+aWgYv6Z1xm5sQYC/fVcxHQmGGICGipB+5qIR58H5LRACGdt+3tDWy
	 wUx6CuyLVoWwA==
Received: by mail-wm1-f71.google.com with SMTP id o1-20020a05600c4fc100b003edecc610abso445930wmq.7
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 00:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680851147; x=1683443147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7wCvsU3M9Fv6Z9EHNIgdooWMu4RgxKEfVO+unBDF31s=;
        b=MU1x6Bje9RIPu0hRjDagN9SIZkMuB+5gekym2PF7HMBQ1qRkVJ4yII7Lgu8WVxqml0
         9JpckDl77pkkidFJRa40VU3nNPMsdXd3n3gqaDygN5+KCFfJsjhwlj2xXpLOwbXpB8RA
         lh/VTB31o2lUNVmGsXDUDgGKxnNvbrbMuC3+jswtgMb2sb+wUIsAKDhAaBqho2oxKYoO
         TJvdWfWeFoIv4yrTlfrx6sw0g0aokz7ge6pzRkcoPY3ZWOKHfMM62F47HJLmEdcE2uYt
         bX8j6Z3GvzTUQlLJcMHeq3gsbPLz7ommR4u5oe4NmqAO4NvVYDU0mDPmQEo1HMXXQRdY
         DnhA==
X-Gm-Message-State: AAQBX9cmYtXfxBfhfiqOIo/saluVvNOrKpXepsb01qBUNrSr0EIyBOn/
	WNIzVOf/YnWG6KBEwbIhrsXBq6FJV4Ji4ggaRkSdL748nlY/xIF6pS8qrKTwHMNNWVzsJlv5jhQ
	sD1BF2nSQyuVDCSa1KOMNQPC2H+D5iwM=
X-Received: by 2002:a17:906:66c1:b0:878:711d:9310 with SMTP id k1-20020a17090666c100b00878711d9310mr1273968ejp.1.1680851126441;
        Fri, 07 Apr 2023 00:05:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350bzjSQgbr52e5pu0pxHM3+EK8myuLmAkwr/R04rHg5N7fdgj3sVGTxfmYaqxI5wPSe/V3+Jxg==
X-Received: by 2002:a17:906:66c1:b0:878:711d:9310 with SMTP id k1-20020a17090666c100b00878711d9310mr1273943ejp.1.1680851126066;
        Fri, 07 Apr 2023 00:05:26 -0700 (PDT)
Received: from localhost.localdomain (host-79-33-132-140.retail.telecomitalia.it. [79.33.132.140])
        by smtp.gmail.com with ESMTPSA id s7-20020a170906a18700b00929fc8d264dsm1766736ejy.17.2023.04.07.00.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 00:05:25 -0700 (PDT)
From: Andrea Righi <andrea.righi@canonical.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rix <trix@redhat.com>,
	Eric Curtin <ecurtin@redhat.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Neal Gompa <neal@gompa.dev>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts: rust: drop is_rust_module.sh
Date: Fri,  7 Apr 2023 09:05:17 +0200
Message-Id: <20230407070517.204676-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c1177979af9c ("btf, scripts: Exclude Rust CUs with pahole")
introduced the constraint "!DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE"
to enable RUST.

With this constraint we don't need is_rust_module.sh anymore, because
'pahole --lang_exclude=rust' already has the capability to exclude Rust
CUs. If pahole isn't recent enough (< 1.24) to support --lang_exclude,
then DEBUG_INFO_BTF can't be enabled with RUST and is_rust_module.sh
isn't used as well.

In any case is_rust_module.sh is obsolete and we can just drop it.

Link: https://lore.kernel.org/lkml/Y+p2xKIN6TJnQinK@righiandr-XPS-13-7390/
Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 rust/macros/module.rs     |  2 +-
 scripts/Makefile.modfinal |  2 --
 scripts/is_rust_module.sh | 16 ----------------
 3 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 100755 scripts/is_rust_module.sh

diff --git a/rust/macros/module.rs b/rust/macros/module.rs
index a7e363c2b044..608406f33a70 100644
--- a/rust/macros/module.rs
+++ b/rust/macros/module.rs
@@ -179,7 +179,7 @@ pub(crate) fn module(ts: TokenStream) -> TokenStream {
             /// Used by the printing macros, e.g. [`info!`].
             const __LOG_PREFIX: &[u8] = b\"{name}\\0\";
 
-            /// The \"Rust loadable module\" mark, for `scripts/is_rust_module.sh`.
+            /// The \"Rust loadable module\" mark.
             //
             // This may be best done another way later on, e.g. as a new modinfo
             // key or a new section. For the moment, keep it simple.
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 4703f652c009..e6f8fa3c9b8d 100644
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
index 28b3831a7593..000000000000
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
-${NM} "$*" | grep -qE '^[0-9a-fA-F]+ r _R[^[:space:]]+16___IS_RUST_MODULE[^[:space:]]*$'
-- 
2.39.2

