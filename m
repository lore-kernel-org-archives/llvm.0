Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714669;
	b=zHqFeN7yulhRl9MIxCrUHu7lGOgi7ucIpawK69Omff7hgvKpsEvIxjZx5jMkjVkVJBIU
	 Gievheis35kybFs3w2UM7iCNyR2vQECrhxBh2zKDMSRbcSuyN2OlZU4c7uBvrU3eXubFm
	 5JUNgF+WUrqtix7Qdb+HWpGcy8j1WO6Csf5/iTgERJxk6kxenYFjXk86/MAXTcpot0oiM
	 UtBnlfn2aKhCed4sm2ax94lq9ydmztlQ0eLJnAySyAE29bUKf1D9GYRfqpYNoSY933TKs
	 lCkzeFvxJbNjpIbr5nL95NlSvxkytn3YVDG33ZR6kn+TPAEcUCBU4SVllmPgBeLb46Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7EFy5TBdHMksgH+69ZcrASpy/wdwGEGDCoyxJAdEsHI=;
	b=41e+xMFt8peDDwCZvGAKTe2YXBjOQKuRPn6IUyZOTP1iSkpvKFPoyjly6AZJF3kOUt32
	 PLAJ60cf1SeR68EOi9H0xfLFjLOg9iM6zR/yTbe1vNF3aXqdTYBYCn4LLfFa4kZhY8e4B
	 KrwtWKFH7tzka8RHIKYUaIf5fVYiFOnNWf1A8A7xCeXh2F5ZW9Xu83ZCGC5CUvWmAKRDt
	 IGJf6X43X024gRviJtbNZKZvVJr4n1Z57V4hUPmoDFgx0PlAPspaJIVWJjzgVxOaiQsQf
	 Y4gJUEp3UpOEdfRb4ZSfkb/R9pGcOZDgeZbGwHLP+M1/SWPW6cHmvmECTQ4fsQwKN4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OAODv42M;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E26C606A328
	for <llvm@lists.linux.dev>; Fri, 23 Oct 2026 00:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E26C606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OAODv42M
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3580c07911eso1021095eec.0
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 17:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714668; x=1793319468; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7EFy5TBdHMksgH+69ZcrASpy/wdwGEGDCoyxJAdEsHI=;
        b=OAODv42M8mBfjUU1ZsiGamTQyNvVE1qY2yueoB3kfK2vmSFkvI0rZrv2UTM0QTgTkV
         YRys+lDuhvZW59OkwMYqWIwN6xB0mEOwvdo515jI8oIRCJCwTnKYNaCJ57XE+MillILo
         yX8EViwHGXNOXDuEKgzcDCMq1XD3aC+x5bUeMIJbYfD5hP9hPlRbWgb9Sn4fzcaz+CrX
         WBDuKoVMV5I7nMSoRyZM2F9utLDyJUPZ3AoH6AaWvid49Jxk5qIhBKZvLIab8ImRmCOK
         YlTpERK45zTpD/lbX+QO04MiYRVU2NsM83uZWHBFzuPvmAGEkBAzi1PtXNsCqpCRxzFE
         oG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714668; x=1793319468;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7EFy5TBdHMksgH+69ZcrASpy/wdwGEGDCoyxJAdEsHI=;
        b=ifA/oWhRTSbYFlXCwWhOvqsXIYpy4A+B+ATFmiz+h+VE3jUTyL4ikTuHeInKP5rJWo
         oPuuScrmydLnt7VXWqUpYgvwVn6sxpq4Roq3GzCmPN8FrqjYp6nsv2xxl6P3oKbsVQb1
         NxyncuvTvSr829cgiSie8jaRMQcTFduQCLdfA9wZzDAk14lAwsRF3S7yU2bmRMgh+P8w
         Ef9UxSyM+RTRAY3GVk2+1AJj7v0gqnLS+lOHCuFXtMREMSoujeVI8xwGYiBXfzZH3tSf
         8eRZogcyMhiAIhOUXbGwnKNhaDP/KhV08spO8SCNcfQnBwEpKwFnEQ8a4kGsScg550MF
         J1nw==
