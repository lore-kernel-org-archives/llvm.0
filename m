Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD9A3EC2CD
	for <llvm@lists.linux.dev>; Tue,  2 Jun 2026 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405435; cv=none; b=pX6VVf0iyzZJqCwQ1tsuKCn8d6UyFX9RC6UXzQuaoKYNnNRBA2mWkXz+RUOJghXCVql+s4oxrwdvYYFoP5L8DiAR1Jg+sLoB8kcjKORzYEMFyiN1KTuNdeQMP9TK1zL/EThfghr0QitJKdfjAQgykhlccjBygnr4EwqQpFvLjcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405435; c=relaxed/simple;
	bh=PEQ/hH8f9EfEO3m9jfnl1sYEE2Fvx6y97vzN398bHFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b28jmaj2cXzcn6gTeBIpXh+DLEZ6/pdwsasl42tMXesh8XJGG+4wabKeHDVRtjgjaZREjvKSN/5b/7Thx+fSYwqLiwkMdkiinYrv2MpNJdpjwUNPrulcqMr2fG3KzjWbMsXpEx1966junR/0bTBL7BJfBncIS+nS9AyrfTZT1eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OTV5S8u2; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OTV5S8u2"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bec3f69d343so342751066b.0
        for <llvm@lists.linux.dev>; Tue, 02 Jun 2026 06:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780405432; x=1781010232; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=da/3P3gWrWPT2pVZ+wpt21mcmTeD9JLfhBM9QpqBcIo=;
        b=OTV5S8u2MF6+v1eWQ5/74HcSykEjRop6a8/u9qJvczZ8oc1bnPmwthMS3DXmeFpuxj
         k3PslSBLpIjtBA2H4bBD+qPcLlgtqowz/98h2dma+AvWH5Xf5DX/GQeyv1/FQhXnVsNC
         1+JHFW7VZ8y0ejAnE03mkAMOJi3bYEpr5FW+XCMQu0QsrEpWjXVccUrsJURL/IUSWTIP
         NrBGX24CcO/bzuUGryJBCGLps+T9WjWqn50KV+8XEOUPD/IHjEI0JvUOg+rw4Lf+QYOx
         jYeM/HGI5+pzZH9ou7hDxB7Uze/GQFRDOWdfoivvytgTGdHSCVXcm+D2+Y9DKnyvt2yY
         fJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405432; x=1781010232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=da/3P3gWrWPT2pVZ+wpt21mcmTeD9JLfhBM9QpqBcIo=;
        b=LNFLPTJN7cGUPXUABKtbtmRJ3epbHttrnZ1EwVVNoWz5lTzNeGe5RYZ2zLr9ePHBsf
         kv1XXrvmVqtMReodCtJU9L3BNGcIBFkVxfi9xFGkiPWY9T3XbB+9rZgbL/e+ON0rXpHe
         ft7u8ZTCFJ9YxUEPtV98ZcIV9C+JYkFJxuEilVTEWnM8EiS3xPCCVQcDvF6k0Mgn5P31
         Nloq9ZL/aCUutRRW2KjYk4ne/GQeDT0waHAxcNFDLDwaz2nx3G4ygh3oOuZxYXUtDoKZ
         aZwKEhK6gTHjVAjXiSFKera2eufan7QJFDg1XPyuhJS2TxpEKGbAQhtB5BPoQEKXOQnY
         k2yg==
X-Forwarded-Encrypted: i=1; AFNElJ9hl/Ftg5RBR2GUx/TqhR2sYzM//LUYDIYdU0RsuE7MsRU5H2/d48i0lcYcZtYQvqY+FEfj@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf28t+sPWoKQFHZaH+Znx7pnNdkDG9GtKp7rlm9nM9V0UvdSgl
	0iR/TgFPIKW4ioP6VWesZd85JwtrCYqa/CKwsTHFaqkJBp2LgQRq/Z30iPEac3neoOQ=
