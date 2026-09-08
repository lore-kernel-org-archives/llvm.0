Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D56E58FD2C
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 16:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886517; cv=none; b=fXVsq66POOtfq+fyQwpRgESKwsSkyvHgrM3aj7jDlUYINIzp9GI/UrglsO4AETqkZVGzVarPJ2hR/kcDJemPFmxETVsWgnZwe12ZvPqqMcz+KLR1MTrXn0V4VIg5J3B7LR0iunuobqpJZGnkfb30OVXV3Z+1MXE9XGM/FBPeiY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886517; c=relaxed/simple;
	bh=jWrqAHnqkILFV1YH9xYKa130B7ghMaQXLo+ayiQ9UN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pw0yimN3/XcxF4qJV4PVVGkAyhUs2Mo9WEQVV3n2cB+pG12iizQ/q1Mq6Tb4q3gZSUo6631wDEW+Om6uoNldyYBRuM/Td8L0g+t3wE4nBrH4438NwPYspNc+sp92cQyKKTI7oimpkbS6aDpV7gyA9jP8CZ9012J5ASnNzAhCEZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JEr9hkI4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JEr9hkI4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3bc34cso140865e9.0
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 09:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886514; x=1789491314; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3DzdAFO70KwGDjJHYL4MMa9eTii8Dfq+RaBQI260U8=;
        b=JEr9hkI4RXGAxc7HtbDmQGAlozK8pfIG0sx3HBN5e2x+kJ0Th6lIehDsiDaqFrmNDR
         XzgU+zlyTUaaAwiaxkx3xP/Tkja0yb4eJaztI7bUeLuDO8Ip+LfRafC5P88DRBnBD6Pp
         UXINTbgIJnMvE/yLG4zugu13EXQCNX6cFdDe1F58Vyu8TYFp6nx45X3qY+ItZR81qR3K
         cUjF/Gjp7l9nqWHKMbhf4/PpGD/58LiT/oAe/4PsJHoDgv3VQjCYox1R2JaLJp2LPBKP
         G0R3A54cd8HR7C1F8Mdua+hQ9jWLdmO4G0H06fNPmchp0pqKcqQjpjXBzuCVqsbMgSJr
         /4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886514; x=1789491314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R3DzdAFO70KwGDjJHYL4MMa9eTii8Dfq+RaBQI260U8=;
        b=f8glwpdDC2iMTfQxWZ+45ynmtcE1v+v9D+R1gQeNc1iv2E4ZzlPJ9keGMb8Qhv8PdV
         n0Su617xqJK9fHOjZ90xkpengiEpDCnRgf1X8Ye2ILNCMMuM25daCMZY35d6AcoVYmDC
         myEgl+qiOgneMxPHnrSP4BQ3tCd2bUAxSn5c627Kb2on7NJR61PfG9nrckLOWGxJhg4V
         FvPOwrfgA7y7TqS6NO1jLV+qRC+S9CWuMU5W4Y3NwmfJ+DWgp1wd/E3UhAGveqfGiOJZ
         Drrz8gBWlA1YI3+4bQ6KMaCEWVljyqqRp06rukNzPmFBwJ8m8bwAClc6w0MTf781XIsJ
         rceA==
X-Forwarded-Encrypted: i=1; AKwUvBwB18VTLEmppdb/v5XYAHGvm/8IsnbLPrJFHmYYmgWu/56w5A58cT7iyCFykdsTxTNxVqOj@lists.linux.dev
X-Gm-Message-State: AFuF++lXglG0XXzt11oD3hgzPd++D6alBJKIbvOhfGkU9Dtm2csaHgnP
	RxnHRibw4b4nLojEP3dA75KYqS0s9+MyUByZ4Nw4ME5Bjk12r1qtoDBGJj+fE2b+rw==