X-Forwarded-Encrypted: i=1; AKwUvBz1/qktYgS2bFuqgj15tj81TksucdKccGXeXnM4KHQneWjxwmJT4Bcyyin8HVX2/S5xW1ou@lists.linux.dev
X-Gm-Message-State: AFq9FYIaRXIXqR36iwTwab4O5uQZ/aI5DnCZjnTUKdcQJBRUy2p+rHu/
	BnoQxw3G4x3ytf5Hd3ZcYTBXYncNQtHPTL+teTlesdAiTi9+H/StQUqz34VVplx4uDOcOcYCrcv
	JBYTgi8lNEoh4og==
X-Received: from dydr21.prod.google.com ([2002:a05:7300:50f5:b0:369:45ee:40a0])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:881c:20b0:366:c497:610c with SMTP id 5a478bee46e88-369d9833dfdmr918007eec.33.1792714667128;
 Thu, 22 Oct 2026 17:17:47 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:16:07 -0700
In-Reply-To: <20261023001603.560210-8-wusamuel@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023001603.560210-14-wusamuel@google.com>
Subject: [PATCH bpf-next v2 6/6] selftests/proc: Add KALLSYMS_QUERY tests
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add a selftest for the KALLSYMS_QUERY ioctl() on /proc/kallsyms.

For symbol-to-address lookup (KALLSYMS_QUERY_BY_SYMBOL), cover valid
lookups, missing symbols (-ENOENT), input validation (-EINVAL, -EFAULT,
-ENAMETOOLONG, -E2BIG), and extensible struct size handling.

For address-to-symbol lookup (KALLSYMS_QUERY_BY_ADDR), cover lookups at
exact symbol start and interior offsets, buffer truncation
(-ENAMETOOLONG), unmapped addresses (-ENOENT), and input validation
(-EINVAL, -EFAULT).

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 tools/testing/selftests/proc/.gitignore       |   1 +
 tools/testing/selftests/proc/Makefile         |   1 +
 .../selftests/proc/proc-kallsyms-query.c      | 213 ++++++++++++++++++
 3 files changed, 215 insertions(+)
 create mode 100644 tools/testing/selftests/proc/proc-kallsyms-query.c

diff --git a/tools/testing/selftests/proc/.gitignore b/tools/testing/selftests/proc/.gitignore
index 9c9735570abf..1762c28f524c 100644
--- a/tools/testing/selftests/proc/.gitignore
+++ b/tools/testing/selftests/proc/.gitignore
@@ -4,6 +4,7 @@
 /fd-003-kthread
 /proc-2-is-kthread
 /proc-fsconfig-hidepid
+/proc-kallsyms-query
 /proc-loadavg-001
 /proc-maps-race
 /proc-multiple-procfs
diff --git a/tools/testing/selftests/proc/Makefile b/tools/testing/selftests/proc/Makefile
index a7de2bb6d8be..dc3c28e6b83b 100644
--- a/tools/testing/selftests/proc/Makefile
+++ b/tools/testing/selftests/proc/Makefile
@@ -29,6 +29,7 @@ TEST_GEN_PROGS += setns-sysvipc
 TEST_GEN_PROGS += thread-self
 TEST_GEN_PROGS += proc-multiple-procfs
 TEST_GEN_PROGS += proc-fsconfig-hidepid
+TEST_GEN_PROGS += proc-kallsyms-query
 TEST_GEN_PROGS += proc-pidns
 
 include ../lib.mk
