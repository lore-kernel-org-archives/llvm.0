Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E58388E42
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 16:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775491927; cv=none; b=S36Ldgvk8ihMocy8FjJD/P/JJAGjeQMmfWeOkehl6e+0KogTk0JNu+4V/3PhvTlhrKeVaEAhZvKcOcFMvAbCZw0zj8UrKIj7yUrmeYThmNsW3C0U8SPMvPVuMJw5XTIrNs4yIbaaayScwdARqQh1PiMCU0ifGCBoR2MjAns/L7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775491927; c=relaxed/simple;
	bh=oi9iikLLALiEnY24VFCpWcYTkvvNa+ktRrLGnTBV65k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVKD5xDIe+Xg/r0J7PG+BeHkUyhOPpilIDhE2O0oIi6JEpRArhNRVU5sobq82+PtwXOOZot9WN72WTizlk56Nf7O2G9HiDgWPOgoiSneduNEwI0sFWpcvHSeWqV2WPk3LoIMwFp8NlSrEsSV02dzhqCoX9UmfBNr/PCgsZJj2Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Kkv6dVS/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Kkv6dVS/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ba6366a7so2126745e9.0
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 09:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775491922; x=1776096722; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnBUcaHO1k2gTBLDn9MaOizJd/ELdZ7iIsdz0Nzo7xE=;
        b=Kkv6dVS/o4fgXigx8Q3SAj3cR/MhU125J6fETf+73h3j0wL05Y9rS+saAY61KgMKO7
         3rHgsw053YZo7n5QYmN5aToxFB8gno+XPNHzBYgZxVDEBiwiWkz0SeYMuLvlKkkz+F5u
         Aqhq29VfrwMJU26uXqcpQy6luTzrg8cJvdaKiIovfsKVjjc0gPwOEjvdxSUqBFus9mrY
         6Doiiw9z0Nn5G9KL3xkolFLPCrx8hA7HQl3BxaSiJuAPHxpSmoexEwmoUWpGo17/Z+/v
         wBpTl79Zp25B0DCTwKXZz8ZuPwaBkwToxARJWr9QD/UDTS4RD/LveOiV6QYGjjCKjTAB
         5lLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775491922; x=1776096722;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hnBUcaHO1k2gTBLDn9MaOizJd/ELdZ7iIsdz0Nzo7xE=;
        b=dLjcZeaihIG2RfpgWv+18iuttT++z1WSZIvn8hjxEudhKoK1r3pb4cs8ZjkXLxus/f
         O3vDtsQmnkSLFlKXIOTIq3xsUW84dxCrgcxdjXaZbYmBSOTLPxQZuFsp4DKl8XcsKQyJ
         2PuOlYrGVIsan2zFqvswbe8HLz36dgfRn+O2QBWzHjXtEuRhyTarYdrRMFil17psHGG9
         GnawlcVpGZS483hSqBmD8KugjyxYI4OReQ0XuJXtA5ALGJzgYfxzAIX+vb+OK7hpz7lm
         05kPqYHwpj3H+Whne3ktAbhppl2RwjYtyvlpMBChRYB+Wl/F6JuSQWKV7Uq/ET/XBGZ3
         +uaw==
X-Forwarded-Encrypted: i=1; AJvYcCXZFfaY4tnOh9qJ+9kHMHfUTsY2cKFpOWN0G2RR1bR+JaOExRQfXgyIYatHrBDMCmyA5Plh@lists.linux.dev
X-Gm-Message-State: AOJu0YwZSNN7kQzy/zJSV02vGjHlJDuOpzPxqj2qOXb33lK/y5mgZ6pl
	CrYwGgggBVFMi35WSn+iosInG3XjUhRfwL43tfB5+n5vOt93e+vz0Ch5N10eu4C+SHE=
X-Gm-Gg: AeBDietXa/jfIXQWX+MJj7M/u6HbqCixM14+2o7iicztLz736SxHkq0HS3J/D3itCqy
	XGJ7qN0HeNNV8vT0yiW8An3pYBNrtmknYqnkqQsuQFtWocHLTOENveAAfapaUZu1nQWBKTddUV2
	xoPY6/jV7MiwgZPHxOx5bTpLCpmvuSHW0u93b+9e1z2zPMa5AVra5G4JnLhnPm7n2LmA7npnCee
	BZRgwbsQjdKGE2FJzDrJINAczeSgQnfzkh5vaTsA7btMRk5hQkyTPUAoELI2c8mc2mbCSUJg/t6
	RjdIwBKaXk8mqQhbJRRb5QyDChi8SNQSdYRoJWJYLWSZCFB0ncVK5AY3h8Ao79kPBdWoWxZptbe
	+cGBKVt4SmD02TShhVTpZz9l7EPkh7NM5YZXkvLWIsHdCS4/xOqN/4rmVb7/j6GeiqWddqnN3V4
	otmbvDUfCQyNLf