X-Gm-Gg: Acq92OF011Ob8YKKDc8v9OPjjhzG3BRAaaC3mKNthMSlXkqgj1w/MQB2U90+xoLut76
	s14Rk0tqqEm/NEKlaf849khG9tdJiQ3iqZr5z+5zGwsj3sn4qFBuxg5F1hiB20wwPFdKdk/IXhe
	/TmdaT8/wopJNqp+hSL/2AZ98PAaBo7pThlslvhLkGKiQyUk6s7tgZcsIzvuFTk4c7BNWhr++mh
	c6zH8k3WCT7anNGwp1e4jPWUh8qWPt1VsPzn4xZFUpcfJqdOUuK7e/mxVB6mVy+pKvI6jUORibm
	w0Vv44Gf5DAP+b1W1N/KXNoKREyFARyaJDqBUO8c8VEGhl8t5ecKEkCpF77BlcuHNzYU/liqD7y
	DMvTemQkEipZqT2g6WZhUEBuw43S3ODCcU44bjukk10UPldSDgVDyo/PRtBE32qgvTd4EwMIAnL
	Lcw43WfDmQnytbNPWjVPysqw==
X-Received: by 2002:a17:907:c5c5:b0:bed:5774:7c17 with SMTP id a640c23a62f3a-bed577482b9mr538543966b.5.1780405432457;
        Tue, 02 Jun 2026 06:03:52 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:e15:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-beed0fc69b3sm146958666b.39.2026.06.02.06.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 06:03:52 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Tue, 02 Jun 2026 10:02:59 -0300
Subject: [PATCH bpf-next RESEND v12 10/11] selftests/bpf: Provide weak
 definitions for cross-test functions
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260602-selftests-bpf_misconfig-v12-10-27f898b3ba26@suse.com>
References: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
In-Reply-To: <20260602-selftests-bpf_misconfig-v12-0-27f898b3ba26@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1780405395; l=5710;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=PEQ/hH8f9EfEO3m9jfnl1sYEE2Fvx6y97vzN398bHFI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBTVRNTxzUi2XqPufZT6zDHYVbUJnRE3O4cjr+vAN+hD8V/ct6HjyUPc1u/rn/AEEo5GqZ65Kw3
 praTwzC1ksQA=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Some test files reference functions defined in other translation units that
may not be compiled when skeletons are missing. Replace forward
declarations of uprobe_multi_func_{1,2,3}() with weak no-op stubs so the
linker resolves them regardless of which objects are present.

The stub bodies are `asm volatile ("")` rather than empty, matching the
shape of the strong definitions in prog_tests/uprobe_multi_test.c. This
keeps the weak and strong sides on the same footing for the optimiser
(noinline + asm-barrier), which is the form upstream already relies on
for these functions.

Move stack_mprotect() from test_lsm.c into testing_helpers.c so it is
always available. The previous weak-stub approach returned 0, which would
cause callers expecting -1/EPERM to fail their assertions
deterministically. Having the real implementation in a shared utility
avoids this problem entirely.

Include <alloca.h> for alloca() so the build does not rely on glibc's
implicit declaration via <stdlib.h>.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 .../testing/selftests/bpf/prog_tests/bpf_cookie.c  | 17 +++++++++++------
 tools/testing/selftests/bpf/prog_tests/iters.c     |  2 --
 tools/testing/selftests/bpf/prog_tests/test_lsm.c  | 22 ----------------------
 tools/testing/selftests/bpf/testing_helpers.c      | 18 ++++++++++++++++++
 tools/testing/selftests/bpf/testing_helpers.h      |  1 +
 5 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
index 35adc3f6d443..fa484d00a7a5 100644
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
+noinline __weak void uprobe_multi_func_1(void) { asm volatile (""); }
+noinline __weak void uprobe_multi_func_2(void) { asm volatile (""); }
+noinline __weak void uprobe_multi_func_3(void) { asm volatile (""); }
 
 static void uprobe_multi_test_run(struct uprobe_multi *skel)
 {
@@ -574,8 +581,6 @@ static void tracing_subtest(struct test_bpf_cookie *skel)
 		close(fmod_ret_fd);
 }
 
