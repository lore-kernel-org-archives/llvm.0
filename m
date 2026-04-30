Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335F041B366
	for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 12:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553641; cv=none; b=KDjmhktkh30H4xnbE9SgFNaIxuv1+5rgnuAkZbK7X3G1HIqqgoCtAKp+4/j4bwTQzWk0UaQJOc9otAUa/bDyXwMOyXKvEeYx79dT+Ukyzkrb8TqbSEJSbLiuY1drwkRb3E+e7pwUQ1E3X4sRZ3dkmj7czePTgy6pYcrYzyzafC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553641; c=relaxed/simple;
	bh=Onl8r1+vgaXXxPalMwqiUm7LQPBj7ebNHH33wZEkeI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n8eMRq69fIJHX5SGSSKGofMKXmv1H2KlShg53Db3hHZlMDGgN2e/a7m0ih1lvBDPWjtU+/VxJ+nlr4jVMNAWFqwLzYIspXxGZYbwEpGoSxD5/mSpWMeXp6XexTOQBCmz2bj5xCgEAo0YTRwQnYdv1zbjevABG1Y930sWzIQMrWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XATxbc4f; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XATxbc4f"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so12700645e9.0
        for <llvm@lists.linux.dev>; Thu, 30 Apr 2026 05:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777553636; x=1778158436; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4QYgraTyRNTEBA/rrl3/N38ijho0hL7xEX+M/3l600=;
        b=XATxbc4fZNAlASgNFFlSGrVQfSDrljKpqopXjLwGvRFohFuSDWreGLlAtRfpQbuUqV
         6xnhgbm1qNh4PY7oo50qpzR3lmvcm49v0FTzPFgi2XIzFTVTmi1Jf5zTJIngN4Spp1xL
         PLCMnO26UAzAD7YoTOFhck5S1fTjqPnxsDGhmWFxQx46oIcYJcEHOvup7XNxSURY8w5C
         DsARLt3l7eE31t+yLt7K6XdvPSq4PbSsuMCfXGLPM3F3I17Aylopu94ufNmzFvaQ9Rgw
         IghJsK99s8keCT0Y/pySIKLPwN19PwoJ9IrQYi/YiKbJ9Efe/+eOYsvTjteyXTIzfO09
         4lqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553636; x=1778158436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a4QYgraTyRNTEBA/rrl3/N38ijho0hL7xEX+M/3l600=;
        b=eTPtk3YHJ7GsooQUXIUYuSTy0TDVZ1/qDBraGrFXic97BagQ45EmciAvHi4Fhqo9TJ
         qq3wsMugOlLHie550AK5roRwHCStZ0CRVdBCfa0h1fqsXjpmdny3Sh8zLnEQN6ZTIyRA
         06EQv+F9Jt0ECgaE2Lk86JuY+VQr4LugPKQWwkeSBTiCWRC6RrWWqHXn0y2o0vPk3i7u
         FEikVTyzeqRlUgStokAxU93QfWfARVqHFUN7WrTshoPdUHY1veISOxpCFCZhVYNqNbIj
         atyN47fZ4CqHSx6L+uIHrWnW8xjvFa7haFobTg+j7bkpRiY8tGwsVZSuKFDq6GR+WWTK
         hGvw==
X-Forwarded-Encrypted: i=1; AFNElJ8VDPdKEOqkzHMLSxCQlexUNvJSiHIKMtBDvZoXx6EcuAvAOjz2eSMqtfxB2ujP5isTWMFo@lists.linux.dev
X-Gm-Message-State: AOJu0YznNAxS2KRZquI7Q2wydbdpaE60MVxlKcHPsw0Uyo2m+KYAp3E6
	E+85gh2KeGhTpDhf2yMZDc+yLjrPZ20hvUiDBawWz/ljzPI+zR4KuwD/XrZTixQtoL8=
X-Gm-Gg: AeBDietI+qmeE97CoWihH1WGzU1aNIckIRH9SuTIOab1XouNnbYNLJ8zkXwD9y3M+x1
	qoIGz+yKwYlNEQAVFv2V49zFXab+3v4gSaXkb/iXSNvnvkpl8+p4wFQLqBdHgUl3HW6hl8RA4a9
	ck1XpV3Yuxo/eHJ1FlhBjeC1pSo55in1AYc4nGT90eTUyU/Mhx8C2MyJGtg0LwoFv/bnSGQ5axS
	7/eQk8B/74AEk7aXDxrpNZtIyc2raXu2hduLWNwVfmeK3gU7bc37EO91hvQH9/jtoDKGBTunfG9
	ILL51v4OQ7CZJVVF5v24XqMXp3cPCXYN+kMZQWTq9fDI/DlXnq5gRTLVrSFqSCtnYr/WWNDlPyh
	pN5swMwoWmH2Dr3POOjMThejW3CC93PI5MI51ABKCXQWTA1n+CppEQIfiDSfZnz3SXirjcLmGl5
	U/j1ZzxgAshIwEta1hYLf1UlYR
X-Received: by 2002:a05:600c:a409:b0:48a:53ea:13eb with SMTP id 5b1f17b1804b1-48a83d66d44mr37057325e9.5.1777553635781;
        Thu, 30 Apr 2026 05:53:55 -0700 (PDT)
Received: from localhost ([2804:7f0:b765:105d:ce28:aaff:fe86:149c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ede68916f5sm760117eec.4.2026.04.30.05.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 05:53:54 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Thu, 30 Apr 2026 09:53:22 -0300
Subject: [PATCH bpf-next v10 10/11] selftests/bpf: Provide weak definitions
 for cross-test functions
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-selftests-bpf_misconfig-v10-10-cd302a31af16@suse.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1777553600; l=5337;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=Onl8r1+vgaXXxPalMwqiUm7LQPBj7ebNHH33wZEkeI4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKnCkqkbl77eshiWVAfsR1blYaWvaIgzs5JzMU9qwgHgCJfvN/B5fjkPeGnzZeqbvZFGS7pTMO6
 /8NH/Z1/TvAA=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

Some test files reference functions defined in other translation units that
may not be compiled when skeletons are missing. Replace forward
declarations of uprobe_multi_func_{1,2,3}() with weak no-op stubs so the
linker resolves them regardless of which objects are present.

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
index 35adc3f6d443..5a864cd8ad1b 100644
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

