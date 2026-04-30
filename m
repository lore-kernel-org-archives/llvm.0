Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15FB410D07
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553634; cv=none; b=TD2BcOnF+V4UYB0Bulvw6RgveIQJ5KRErJYtW6psf2zUkX2uDUXSNcFU7KKS9Ezs8GbBeUtH3h94kukk9Z87kaC2mU1ZqX5tHRfLGHV1g7xXiOGarwlMd6LvGAqhjnG8ETlGj7BICNkJ2aDiF/gEt4tuOCNX+YhVFMCELwtdIa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553634; c=relaxed/simple;
	bh=I2jxLztduWlfcb809/jc6vkR7pIiCKbFQIGItdln2/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fe0nLhZrZsMaDhg0KauWywxwSkcjbQX6qW8gednB0Ritr+Jbm7zZMW44veP5amtBqOPyEyNeKyOA88O1KBp8phQGegEAQtzxDwTeuJ3t4vbNomThOwm0nhbfG5tsGG3uO1GZfuqsS5KNHiptU8ICU79WHPGaAui8fMPxhyb9wcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IinaCSk5; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IinaCSk5"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso6512675e9.0
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 05:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777553630; x=1778158430; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+XbIgjuLQuX1ZjiX/bxTtSVSE3u4tQE56sxmhIL67k=;
        b=IinaCSk5SHRiSahMjY45zcTJNDo+syzvQO4bqX+XxuPIYKeRtog0z8Lj7UUW18qENe
         DwrHAhs4REI9iZmqK2speH+5XNdqUCtuJqKYQm/Ld545uuaLkYaPhi+AwrYP0ICmiWqi
         TGHLWRZLthvFHWK7RwcYdAKphBVunG/Awp3sbI6Y6xbcJ6RtQNY5JKR8BZY+oRcefktr
         nIb3QosEG7dgmRGmTd0iwC0hVyG0gJ5llSsNz56hUjC3BhZecrpIMWqT1pGPSqwckaet
         HM3EOcaiLYWMTNhVzP1xGxh9+RmlchXNhSdJgxMdaz3FgP5dQvLa0jJj6EWPNy4eLvAH
         YDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553630; x=1778158430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q+XbIgjuLQuX1ZjiX/bxTtSVSE3u4tQE56sxmhIL67k=;
        b=m1tMZ/BXiIsSpF6IzoB9rjdSOvLDkVS5LrRXTli/Bndv69Xkwi+nBFLxmsRGvFMZuh
         Qh1reIjlJC5R1okYy8QNPshmYgh2pAoIshnZKhIU7qRGc1BWCpUMbIcO59299O7PO1Gn
         bUZrDzspOiYLx2I0RowsiJDwu4L2Iv4TKI0NJlYXmf2gW3Bd3U3ULCGx0ZeTVUP6TqYH
         1Kw4qMlng3uNzrOANlO0n7nZLiufzlanwJ1Kc6r8Z7pVKaq8nRfNhvvo65/tZZo2iLHk
         KSSJJl+ZKdzNzVEbQWIK68Pd9wkS2nugnGeX3MqhkEEczmre0sP1n99jZS8CKIycXX3x
         EzHw==
X-Forwarded-Encrypted: i=1; AFNElJ9jv6Awh2FPQXaOxaKWCjLd1P5inH/Ti5Fn+Ia0gHj8ztIHtTHlyhe1xZldSWkRc/4GL/yD@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9SWCI48REuTtms2kehbYnOp7z21nwVyoGSe4DV5AMifOK4qjd
	F4BQge9K1x6S7P0vNrZDKdLi5SgEmej/9zBPvS5ol17PoLXbyPW+4yYX3j7U8mDaUT4=
X-Gm-Gg: AeBDievciTYV37FxPZWdtpHK09o2AIJpBBFwshuB8ANHR4UievO2HfkMIqQbIJpG1vv
	eE+9mM6PLDKBgtkhukaGqdJb3iPJ3/SzEFhb+XlsuGeibNfAdnkqBcdYyY95IdTSvDEBj+Lubcu
	KT4e07UO2QhUKNi3O1/1XGGfImyU3sS/dVi4eVe9A4fLCryxQgblala3d6m5S9JYvyPKXSLVDjR
	Rdr/0bZ6beB1M866ZQXaKfjLn22SbzNyT+v3hyBDeQanpeXFVOeU5HktynVBKhRyf0VB7R8LjUT
	BvihUI4tVe7nY+omfJyRbEQk06T4DbMq4ssgnzkkh1T6JvG9rcMFrQfT0CwhMGzSjGh2jmex0eH
	+7UxvzIZwrNo7PyF96v6mJgRg+kg+ikQavQurDlBNyt4Bzc8+M5/Huu7QrBZHId8OlD/ZQtT3Yh
	eNwhuRbqVdqlPs43u+nrdrT3Qy
