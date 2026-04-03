Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B563CBE89
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228378; cv=none; b=UBapmVtWT6AFza8ctzwiwsSN5gHsobwyO26YK0nCDBUOcRrCS9t8SRSLSG7R5wRaNu9hUmSgrg2NAdaephBfFtGWWwh8Ff18q/goxgbXtLaZLJ/pMgaDJL6CFUE1HVrh+pF3LyGWxmhvOAJWqrwINUnJ+qZ03UYv32bdRqyjgyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228378; c=relaxed/simple;
	bh=CWrUl3nngNLLkNWUjGrRyYauYMa3BfaOEPnf4E9SCrw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G1z2PkeIfCWixKD2WWTL15moiwqaEQFwdJQTozfTeM5C6B7Frscm89YL+R099y7ggRyCAT2FjNXLtrHnbhrqrJEmRl4H8W65BEDlGa/uRgVZR8UB4LxnLetJeyXCkK7QBkvJJMWJ47te/cqGFKsD7ZeDQY3IS+9gVNlAjHvkYGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SJAThX6S; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SJAThX6S"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486ff3a0fc1so18192495e9.2
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775228375; x=1775833175; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCZbMI7HRv+cCcgpbRQIHtBN+KMA+UT3Ct0Z9N6Znxg=;
        b=SJAThX6SdjYiAeeqASaHCtMyaWAYS5yIkj1GWerPviTbFikHEOysbKAyKPSrbuznK8
         BJpT44IJThf59FJccT5QaSCf4DuIZBXxsR7iOkCGdtyJJ89IASrnujci4H3iGCDRKpfT
         1IlyzF3nLyWpuWJP0IbI681h3oM/1cTTDmZRaE1z5OqVu1YcAMx/tBSBJ4GbjP6nK3RF
         /TkCwStgYqY09UJ316NWYzSe3B61yw76CPNbSj769v5MVsEQxt85lFCQ77mnyg44O3wp
         ojvbFnUa3W32Hysj7IR5cZ21m43HilxoRHpWFtooh4BxSBSiY8zS2eftPjyYewoaCQ3p
         6ioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228375; x=1775833175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WCZbMI7HRv+cCcgpbRQIHtBN+KMA+UT3Ct0Z9N6Znxg=;
        b=pBpknDtvckxWLoUJWzWqUB2y3WhmzR9qlfNTgLuXE3kmc68rHuiaBDgr1b0Ml2JuEO
         GyTr5EW5G5zcTWKGYAJHW22tEc5GeYGWACK+H18fQKY+x/4aRFgAKME4vbfheDvZvYyb
         vDDTVgR53a4WbqstIHeUMDlV5V5qkVIKRL3O27qI9ezGvggsjthNcCzgDmWXQGeOCNq2
         ZnM8WPxYC0aIrWInAc+x+nBL7CbSrdI8IYxELdO1N3EoKeiUtI8ZAI9btwDCzBPBylsU
         tpEFGpS0RKg2oezIz+P4DZmLzXxuhocQsPxfLvJ3aUhEkJvouGXuzHhcXzRdUXe5jXIR
         I/Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUzTidSNtbFHcsQnCk5T/n/OMyWsIa2mMP5exX6bdn/p61nhDAqxbqHpi+hrWTToEYyowFU@lists.linux.dev
X-Gm-Message-State: AOJu0YzpLUyt983yFqpCrsjSwLywUBb5hvmO5qr2GpC3gFsAGKlEyZNN
	qpRZrpvpzQJCLxikpK4ktZtJYyerg26Q5QK6GS+DuSPpmfrd8sgysJ1JLiAs4bd2jTg=
X-Gm-Gg: ATEYQzwxUzej1p5cxGjfyHi47xOiJsJXm2Tg8XaEwYXXK+L8W17nsK7ImqcnuWW5L/2
	9byiGKpRWERlCJ9m6Yhn8cKVc2w7C0DmqV/h1bFbqSNhJr9rVSnK+lXg+8Fq0wMWcDfV9/ewlTg
	CDkm1yLCBH0GpNVJJuygrpdv1HYW6rKk2bP+lFORcoywW3Be4OqxGoW76SvSSG/7BtdivfV6IJ2
	A8sr6ekhMn57kp1mDYA/H8M6K4Vbd+FHP6XTz73WjvGvNdAaHZLIUbox4DFD10+FURV6j40NwUn
	lrxLwmawQ7ha4dYP3T+5aXjeid4DpZkBqey/RWmUuTh8goq8bgTV9czFB7/B9q8Pv0VuSWAT8+I
	EDLe0yrBrZTXdQZ1eNaFAfOe3kFS7++iTsPt4HP9uPkpSr+D4BwqzgSZ+9YP0x56NpolFkkQ8yd
	o6A3R23v9x
X-Received: by 2002:a05:600c:a117:b0:485:3ff1:d5c5 with SMTP id 5b1f17b1804b1-488996ecd84mr36638675e9.7.1775228375430;
        Fri, 03 Apr 2026 07:59:35 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bae1117sm7077289e0c.7.2026.04.03.07.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:59:34 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 03 Apr 2026 11:59:01 -0300
Subject: [PATCH v2 08/10] selftests/bpf: Provide weak definitions for
 cross-test functions
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-selftests-bpf_misconfig-v2-8-f06700380a9d@suse.com>
References: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
In-Reply-To: <20260403-selftests-bpf_misconfig-v2-0-f06700380a9d@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1775228344; l=2984;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=CWrUl3nngNLLkNWUjGrRyYauYMa3BfaOEPnf4E9SCrw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFKqWxNUQWIxjTYwXeOcrrf5lpFtWyHGdFp5HF1OQSM6+NpS9VOMq88Mg+K2mWsWEjq24pC3OGP
 MnTrRG99BHgg=
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

Signed-off-by: Ricardo B. Marliere <rbm@suse.com>
---
 tools/testing/selftests/bpf/prog_tests/bpf_cookie.c | 20 +++++++++++++++-----
 tools/testing/selftests/bpf/prog_tests/iters.c      | 10 +++++++++-
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
index 35adc3f6d443..1619490f1e5c 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
@@ -252,10 +252,13 @@ static void kprobe_multi_attach_api_subtest(void)
 	kprobe_multi__destroy(skel);
 }
 
-/* defined in prog_tests/uprobe_multi_test.c */
-void uprobe_multi_func_1(void);
-void uprobe_multi_func_2(void);
-void uprobe_multi_func_3(void);
+/*
+ * Weak stubs; the noinline definitions in uprobe_multi_test.c take
+ * precedence when that translation unit is compiled and linked.
+ */
+noinline __weak void uprobe_multi_func_1(void) {}
+noinline __weak void uprobe_multi_func_2(void) {}
+noinline __weak void uprobe_multi_func_3(void) {}
 
 static void uprobe_multi_test_run(struct uprobe_multi *skel)
 {
@@ -574,7 +577,14 @@ static void tracing_subtest(struct test_bpf_cookie *skel)
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

