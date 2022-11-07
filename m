Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8197812294
	for <llvm@lists.linux.dev>; Mon,  7 Nov 2022 18:01:47 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id p66-20020a257445000000b006ca0ba7608fso11744324ybc.7
        for <llvm@lists.linux.dev>; Mon, 07 Nov 2022 10:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tS32EJHch/dBCbWB1L1GEsMMs2fsIbqQFe/97cUFWvM=;
        b=SQYIlLQKDlVnO9q4XFVS6JNGHFLzyXs2BBOTrJ3U2uoFJbz2V1TKCFigITFOkkCBsE
         P7yQEfNwhQDVnNt0lODX16Vj27w+OJsABLNwgNbT28C7yj0B7MRxu0LROLDNT0YKsV2H
         JtLo7sPWQ4n6uVNVn1LklyOZb4adAa+tyftuIUOIFc8ZIbd407jzLM9lVPMTITSIu3QB
         z+ijEaWLv3jAQQ3qeE5n4npuiVJSiDgovDpowJTDvxuAEeEvl5gsUaouodZ7uuTbA+f5
         P4Jrw/KEVPN5Bt0BkSSedMJ32GuffqeJmr+qFlsHcZUirO7vanhPCmC7o4mKfdGCT6jn
         VLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tS32EJHch/dBCbWB1L1GEsMMs2fsIbqQFe/97cUFWvM=;
        b=zFY1/feuBZQsaYPyfDt2oZ0GV96ZIyUKuIZeEuWXPAEr3D8HYro2dgYLjXtLfrw+gR
         g0KIgRi1QoR3uAuE3oGnoFBp2vyVmNecZplYWKjwm87HqFBi5oZ2uSMibrm1QxA5mUYG
         daMrKNVcN3MSzi3JNDzgVYfYk7Grch0fJS2dVY/nyURfL7KC2WH20coU5RDBgbDxPPJD
         pkZquI0X5GZSsIvXeon5rWmIaqrhFI9tVV6/5iAO1izNsbuU8+nPV2hvyDThz+NGSGdb
         oWFc2lazK2kidv2/jjdBLD/CHgEed8Tx8OZ+kxvr1vVCGhprKeMYhwKlYmr8ejqJjdUV
         XJMQ==
X-Gm-Message-State: ACrzQf07Uy4UkL3yTtz6k19KUlekoDKdM9VhjXR3K6lhXY8sGLk6PCSd
	PjD5VyWBDQCA4vJqDQTzIP+7pTC2EujwwKw3FkE=
X-Google-Smtp-Source: AMsMyM43ETSncLgam+YPFOfqqMnPhR2b4p/E/JIxE9g3tkFOoKJwqElFbUb+Eh05NX1YCpgkMicQmG4tLxtVEWUKbzg=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:a5cc:f0f5:1fc6:713])
 (user=ndesaulniers job=sendgmr) by 2002:a25:a18a:0:b0:6cc:90d7:2494 with SMTP
 id a10-20020a25a18a000000b006cc90d72494mr44462663ybi.210.1667844106473; Mon,
 07 Nov 2022 10:01:46 -0800 (PST)
Date: Mon,  7 Nov 2022 10:01:33 -0800
In-Reply-To: <CAK7LNATrBDSLqBZFmWr5RA542pUVR=mieUSNVYXy8thkHS6w_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CAK7LNATrBDSLqBZFmWr5RA542pUVR=mieUSNVYXy8thkHS6w_A@mail.gmail.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1667844093; l=4727;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=ngUXhzx1TaUsWCpO5TJrX+dyZDEqf8GPaOtwJXhjBcI=;
 b=mh/Lzv9loBNdaHCrZfNBXOodUwGUUfOiCAZ00kw3hTNN2oumOkTD1WEv6uV6QH6fLPk2XynGvH1k
 Cqo9MNghBOERc78BQRWrFhcemifO4ZzhW5x8THu1yfxq7Ar1hk+U
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221107180137.3634978-1-ndesaulniers@google.com>
Subject: [PATCH v2] Makefile.debug: support for -gz=zstd
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Fangrui Song <maskray@google.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Sedat Dilek <sedat.dilek@dhl.com>, Nathan Chancellor <nathan@kernel.org>, 
	Michal Marek <michal.lkml@markovi.net>, Nick Terrell <terrelln@fb.com>, Tom Rix <trix@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Isabella Basso <isabbasso@riseup.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Make DEBUG_INFO_COMPRESSED a choice; DEBUG_INFO_UNCOMPRESSED is the
default, DEBUG_INFO_COMPRESSED uses zlib, DEBUG_INFO_COMPRESSED_ZSTD
uses zstd.

Some quick N=1 measurements with du, /usr/bin/time -v, and bloaty:

clang-16, x86_64 defconfig plus
CONFIG_DEBUG_INFO=y CONFIG_DEBUG_INFO_UNCOMPRESSED=y:
Elapsed (wall clock) time (h:mm:ss or m:ss): 0:55.43
488M vmlinux
27.6%   136Mi   0.0%       0    .debug_info
 6.1%  30.2Mi   0.0%       0    .debug_str_offsets
 3.5%  17.2Mi   0.0%       0    .debug_line
 3.3%  16.3Mi   0.0%       0    .debug_loclists
 0.9%  4.62Mi   0.0%       0    .debug_str

