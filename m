Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFABE5C96
	for <llvm@lists.linux.dev>; Thu, 20 Oct 2022 17:57:09 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 204-20020a2510d5000000b006be7970889cso362698ybq.21
        for <llvm@lists.linux.dev>; Thu, 20 Oct 2022 10:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ec6GrMr134d5K39JN9EGJ6lab7lvP07iPKgVQfMKzc4=;
        b=mtYKVeaPkO6QSyeUgHeL74R1RQhtV2UFl2xprFsF7k0UOHVkxog3a3agIjyYv3ILMR
         4dSVWWVlgmc8KrTlUDBuLbRcOeAcF0U8Iyk1PPYvr12nkETiJYv/bAk7HxEytiR541B1
         mgRUbEGMGVDEFzROtM88OxMANZlTJ4aX5UpDMUN5y7aAqnTv2lPdsOMA0eh+QUygTC7e
         rdkY2Xmy4eTjg8T73nV4fuBen9o7yHdEZehpRGcwGmB/cUNC4svSLlIAcfz2olPG8WQ2
         RVxQF4AVw1EIE55AOV5reh/Hh3i8junL8h88BDFnoXKLqf6AbLmvsxUkPc/qx3M3FfX+
         QYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ec6GrMr134d5K39JN9EGJ6lab7lvP07iPKgVQfMKzc4=;
        b=0QhS7LQ+o4hFCIsTvX1czdgb9YX+qJoceeWrugCSOAoG4vklzbMWJ1I8W4LdTf962R
         P0XApnRIisW8ZuHbU/KqL5pVq3+X2xT30fjNJ86LwTVtx7DYTAXte+RauP+QxonpVfe1
         4zxZhCkrQrXfk/pinsAaYWWGhOVdhDB2sMVsH2TU4MyOD68WDwyDhxgK9jH74s1PDubE
         TVXQIg09Tw5Sb7RocyqKPnz71UavDivycN7uDHUhXn1bx3aCJaN/RYjGbPnI9U1Ve/cC
         XPahTxMYd6O2Nt3h+CsJAGiaJHufQ3kmXqcVK6cGDh43ZMMJS9uoMR5T7b66L5dcWG0T
         iLkA==
X-Gm-Message-State: ACrzQf3bkp/xMWfhHRJzKVKqbLWj4MP58CT4hs7lwedfBHN3TIA1wOgk
	EWBRKON/9Q68nsaA031MpnkJLzdk11uZK66tBBE=
X-Google-Smtp-Source: AMsMyM61Ms54Wunhjhdb9akAeWWVPBHJ4MsPlEjXe+lfdiz+EPY+7u8Q0NxjhR5fbjntLzuUa1dxx8OIJxC4iuYwi08=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:a5cc:f0f5:1fc6:713])
 (user=ndesaulniers job=sendgmr) by 2002:a5b:70f:0:b0:6ca:2f3d:1dbf with SMTP
 id g15-20020a5b070f000000b006ca2f3d1dbfmr3869419ybq.226.1666288628924; Thu,
 20 Oct 2022 10:57:08 -0700 (PDT)
Date: Thu, 20 Oct 2022 10:56:49 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1666288609; l=4033;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=ovpA4QAbIEpcw/Q/ivuVUvthOkcDqOfws3j88FyMzgY=;
 b=HkkhphwDWYZ/FhUnguFN40v5u3kGBJgdujuqhmHB95xetu3Y/CRX62Am2WTKt2C+2SJD4wlCo6t+
 bLkcFARMDCAEDA09XXeVkecc2rUQbLKhLHXREUK8x/aGjQwgZTb0
X-Mailer: git-send-email 2.38.0.135.g90850a2211-goog
Message-ID: <20221020175655.1660864-1-ndesaulniers@google.com>
Subject: [PATCH] Makefile.debug: support for -gz=zstd
From: Nick Desaulniers <ndesaulniers@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Fangrui Song <maskray@google.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Sedat Dilek <sedat.dilek@dhl.com>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Terrell <terrelln@fb.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	David Gow <davidgow@google.com>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Dan Williams <dan.j.williams@intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Isabella Basso <isabbasso@riseup.net>, 
	Vlastimil Babka <vbabka@suse.cz>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, 
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

Link: https://maskray.me/blog/2022-09-09-zstd-compressed-debug-sections
Link: https://maskray.me/blog/2022-01-23-compressed-debug-sections
Suggested-by: Sedat Dilek (DHL Supply Chain) <sedat.dilek@dhl.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 lib/Kconfig.debug      | 26 +++++++++++++++++++++++++-
 scripts/Makefile.debug |  4 ++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 3fc7abffc7aa..4085ac77dc12 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -312,8 +312,22 @@ config DEBUG_INFO_REDUCED
 	  DEBUG_INFO build and compile times are reduced too.
 	  Only works with newer gcc versions.
 
+choice
+	prompt "Compressed Debug information"
+	depends on DEBUG_KERNEL
+	help
+	  Compress the resulting debug info. Results in smaller debug info sections,
+	  but requires that consumers are able to decompress the results.
+
+	  If unsure, choose DEBUG_INFO_UNCOMPRESSED.
+
+config DEBUG_INFO_UNCOMPRESSED
+	bool "Don't compress debug information"
+	help
+	  Don't compress debug info sections.
+
 config DEBUG_INFO_COMPRESSED
-	bool "Compressed debugging information"
+	bool "Compress debugging information with zlib"
 	depends on $(cc-option,-gz=zlib)
 	depends on $(ld-option,--compress-debug-sections=zlib)
 	help
@@ -327,6 +341,16 @@ config DEBUG_INFO_COMPRESSED
 	  preferable to setting $KDEB_COMPRESS to "none" which would be even
 	  larger.
 
+config DEBUG_INFO_COMPRESSED_ZSTD
+	bool "Compress debugging information with zstd"
+	depends on $(cc-option,-gz=zstd)
+	depends on $(ld-option,--compress-debug-sections=zstd)
+	help
+	  Compress the debug information using zstd.  Requires GCC 13.0+ or Clang
+	  16.0+, binutils 2.40+, and zstd.
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
-- 
2.38.0.135.g90850a2211-goog