X-Gm-Gg: AYBFou0N9qaAr49CLUij1LBJJ5HdBld9LpoJhvyt9Yvi/GYG/QDAVV9S8+gSkHCxxwB
	xgWSbaBNGmOFo7hl+K8cZOj5FxvHcV3Jh0GFz2HR2ccFseQGQjb60H+wmZfA25ECqi8L+Rg2Z2G
	mtFIrjDatMYoYmxrsza/UYmsXV7Ja3Nn9Ckr3ixlanxLD+GtaL40SmITBMwDVnEkTJH5bjHxxuB
	BtQGxEuGTiMiymAbeqKmsG7qGCSNc9Kg2jwnOGEHrLn77pgj8aTHGQ+B8qf+5e9CtL1RanURE5U
	l7eIkmoVcG4EtBNmSvDO1OCfqtt3tkRfyHEgA778sEA0m+qz21P+5zjSGzS38PCrgXpQb/ILwCd
	95bUG2YiZZL8lzs5ZJ+PRbUvc7P0HJzQn/U0nd4hfbt5fKBlSb5Deu+WBWsPKlxxeMzd+RVGAuZ
	dwPIdqRGiB5aeJGkulNKf2g2fGVb+obIqv+H1HKiwE657Qgd5eJqScxGCDWkTBFF6pwJPFarst4
	IdlR+UUE1AU5oRLueVx1nV/f29UYae5iJCJnIcsmZujMza5
X-Received: by 2002:a05:600c:a418:b0:499:7da3:dd0c with SMTP id 5b1f17b1804b1-49d00ab4237mr2533115e9.0.1788886513189;
        Tue, 08 Sep 2026 09:55:13 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm24137110f8f.0.2026.09.08.09.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:12 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:47 +0200
Subject: [PATCH RFC v3 07/12] kasan: provide memory access information to
 KCOV
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-7-dcbc11593e88@google.com>
References: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
In-Reply-To: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=6000;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=jWrqAHnqkILFV1YH9xYKa130B7ghMaQXLo+ayiQ9UN8=;
 b=XDDNcY0FkeFwasVBghiWsijYmlXi6Ml7BF/P9dZjWRpo+jfqVHsfEoOKHFmZBCIoyrxi6gMmF
 LHYJw90WPRKD7HDpuhMEaNyizksoKFaOWz41Njq17MJoqgWECkQiIti
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

In CONFIG_KCOV_MEMORY builds, let KASAN provide information about memory
accesses to KCOV.
Since KCOV already receives information from instrument_*() directly,
filter out those accesses by introducing KASAN_TYPE_EXPLICIT.
Because the KCOV usecase requires seeing ~every memory access (including
accesses to globals and repeated accesses to the same memory location
within a basic block), gate this on CC_IS_CLANG and let it flip some hidden
LLVM flags that disable ASAN optimizations.

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/linux/kasan.h  |  1 +
 lib/Kconfig.debug      |  2 ++
 lib/Kconfig.kasan      |  9 +++++++++
 mm/kasan/generic.c     | 15 +++++++++++++++
 mm/kasan/shadow.c      |  5 +++--
 scripts/Makefile.kasan | 17 +++++++++++++++++
 tools/objtool/check.c  |  1 +
 7 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index 03c7ac79345d..4b915e0c51bc 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -34,6 +34,7 @@ typedef unsigned int __bitwise kasan_vmalloc_flags_t;
 #define KASAN_VMALLOC_TLB_FLUSH  0x2 /* TLB flush */
 
 #define KASAN_TYPE_WRITE 0x1
+#define KASAN_TYPE_EXPLICIT 0x2
 
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 5de427ccc42d..f763f0504f62 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2221,6 +2221,8 @@ config KCOV_MEMORY
 	bool "Enable memory access trace collection by KCOV"
 	depends on KCOV
 	depends on KCOV_EXT_RECORDS
+	depends on HAVE_KASAN_REPORT_EVERY_ACCESS
+	select KASAN_REPORT_EVERY_ACCESS
 	help
 	  Provide a KCOV mode which records memory access operations and allows
 	  userspace to inject execution delays to impose constraints on the
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index a4bb610a7a6f..9a43f6269c5c 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -228,4 +228,13 @@ config KASAN_EXTRA_INFO
 	  boot parameter, it will add 8 * stack_ring_size bytes of additional
 	  memory consumption.
 