clang-16, x86_64 defconfig plus
CONFIG_DEBUG_INFO=y CONFIG_DEBUG_INFO_COMPRESSED=y (zlib):
Elapsed (wall clock) time (h:mm:ss or m:ss): 1:00.35
385M vmlinux
21.8%  85.4Mi   0.0%       0    .debug_info
 2.1%  8.26Mi   0.0%       0    .debug_str_offsets
 2.1%  8.24Mi   0.0%       0    .debug_loclists
 1.9%  7.48Mi   0.0%       0    .debug_line
 0.5%  1.94Mi   0.0%       0    .debug_str

clang-16, x86_64 defconfig plus
CONFIG_DEBUG_INFO=y CONFIG_DEBUG_INFO_COMPRESSED_ZSTD=y (zstd):
Elapsed (wall clock) time (h:mm:ss or m:ss): 0:59.69
373M vmlinux
21.4%  81.4Mi   0.0%       0    .debug_info
 2.3%  8.85Mi   0.0%       0    .debug_loclists
 1.5%  5.71Mi   0.0%       0    .debug_line
 0.5%  1.95Mi   0.0%       0    .debug_str_offsets
 0.4%  1.62Mi   0.0%       0    .debug_str

That's only a 3.11% overall binary size savings over zlib, but at no
performance regression.

This renames the existing KConfig options:
* DEBUG_INFO_UNCOMPRESSED -> DEBUG_INFO_COMPRESSED_NONE
* DEBUG_INFO_COMPRESSED -> DEBUG_INFO_COMPRESSED_ZLIB
So users upgrading may need to reset the new Kconfigs.

Link: https://maskray.me/blog/2022-09-09-zstd-compressed-debug-sections
Link: https://maskray.me/blog/2022-01-23-compressed-debug-sections
Suggested-by: Sedat Dilek (DHL Supply Chain) <sedat.dilek@dhl.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes v1 -> v2:
* Remove `depends on DEBUG_KERNEL` as per Nathan.
* Rename Kconfigs as per Sedat and Masahiro.
* Add note about renamed Kconfigs to commit message.
* Add more help text to DEBUG_INFO_COMPRESSED_ZSTD.

 lib/Kconfig.debug      | 29 +++++++++++++++++++++++++++--
 scripts/Makefile.debug |  4 ++++
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 29280072dc0e..7c28a8fba02e 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -312,8 +312,21 @@ config DEBUG_INFO_REDUCED
 	  DEBUG_INFO build and compile times are reduced too.
 	  Only works with newer gcc versions.
 
-config DEBUG_INFO_COMPRESSED
-	bool "Compressed debugging information"
+choice
+	prompt "Compressed Debug information"
+	help
+	  Compress the resulting debug info. Results in smaller debug info sections,
+	  but requires that consumers are able to decompress the results.
+
+	  If unsure, choose DEBUG_INFO_COMPRESSED_NONE.
+
+config DEBUG_INFO_COMPRESSED_NONE
+	bool "Don't compress debug information"
+	help
+	  Don't compress debug info sections.
+
+config DEBUG_INFO_COMPRESSED_ZLIB
+	bool "Compress debugging information with zlib"
 	depends on $(cc-option,-gz=zlib)
 	depends on $(ld-option,--compress-debug-sections=zlib)
 	help
@@ -327,6 +340,18 @@ config DEBUG_INFO_COMPRESSED
 	  preferable to setting $KDEB_COMPRESS to "none" which would be even
 	  larger.
 
+config DEBUG_INFO_COMPRESSED_ZSTD
+	bool "Compress debugging information with zstd"
+	depends on $(cc-option,-gz=zstd)
+	depends on $(ld-option,--compress-debug-sections=zstd)
+	help
+	  Compress the debug information using zstd.  This may provide better
+	  compression than zlib, for about the same time costs, but requires newer
+	  toolchain support.  Requires GCC 13.0+ or Clang 16.0+, binutils 2.40+, and
+	  zstd.
+
+endchoice # "Compressed Debug information"
+
 config DEBUG_INFO_SPLIT
 	bool "Produce split debuginfo in .dwo files"
 	depends on $(cc-option,-gsplit-dwarf)
diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
index 332c486f705f..8ac3379d2255 100644
--- a/scripts/Makefile.debug
+++ b/scripts/Makefile.debug
@@ -31,6 +31,10 @@ ifdef CONFIG_DEBUG_INFO_COMPRESSED
 DEBUG_CFLAGS	+= -gz=zlib
 KBUILD_AFLAGS	+= -gz=zlib
 KBUILD_LDFLAGS	+= --compress-debug-sections=zlib
+else ifdef CONFIG_DEBUG_INFO_COMPRESSED_ZSTD
+DEBUG_CFLAGS	+= -gz=zstd
+KBUILD_AFLAGS	+= -gz=zstd
+KBUILD_LDFLAGS	+= --compress-debug-sections=zstd
 endif
 
 KBUILD_CFLAGS	+= $(DEBUG_CFLAGS)

base-commit: f0c4d9fc9cc9462659728d168387191387e903cc
-- 
2.38.1.431.g37b22c650d-goog

