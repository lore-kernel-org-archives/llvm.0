Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2EE23C8DB
	for <llvm@lists.linux.dev>; Wed, 21 May 2025 22:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747868058; cv=none; b=A/k2hQMBKt8sMOCNlCfUiWpGbvCP5jJauX72kdvWdSxQbSNlwv1Xd5EGq4bLtb8PK7HY7cYzg82t3g8pzs28PjPGx0gmWJYrPGti9kZRVlt42ob1KxG3IA5wjY60J0ZC7yTeTh6NHkAEwMe0H+GPzHRwpeosVbLdBHjgurmfz9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747868058; c=relaxed/simple;
	bh=+AUYSNahAWGf9W1tBYRZu9JyCsHrw3J+A7EkvETxE5o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=L0/zHCqvin6RU4WZ4s1/+utTz3vlfRKeRsee2pbf98isS9xi/8o7qb4SznPhaV+rdZJuwDWmDvCl+43Ge9orJExjmehRUi3EbXiD8nmVXa/dws5jHP1646ziroYP1SyBmya1znHUdLM7P+KyPfTUaEWvaL6FucS8dTBuWGHqTJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuzhuo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lal4QuzZ; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuzhuo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lal4QuzZ"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7398d70abbfso9935383b3a.2
        for <llvm@lists.linux.dev>; Wed, 21 May 2025 15:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747868056; x=1748472856; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y5iEOEtDGQjkBBG8+IR+GBcP08I1z1xCE1eB2Wanmvw=;
        b=lal4QuzZgFteB13yjE1Os+4ZAmTE3pCP+7u8+jVw39F+8Q1UhccpdTyIWUwWBroHFs
         sAmOoBZb+FrdcRV8QM0Qm3OxyzvawN4liB3GQGjeQtZ1zFvuRYq7B5KxGPoHsanh+bPL
         LV4QZW+Ak9pJuHB4TtBPqQbFWo03McFApjS3p39+aXofCgZ/mICn64D9tMIavImvgZJJ
         zwwTO89K58nle51F3fmxbsMcK8ddHitqXQWooDECH3A1aWn+YTDZXH/y8LQmDNFvECKs
         clFJGU0Nj5jPrqXVwJTmZ9hUFC1TtIVpSR1YZIunhYNjsF5pivgDDUVtMudBnK/CYkDE
         IY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747868056; x=1748472856;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y5iEOEtDGQjkBBG8+IR+GBcP08I1z1xCE1eB2Wanmvw=;
        b=cjt2CKiJy71hq5hgcJiW4bRMhn2jxKDSbB41DRNGjrciVIf155+qnYYGvPEG/zcS6X
         l1jORlmJ5PPUQ+sfJilL/wi7otPE/KBBJmeTdW911b0HcgXBG9IOscBVLCWngtrDeLff
         S2MnEuYnnxp3vc4//+tQJm2HEOtPsujbJuzRSM/5fcsafILM4QklNAKRvZvQlh1tEATS
         neqGxLGgGFsOV6Vz362zzArJ4iOWXRNeusaHwTJ3jvGvT9fBEXWgJ6RgTSfnCLtoEAS5
         /jDGsUJGU2hSJ+tf5YZsB+y7Bkzo/njUT9QIrSUD7aO1XIP3VkGcwZ1zkhud5kn6S2i+
         EVPw==
X-Forwarded-Encrypted: i=1; AJvYcCXUwQmOs+uxjVkg1w14xMhHYs+ZSsEqgKLhWuGR6LUp1o41Wg/yTo2jiPLIK4dEl/rPuHGl@lists.linux.dev
X-Gm-Message-State: AOJu0YxiN4oPDHr4BeD335ANotcp3vYS5FfFuHn7WMFy/tXg2pti6ej1
	AzV+8qGwKdd3zbjI4ltdnc3clOPf3hpqzCoZNtdl0ouKtLzLbblfZaNg+bE3gbvH5AWKomAuFN8
	ySabgLw==