X-Received: by 2002:a05:600c:a009:b0:488:ab26:8fe0 with SMTP id 5b1f17b1804b1-488ab26986cmr87380265e9.15.1775491921954;
        Mon, 06 Apr 2026 09:12:01 -0700 (PDT)
Received: from localhost ([2804:7f0:b767:120d:a4df:3777:2c55:2b95])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bc9b75dsm16666413e0c.12.2026.04.06.09.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 09:12:01 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Mon, 06 Apr 2026 13:11:31 -0300
Subject: [PATCH v3 09/11] selftests/bpf: Provide weak definitions for
 cross-test functions
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-selftests-bpf_misconfig-v3-9-587a1114263c@suse.com>
References: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
In-Reply-To: <20260406-selftests-bpf_misconfig-v3-0-587a1114263c@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775491886; l=3476;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=oi9iikLLALiEnY24VFCpWcYTkvvNa+ktRrLGnTBV65k=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMRTO33ERhhKfJ3eGSF1yW6vRg+Wttw4K4j+X0ZxQTzTC1K0lH5zSBwBokSdV6FtplgSEFDUijf
 DN7iSGsqSWQ0=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Some test files reference functions defined in other test translation
units. When those units are not compiled (e.g. because a BPF skeleton
could not be generated), the link step fails with undefined references.

Replace forward declarations with weak stub definitions for:

 - uprobe_multi_func_{1,2,3}() in bpf_cookie.c (defined in
   uprobe_multi_test.c)
 - stack_mprotect() in bpf_cookie.c and iters.c (defined in test_lsm.c)

The linker will prefer the strong definitions from the original objects
when they are present, and fall back to the stubs otherwise.

The uprobe stubs are marked noinline because uprobe_multi_test_run()
takes their addresses directly to configure the BPF program's uprobe
attachment points. An inlined function has no stable address in the
binary, which would cause the attachment to probe the wrong location.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 .../testing/selftests/bpf/prog_tests/bpf_cookie.c  | 24 +++++++++++++++++-----
 tools/testing/selftests/bpf/prog_tests/iters.c     | 10 ++++++++-
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
index 35adc3f6d443..5fc6b2cd0bb9 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
@@ -252,10 +252,17 @@ static void kprobe_multi_attach_api_subtest(void)
 	kprobe_multi__destroy(skel);
 }
 
-/* defined in prog_tests/uprobe_multi_test.c */
-void uprobe_multi_func_1(void);
-void uprobe_multi_func_2(void);
-void uprobe_multi_func_3(void);
+/*
+ * Weak uprobe target stubs. noinline is required because
+ * uprobe_multi_test_run() takes their addresses to configure the BPF
+ * program's attachment points; an inlined function has no stable
+ * address in the binary to probe. The strong definitions in
+ * uprobe_multi_test.c take precedence when that translation unit is
+ * linked.
+ */
+noinline __weak void uprobe_multi_func_1(void) {}
+noinline __weak void uprobe_multi_func_2(void) {}
+noinline __weak void uprobe_multi_func_3(void) {}
 
 static void uprobe_multi_test_run(struct uprobe_multi *skel)
 {
@@ -574,7 +581,14 @@ static void tracing_subtest(struct test_bpf_cookie *skel)
 		close(fmod_ret_fd);
 }
 
-int stack_mprotect(void);
+/*
+ * Weak stub for stack_mprotect(); the real definition lives in
+ * test_lsm.c and takes precedence when that object is linked in.
+ */
+__weak int stack_mprotect(void)
+{
+	return 0;
+}
 
 static void lsm_subtest(struct test_bpf_cookie *skel)
 {
diff --git a/tools/testing/selftests/bpf/prog_tests/iters.c b/tools/testing/selftests/bpf/prog_tests/iters.c
index a539980a2fbe..6888bc9173fd 100644
--- a/tools/testing/selftests/bpf/prog_tests/iters.c
+++ b/tools/testing/selftests/bpf/prog_tests/iters.c
@@ -7,6 +7,7 @@
 #include <unistd.h>
 #include <malloc.h>
 #include <stdlib.h>
+#include <linux/compiler.h>
 #include <test_progs.h>
 #include "cgroup_helpers.h"
 
@@ -202,7 +203,14 @@ static void subtest_task_iters(void)
 	iters_task__destroy(skel);
 }
 
-extern int stack_mprotect(void);
+/*
+ * Weak stub for stack_mprotect(); the real definition lives in
+ * test_lsm.c and takes precedence when that object is linked in.
+ */
+__weak int stack_mprotect(void)
+{
+	return 0;
+}
 
 static void subtest_css_task_iters(void)
 {

-- 
2.53.0