-int stack_mprotect(void);
-
 static void lsm_subtest(struct test_bpf_cookie *skel)
 {
 	__u64 cookie;
diff --git a/tools/testing/selftests/bpf/prog_tests/iters.c b/tools/testing/selftests/bpf/prog_tests/iters.c
index a539980a2fbe..c0b6082f345a 100644
--- a/tools/testing/selftests/bpf/prog_tests/iters.c
+++ b/tools/testing/selftests/bpf/prog_tests/iters.c
@@ -202,8 +202,6 @@ static void subtest_task_iters(void)
 	iters_task__destroy(skel);
 }
 
-extern int stack_mprotect(void);
-
 static void subtest_css_task_iters(void)
 {
 	struct iters_css_task *skel = NULL;
diff --git a/tools/testing/selftests/bpf/prog_tests/test_lsm.c b/tools/testing/selftests/bpf/prog_tests/test_lsm.c
index bdc4fc06bc5a..d7495efd4a56 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_lsm.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_lsm.c
@@ -5,36 +5,14 @@
  */
 
 #include <test_progs.h>
-#include <sys/mman.h>
 #include <sys/wait.h>
 #include <unistd.h>
-#include <malloc.h>
-#include <stdlib.h>
 
 #include "lsm.skel.h"
 #include "lsm_tailcall.skel.h"
 
 char *CMD_ARGS[] = {"true", NULL};
 
-#define GET_PAGE_ADDR(ADDR, PAGE_SIZE)					\
-	(char *)(((unsigned long) (ADDR + PAGE_SIZE)) & ~(PAGE_SIZE-1))
-
-int stack_mprotect(void)
-{
-	void *buf;
-	long sz;
-	int ret;
-
-	sz = sysconf(_SC_PAGESIZE);
-	if (sz < 0)
-		return sz;
-
-	buf = alloca(sz * 3);
-	ret = mprotect(GET_PAGE_ADDR(buf, sz), sz,
-		       PROT_READ | PROT_WRITE | PROT_EXEC);
-	return ret;
-}
-
 int exec_cmd(int *monitored_pid)
 {
 	int child_pid, child_status;
diff --git a/tools/testing/selftests/bpf/testing_helpers.c b/tools/testing/selftests/bpf/testing_helpers.c
index 6fbe1e995660..c970e7793dfc 100644
--- a/tools/testing/selftests/bpf/testing_helpers.c
+++ b/tools/testing/selftests/bpf/testing_helpers.c
@@ -5,6 +5,8 @@
 #include <stdlib.h>
 #include <string.h>
 #include <errno.h>
+#include <sys/mman.h>
+#include <alloca.h>
 #include <bpf/bpf.h>
 #include <bpf/libbpf.h>
 #include "disasm.h"
@@ -516,3 +518,19 @@ bool is_jit_enabled(void)
 
 	return enabled;
 }
+
+int stack_mprotect(void)
+{
+	void *buf;
+	long sz;
+	int ret;
+
+	sz = sysconf(_SC_PAGESIZE);
+	if (sz < 0)
+		return sz;
+
+	buf = alloca(sz * 3);
+	ret = mprotect((void *)(((unsigned long)(buf + sz)) & ~(sz - 1)), sz,
+		       PROT_READ | PROT_WRITE | PROT_EXEC);
+	return ret;
+}
diff --git a/tools/testing/selftests/bpf/testing_helpers.h b/tools/testing/selftests/bpf/testing_helpers.h
index 2ca2356a0b58..2edc6fb7fc52 100644
--- a/tools/testing/selftests/bpf/testing_helpers.h
+++ b/tools/testing/selftests/bpf/testing_helpers.h
@@ -59,5 +59,6 @@ struct bpf_insn;
 int get_xlated_program(int fd_prog, struct bpf_insn **buf, __u32 *cnt);
 int testing_prog_flags(void);
 bool is_jit_enabled(void);
+int stack_mprotect(void);
 
 #endif /* __TESTING_HELPERS_H */

-- 
2.54.0