diff --git a/tools/testing/selftests/proc/proc-kallsyms-query.c b/tools/testing/selftests/proc/proc-kallsyms-query.c
new file mode 100644
index 000000000000..229cde432d6a
--- /dev/null
+++ b/tools/testing/selftests/proc/proc-kallsyms-query.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Tests for KALLSYMS_QUERY ioctl() on /proc/kallsyms.
+ */
+#undef NDEBUG
+#include <assert.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <stdbool.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+#include <linux/fs.h>
+
+#include "kselftest.h"
+
+#define KSYM_NAME_LEN 512
+
+struct kallsyms_query_ext {
+	struct kallsyms_query v0;
+	__u64 extra;
+};
+
+static int do_query(int fd, void *q)
+{
+	return ioctl(fd, KALLSYMS_QUERY, q) < 0 ? -errno : 0;
+}
+
+static struct kallsyms_query sym_query(const char *name)
+{
+	return (struct kallsyms_query){
+		.size = sizeof(struct kallsyms_query),
+		.query_flags = KALLSYMS_QUERY_BY_SYMBOL,
+		.sym_name_addr = (__u64)(uintptr_t)name,
+	};
+}
+
+static int query_symbol(int fd, const char *name, struct kallsyms_query *q)
+{
+	*q = sym_query(name);
+	return do_query(fd, q);
+}
+
+static int query_addr(int fd, unsigned long long addr, char *buf,
+		      size_t buf_sz, struct kallsyms_query *q)
+{
+	*q = (struct kallsyms_query){
+		.size = sizeof(*q),
+		.query_flags = KALLSYMS_QUERY_BY_ADDR,
+		.sym_name_addr = (__u64)(uintptr_t)buf,
+		.sym_addr = addr,
+		.sym_name_size = buf_sz,
+	};
+	return do_query(fd, q);
+}
+
+static bool find_vmlinux_symbol(const char *target, unsigned long long *addr_out)
+{
+	char name[KSYM_NAME_LEN];
+	char line[1024];
+	char type;
+	char mod;
+	FILE *f;
+
+	f = fopen("/proc/kallsyms", "r");
+	if (!f)
+		return false;
+
+	while (fgets(line, sizeof(line), f)) {
+		if (sscanf(line, "%llx %c %511s %c", addr_out, &type, name, &mod) == 3 &&
+		    strcmp(name, target) == 0) {
+			fclose(f);
+			return true;
+		}
+	}
+	fclose(f);
+	return false;
+}
+
+int main(void)
+{
+	const char *sym_name = "vfs_read";
+	char resolved_name[KSYM_NAME_LEN];
+	char long_name[KSYM_NAME_LEN + 1];
+	size_t page_size = sysconf(_SC_PAGESIZE);
+	unsigned long long exp_addr;
+	struct kallsyms_query_ext q1;
+	struct kallsyms_query q;
+	char *page_buf;
+	int err;
+	int fd;
+
+	fd = open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
+	if (fd < 0) {
+		if (errno == ENOENT)
+			return KSFT_SKIP;
+		ksft_exit_fail_msg("open(/proc/kallsyms) failed: %s\n",
+				   strerror(errno));
+	}
+
+	if (!find_vmlinux_symbol(sym_name, &exp_addr)) {
+		close(fd);
+		return KSFT_SKIP;
+	}
+
+	/* CASE 1: Valid vmlinux symbol query (or -EPERM when addresses are hidden) */
+	err = query_symbol(fd, sym_name, &q);
+	if (err == -ENOTTY) {
+		close(fd);
+		return KSFT_SKIP;
+	}
+	if (!exp_addr) {
+		assert(err == -EPERM);
+		close(fd);
+		ksft_exit_skip("kallsyms addresses are hidden, only -EPERM checked\n");
+	}
+	assert(err == 0);
+	assert(q.sym_addr == exp_addr);
+
+	/* CASE 2: Missing symbol returns -ENOENT */
+	assert(query_symbol(fd, "__nonexistent_kallsyms_symbol__", &q) == -ENOENT);
+
+	/* CASE 3: Empty symbol name returns -EINVAL */
+	assert(query_symbol(fd, "", &q) == -EINVAL);
+
+	/* CASE 4: NULL sym_name_addr returns -EFAULT */
+	assert(query_symbol(fd, NULL, &q) == -EFAULT);
+
+	/* CASE 5: Symbol name >= KSYM_NAME_LEN returns -ENAMETOOLONG */
+	memset(long_name, 'a', KSYM_NAME_LEN);
+	long_name[KSYM_NAME_LEN] = '\0';
+	assert(query_symbol(fd, long_name, &q) == -ENAMETOOLONG);
+
+	/* CASE 6: Symbol name == KSYM_NAME_LEN - 1 returns -ENOENT */
+	long_name[KSYM_NAME_LEN - 1] = '\0';
+	assert(query_symbol(fd, long_name, &q) == -ENOENT);
+
+	/* CASE 7: Zero, multiple, or unknown query_flags return -EINVAL */
+	q = sym_query(sym_name);
+	q.query_flags = 0;
+	assert(do_query(fd, &q) == -EINVAL);
+	q.query_flags = KALLSYMS_QUERY_BY_SYMBOL | KALLSYMS_QUERY_BY_ADDR;
+	assert(do_query(fd, &q) == -EINVAL);
+	q.query_flags = 1ULL << 63;
+	assert(do_query(fd, &q) == -EINVAL);
+
+	/* CASE 8: Non-zero output fields on input in symbol mode return -EINVAL */
+	q = sym_query(sym_name);
+	q.sym_addr = 1;
+	assert(do_query(fd, &q) == -EINVAL);
+	q = sym_query(sym_name);
+	q.sym_name_size = 1;
+	assert(do_query(fd, &q) == -EINVAL);
+
+	/* CASE 9: size < minimum size returns -EINVAL */
+	q = sym_query(sym_name);
+	q.size = KALLSYMS_QUERY_SIZE_VER0 - 8;
+	assert(do_query(fd, &q) == -EINVAL);
+
+	/* CASE 10: size > PAGE_SIZE returns -E2BIG */
+	q = sym_query(sym_name);
+	q.size = page_size + 8;
+	assert(do_query(fd, &q) == -E2BIG);
+
+	/* CASE 11: Larger extensible struct with zeroed trailing bytes succeeds */
+	q1 = (struct kallsyms_query_ext){ .v0 = sym_query(sym_name) };
+	q1.v0.size = sizeof(q1);
+	assert(do_query(fd, &q1) == 0);
+	assert(q1.v0.sym_addr == exp_addr);
+
+	/*
+	 * CASE 12: Larger struct with non-zero trailing bytes returns -E2BIG.
+	 * Set the last byte of a page-sized struct so that future fields do
+	 * not change the result.
+	 */
+	page_buf = calloc(1, page_size);
+	assert(page_buf);
+	q = sym_query(sym_name);
+	q.size = page_size;
+	memcpy(page_buf, &q, sizeof(q));
+	page_buf[page_size - 1] = 1;
+	assert(do_query(fd, page_buf) == -E2BIG);
+	free(page_buf);
+
+	/* CASE 13: Valid address-to-symbol query (exact start + interior offset) */
+	memset(resolved_name, 0, sizeof(resolved_name));
+	assert(query_addr(fd, exp_addr, resolved_name, sizeof(resolved_name), &q) == 0);
+	assert(strcmp(resolved_name, sym_name) == 0);
+	assert(q.sym_addr == exp_addr);
+	assert(q.sym_name_size == strlen(sym_name) + 1);
+
+	memset(resolved_name, 0, sizeof(resolved_name));
+	assert(query_addr(fd, exp_addr + 1, resolved_name, sizeof(resolved_name), &q) == 0);
+	assert(strcmp(resolved_name, sym_name) == 0);
+	assert(q.sym_addr == exp_addr + 1);
+	assert(q.sym_name_size == strlen(sym_name) + 1);
+
+	/* CASE 14: KALLSYMS_QUERY_BY_ADDR with buffer too small returns -ENAMETOOLONG */
+	assert(query_addr(fd, exp_addr, resolved_name, strlen(sym_name), &q) == -ENAMETOOLONG);
+
+	/* CASE 15: KALLSYMS_QUERY_BY_ADDR on unmapped address returns -ENOENT */
+	assert(query_addr(fd, ~0ULL, resolved_name, sizeof(resolved_name), &q) == -ENOENT);
+
+	/* CASE 16: KALLSYMS_QUERY_BY_ADDR invalid inputs return -EINVAL or -EFAULT */
+	assert(query_addr(fd, exp_addr, resolved_name, 0, &q) == -EINVAL);
+	assert(query_addr(fd, exp_addr, NULL, sizeof(resolved_name), &q) == -EFAULT);
+
+	close(fd);
+	return 0;
+}
-- 
2.56.0.257.gf7497c7d27-goog