X-Google-Smtp-Source: AGHT+IEK2MKOxh7O7TqCVhedlN7LWirgEvC2NFjssFnsIa6UXUWSiPhGiHliRMQVf82CzHliIwdjxuvaB50=
X-Received: from pfbjw12.prod.google.com ([2002:a05:6a00:928c:b0:736:b2a2:5bfe])
 (user=yuzhuo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d12:b0:1f5:59e5:8ada
 with SMTP id adf61e73a8af0-2162187a945mr31068430637.4.1747868055561; Wed, 21
 May 2025 15:54:15 -0700 (PDT)
Date: Wed, 21 May 2025 15:53:06 -0700
In-Reply-To: <20250521225307.743726-1-yuzhuo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250521225307.743726-1-yuzhuo@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250521225307.743726-4-yuzhuo@google.com>
Subject: [PATCH v1 3/4] perf genelf: Remove libcrypto dependency and use sha1 utils
From: Yuzhuo Jing <yuzhuo@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Liang Kan <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	James Clark <james.clark@linaro.org>, Tomas Glozar <tglozar@redhat.com>, Leo Yan <leo.yan@arm.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yuzhuo Jing <yuzhuo@google.com>, 
	Yang Jihong <yangjihong@bytedance.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, 
	Wei Yang <richard.weiyang@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

genelf is the only file in perf that depends on libcrypto (or openssl)
which only calculates a Build ID (SHA1, MD5, or URANDOM).  SHA1 was
expected to be the default option, but MD5 was used by default due to
previous issues when linking against Java.  This commit switches genelf
to use in-house SHA1 utils, and also removes MD5 and URANDOM options
since we have a reliable SHA1 implementation to rely on.  It passes the
tools/perf/tests/shell/test_java_symbol.sh test.

Signed-off-by: Yuzhuo Jing <yuzhuo@google.com>
---
 tools/perf/util/genelf.c | 72 ++++------------------------------------
 1 file changed, 6 insertions(+), 66 deletions(-)

diff --git a/tools/perf/util/genelf.c b/tools/perf/util/genelf.c
index cdce7f173d00..cfedb29260ef 100644
--- a/tools/perf/util/genelf.c
+++ b/tools/perf/util/genelf.c
@@ -28,24 +28,7 @@
 #define NT_GNU_BUILD_ID 3
 #endif
 
-#define BUILD_ID_URANDOM /* different uuid for each run */
-
-#ifdef HAVE_LIBCRYPTO_SUPPORT
-
-#define BUILD_ID_MD5
-#undef BUILD_ID_SHA	/* does not seem to work well when linked with Java */
-#undef BUILD_ID_URANDOM /* different uuid for each run */
-
-#ifdef BUILD_ID_SHA
-#include <openssl/sha.h>
-#endif
-
-#ifdef BUILD_ID_MD5
-#include <openssl/evp.h>
-#include <openssl/md5.h>
-#endif
-#endif
-
+#include "sha1_base.h"
 
 typedef struct {
   unsigned int namesz;  /* Size of entry's owner string */
@@ -92,64 +75,21 @@ static Elf_Sym symtab[]={
 	}
 };
 
-#ifdef BUILD_ID_URANDOM
-static void
-gen_build_id(struct buildid_note *note,
-	     unsigned long load_addr __maybe_unused,
-	     const void *code __maybe_unused,
-	     size_t csize __maybe_unused)
-{
-	int fd;
-	size_t sz = sizeof(note->build_id);
-	ssize_t sret;
-
-	fd = open("/dev/urandom", O_RDONLY);
-	if (fd == -1)
-		err(1, "cannot access /dev/urandom for buildid");
-
-	sret = read(fd, note->build_id, sz);
-
-	close(fd);
-
-	if (sret != (ssize_t)sz)
-		memset(note->build_id, 0, sz);
-}
-#endif
-
-#ifdef BUILD_ID_SHA
 static void
 gen_build_id(struct buildid_note *note,
 	     unsigned long load_addr __maybe_unused,
 	     const void *code,
 	     size_t csize)
 {
-	if (sizeof(note->build_id) < SHA_DIGEST_LENGTH)
-		errx(1, "build_id too small for SHA1");
-
-	SHA1(code, csize, (unsigned char *)note->build_id);
-}
-#endif
-
-#ifdef BUILD_ID_MD5
-static void
-gen_build_id(struct buildid_note *note, unsigned long load_addr, const void *code, size_t csize)
-{
-	EVP_MD_CTX *mdctx;
+	struct sha1_state sctx;
 
-	if (sizeof(note->build_id) < 16)
-		errx(1, "build_id too small for MD5");
+	if (sizeof(note->build_id) < SHA1_DIGEST_SIZE)
+		errx(1, "build_id too small for SHA1");
 
-	mdctx = EVP_MD_CTX_new();
-	if (!mdctx)
-		errx(2, "failed to create EVP_MD_CTX");
+	sha1_base_init(&sctx);
 
-	EVP_DigestInit_ex(mdctx, EVP_md5(), NULL);
-	EVP_DigestUpdate(mdctx, &load_addr, sizeof(load_addr));
-	EVP_DigestUpdate(mdctx, code, csize);
-	EVP_DigestFinal_ex(mdctx, (unsigned char *)note->build_id, NULL);
-	EVP_MD_CTX_free(mdctx);
+	crypto_sha1_finup(&sctx, code, csize, (unsigned char *)note->build_id);
 }
-#endif
 
 static int
 jit_add_eh_frame_info(Elf *e, void* unwinding, uint64_t unwinding_header_size,
-- 
2.49.0.1164.gab81da1b16-goog