X-Received: by 2002:a05:600c:4688:b0:48a:5342:36b5 with SMTP id 5b1f17b1804b1-48a8444d7a9mr50732385e9.21.1777553629800;
        Thu, 30 Apr 2026 05:53:49 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed1c07058esm8543218eec.15.2026.04.30.05.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:48 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 09:53:20 -0300
Subject: [PATCH bpf-next v10 08/11] selftests/bpf: Allow test_progs to link
 with a partial object set
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v10-8-cd302a31af16@suse.com>
References: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
In-Reply-To: <20260430-selftests-bpf_misconfig-v10-0-cd302a31af16@suse.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Alan Maguire <alan.maguire@oracle.com>, 
 "Ricardo B. Marliere" <rbm@suse.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1777553600; l=3578;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=I2jxLztduWlfcb809/jc6vkR7pIiCKbFQIGItdln2/s=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKqqdQsm33ueetLi82n66giduvjncuOEMLEwyV2vO+e5ZLsOaGwzTZasZ7Pb+J1KfYDzndi4FiJ
 5jpUI9g0qewY=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

When individual test files are skipped due to compilation failures, their
.test.o files are absent. The linker step currently lists all expected
.test.o files as explicit prerequisites, so make considers any missing one
an error.

In permissive mode, declare the test objects that already exist on disk
(via parse-time $(wildcard ...)) as normal prerequisites of the binary so
that modifications to a test source still trigger a relink, and keep the
full TRUNNER_TEST_OBJS list as order-only prerequisites so that initial
fresh builds still produce them and missing objects do not abort the link.
The recipe filter is split per mode: in permissive mode it combines a
recipe-time $(wildcard ...) (which catches objects freshly produced via
the order-only path on a fresh build) with $(filter-out
$(TRUNNER_TEST_OBJS),$^) (which keeps the non-test inputs from $^ but
drops the parse-time wildcard duplicates). This avoids passing the same
.test.o twice to the linker while still presenting test objects before
libbpf.a so that GNU ld, which scans static archives left-to-right, pulls
in archive members referenced exclusively by test objects (e.g.
ring_buffer__new from ringbuf.c). In default (strict) mode the recipe
remains the simple $(filter %.a %.o,$^) since TRUNNER_TEST_OBJS is part
of $^ exactly once.

Gate the partial-link behavior on $(if $(filter test_progs%,$1),...) so
it only applies to test_progs and its flavors. test_maps and similar
runners using strong cross-object references would link-fail with a
partial set and intentionally retain strict link semantics.

Note: adding a brand-new test_*.c file in permissive mode requires
removing the binary (or a clean rebuild) before the new test is linked
in, because the parse-time $(wildcard ...) is evaluated when the Makefile
is read and will not yet see the new .test.o. This is acceptable since
permissive mode targets tolerant CI builds rather than incremental
development.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 9becc077eb23..a64e822dc540 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -773,14 +773,15 @@ endif
 # some X.test.o files have runtime dependencies on Y.bpf.o files
 $(OUTPUT)/$(TRUNNER_BINARY): | $(TRUNNER_BPF_OBJS)
 
-$(OUTPUT)/$(TRUNNER_BINARY): $(TRUNNER_TEST_OBJS)			\
+$(OUTPUT)/$(TRUNNER_BINARY): $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),$$(wildcard $(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS)),$(TRUNNER_TEST_OBJS))	\
 			     $(TRUNNER_EXTRA_OBJS) $$(BPFOBJ)		\
 			     $(TRUNNER_LIB_OBJS)			\
 			     $(TRUNNER_BPFTOOL)				\
 			     $(OUTPUT)/veristat				\
-			     | $(TRUNNER_BINARY)-extras
+			     | $(TRUNNER_BINARY)-extras			\
+			     $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),$(TRUNNER_TEST_OBJS)))
 	$$(call msg,BINARY,,$$@)
-	$(Q)$$(CC) $$(CFLAGS) $$(filter %.a %.o,$$^) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
+	$(Q)$$(CC) $$(CFLAGS) $(if $(filter test_progs%,$1),$(if $(PERMISSIVE),$$(filter %.a %.o,$$(wildcard $(TRUNNER_TEST_OBJS)) $$(filter-out $(TRUNNER_TEST_OBJS),$$^)),$$(filter %.a %.o,$$^)),$$(filter %.a %.o,$$^)) $$(LDLIBS) $$(LLVM_LDLIBS) $$(LDFLAGS) $$(LLVM_LDFLAGS) -o $$@
 	$(Q)ln -sf $(if $2,..,.)/tools/build/bpftool/$(USE_BOOTSTRAP)bpftool \
 		   $(OUTPUT)/$(if $2,$2/)bpftool
 

-- 
2.54.0