+# Is KASAN_REPORT_EVERY_ACCESS allowed?
+config HAVE_KASAN_REPORT_EVERY_ACCESS
+	def_bool y
+	depends on KASAN_OUTLINE
+	depends on CC_IS_CLANG
+
+config KASAN_REPORT_EVERY_ACCESS
+	bool
+
 endif # KASAN
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 9efd6fbbb7c3..6cf88f569e64 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -32,6 +32,8 @@
 #include <linux/types.h>
 #include <linux/vmalloc.h>
 #include <linux/bug.h>
+#include <linux/kcov.h>
+#include <uapi/linux/kcov.h>
 
 #include "kasan.h"
 #include "../slab.h"
@@ -182,6 +184,19 @@ static __always_inline bool check_region_inline(const void *addr,
 	if (unlikely(size == 0))
 		return true;
 
+	/*
+	 * Do not route information about an access to KCOV if we got called
+	 * through the instrument_*() path - KCOV can get those accesses
+	 * directly from instrument_*(), and get a bit more metadata about the
+	 * access that way.
+	 */
+	if (likely((flags & KASAN_TYPE_EXPLICIT) == 0)) {
+		unsigned int kcov_flags =
+			(flags & KASAN_TYPE_WRITE) ? MEMORY_ACCESS_RECORD_WRITE : 0;
+
+		__kcov_handle_memaccess(addr, size, kcov_flags, ret_ip);
+	}
+
 	if (unlikely(addr + size < addr))
 		return !kasan_report(addr, size, flags, ret_ip);
 
diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index a24f1225dd88..84f8567d4f2c 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -28,13 +28,14 @@
 
 bool __kasan_check_read(const volatile void *p, unsigned int size)
 {
-	return kasan_check_range((void *)p, size, 0, _RET_IP_);
+	return kasan_check_range((void *)p, size, KASAN_TYPE_EXPLICIT, _RET_IP_);
 }
 EXPORT_SYMBOL(__kasan_check_read);
 
 bool __kasan_check_write(const volatile void *p, unsigned int size)
 {
-	return kasan_check_range((void *)p, size, KASAN_TYPE_WRITE, _RET_IP_);
+	return kasan_check_range((void *)p, size,
+		KASAN_TYPE_WRITE|KASAN_TYPE_EXPLICIT, _RET_IP_);
 }
 EXPORT_SYMBOL(__kasan_check_write);
 
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 91504e81247a..82e88c5fb9bc 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -60,6 +60,23 @@ kasan_params += asan-instrumentation-with-call-threshold=$(call_threshold) \
 		asan-instrument-allocas=1 \
 		asan-globals=1
 
+# When we piggyback tracing of memory accesses for race condition testing on top
+# of KASAN, we want the compiler to report memory accesses even when KASAN can
+# prove that no UAF/OOB can occur; in particular, these optimizations must be
+# inhibited:
+#
+#  - suppression of ASAN hook calls for global variables
+#  - merging of multiple accesses in a basic block into a single ASAN hook call
+#
+# For now, known stack variable accesses are still ignored as a performance
+# tradeoff, though that will probably make a small number of races (where
+# another task concurrently accesses stuff on our stack) invisible to the
+# instrumentation. (Stack access instrumentation is gated on
+# asan-use-stack-safety and asan-skip-promotable-allocas.)
+ifdef CONFIG_KASAN_REPORT_EVERY_ACCESS
+kasan_params += asan-opt-globals=0 asan-opt-same-temp=0
+endif # CONFIG_KASAN_REPORT_EVERY_ACCESS
+
 # Instrument memcpy/memset/memmove calls by using instrumented __asan_mem*()
 # instead. With compilers that don't support this option, compiler-inserted
 # memintrinsics won't be checked by KASAN on GENERIC_ENTRY architectures.
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index d70cb640e2ec..08ebfe1f3fac 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1219,6 +1219,7 @@ static const char *uaccess_safe_builtin[] = {
 	/* KCOV */
 	"write_comp_data",
 	"check_kcov_mode",
+	"__kcov_handle_memaccess",
 	"__sanitizer_cov_trace_pc",
 	"__sanitizer_cov_trace_pc_entry",
 	"__sanitizer_cov_trace_pc_exit",

-- 
2.55.0.979.g7e5102b832-goog

