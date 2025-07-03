Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399622EE280
	for <llvm@lists.linux.dev>; Thu,  3 Jul 2025 12:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545091; cv=none; b=gw6paQBwCKN9GejWYvYE4VRJb8umnCzfykUBUyt3mdWt81CxZWqNYHc2gt7AVnFjQgXcceX2O8JIL9pBBpoYE0HpMYllNHunV8oJiWcL1HRPuw3SuUEKKig84KmB6UAh3xVf/rrrzGUYU6aJ6f4EhlniUoLcpmYdaqLNUG5bYZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545091; c=relaxed/simple;
	bh=lXSKe+i325ew63X/w+OnlsG1H4TdiVDzqF3alSTf8tQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D6geac9/8/CwzIgrOD6Eh1WG9ssug/R43PWWVMUo/6HIQg7ciHYj/9aOUIO+0mDDYgClJ7CxNIfDI8F7xkg/v3NTRm+udm0Sh7To5RbkvLzII+nspbyq+TOhCWuj7m1eMJVg+mmUZJ95DlR4V4j2/jebSjCtjGHcPlLrQJYFZ6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFnNezOK; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFnNezOK"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-748f5a4a423so3402373b3a.1
        for <llvm@lists.linux.dev>; Thu, 03 Jul 2025 05:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751545088; x=1752149888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1fhPP3SCpoWpscOG0d80WcLXXJcdcnXVq/IK4nq3qo=;
        b=BFnNezOKiSem6dArtvEeTUwb55iJZMK46LOh2wLOdH1GrwmG3GyT1vDIHv3AIG15Uz
         FmoUS9S9CiA/xHfkT5N6pOULY6wD5MT3eHnICTKn6FrFDIQyXaGXC6aFhM7vYHF1XmTt
         nz8CK5MW+fmG+bNLRaGTfSk8zrIbXr8uRe+E/jRcpXvXIPyR3WcUmxzLOHVusVTz1tl8
         9AWjLGcj54ULeFBAwWO4OJW37q0zJchfd+NQJljNSvYr8J/vUM/eOZ2odwc9Quk54eEy
         g4SvVNnF6R2KgtmuWDhAiVdU8gBEJB5YOeYSzvXfHzlIBEmM+Xl3KTVXjUqPcX2gc/TP
         SGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545088; x=1752149888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1fhPP3SCpoWpscOG0d80WcLXXJcdcnXVq/IK4nq3qo=;
        b=G8Spapo43wT5eQWoroLr4JEf6SzlWfvKIWY8Xzw28ZX1K4+5EYgnXEtvi7DOPFvnYI
         n7Ti7oazk8p3D5lenpNMOddmhjjeZD5YsQdwVRylbXPSc6VcsuHZAusrf/15GBh9iFct
         38G4lP4jLipNNhcrhoRdFjKXK8zEgIAHZuUJZqm0q3Z4YNGl1Nkixg+xqxvSGXYTZCai
         Ia17LZ02+R5rbpcEn4ADb2RYgx+qnXIUnysPKaeFQW/RxHDn3FTssEz7Hccmsy3gJB+i
         rPRGFWyhgV+9aWkH0+vfuJ8iXqKkatIU68yfVOS07zyb9C0fY1uVutMVsMUU3XgkcMtb
         XYmA==
X-Forwarded-Encrypted: i=1; AJvYcCWR8C175lRIu5jSTp6o8TEzz3y7qLiuhwSY7MNjFBKhdausLP5SKFNLeFKHFkEFIuwu2ktO@lists.linux.dev
X-Gm-Message-State: AOJu0YycckXgJ7GbWXVPE4jzLlkw4J232iIYY69FpU370h8OG9BSGPfc
	YB1YMPJp4QTLsIC6yD+K+Ws9k7ckYO0VeNf8q4VdqM8grjyNrY6qMXSC
X-Gm-Gg: ASbGncuZLBufUKN2g5XBE8VKhg3R/wCtDLpkSyZ+Vi902ycdwPnkUoeesGA+svYZndq
	rMbt9rGH/zszQLPA7/LMAYZapaUGD/xSayO+27XyZdkF2LVcrv2/yG6hoxZm2vP4rBDN9iXJrcS
	LuHPLOVqZd/c1mOT7EHgd7TOmzWXmbh9KiziDHtc2s44VfC+4bwlPQ2fhduneg3sr7t54DANsmj
	Py9zTn616DKEZt79sJHwBA6cjFErIkwmFXMZ3fwaSuIV0UoBtxMC0SXf2or4H4+rknF5cfOZVYN
	Vg+NfRYUDNA04zIKxKoCWuYJaaPfDjGHNuEM/RIBMqvCYNxS6jqt86q69zLuCDhSs70m86rj1rK
	/rFQ=
X-Google-Smtp-Source: AGHT+IFoq933597yqrzzjO/9I2OqyknJuG2sjlhUH2kPS6ZdIm+TDvJxSlTTtcaA9We7oo8H3FBJ9A==
X-Received: by 2002:a05:6a20:431b:b0:21a:d1fe:9e82 with SMTP id adf61e73a8af0-222d7ef8138mr13036914637.30.1751545088163;
        Thu, 03 Jul 2025 05:18:08 -0700 (PDT)
Received: from localhost.localdomain ([43.129.244.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5575895sm18591081b3a.94.2025.07.03.05.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 05:18:07 -0700 (PDT)
From: Menglong Dong <menglong8.dong@gmail.com>
X-Google-Original-From: Menglong Dong <dongml2@chinatelecom.cn>
To: alexei.starovoitov@gmail.com,
	rostedt@goodmis.org,
	jolsa@kernel.org
Cc: bpf@vger.kernel.org,
	Menglong Dong <dongml2@chinatelecom.cn>,
	Mykola Lysenko <mykolal@fb.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH bpf-next v2 16/18] selftests/bpf: move get_ksyms and get_addrs to trace_helpers.c
Date: Thu,  3 Jul 2025 20:15:19 +0800
Message-Id: <20250703121521.1874196-17-dongml2@chinatelecom.cn>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250703121521.1874196-1-dongml2@chinatelecom.cn>
References: <20250703121521.1874196-1-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to get all the kernel function that can be traced sometimes, so we
move the get_syms() and get_addrs() in kprobe_multi_test.c to
trace_helpers.c and rename it to bpf_get_ksyms() and bpf_get_addrs().

Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
---
 .../bpf/prog_tests/kprobe_multi_test.c        | 220 +-----------------
 tools/testing/selftests/bpf/trace_helpers.c   | 214 +++++++++++++++++
 tools/testing/selftests/bpf/trace_helpers.h   |   3 +
 3 files changed, 220 insertions(+), 217 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c b/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
index e19ef509ebf8..171706e78da8 100644
--- a/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
+++ b/tools/testing/selftests/bpf/prog_tests/kprobe_multi_test.c
@@ -422,220 +422,6 @@ static void test_unique_match(void)
 	kprobe_multi__destroy(skel);
 }
 
-static size_t symbol_hash(long key, void *ctx __maybe_unused)
-{
-	return str_hash((const char *) key);
-}
-
-static bool symbol_equal(long key1, long key2, void *ctx __maybe_unused)
-{
-	return strcmp((const char *) key1, (const char *) key2) == 0;
-}
-
-static bool is_invalid_entry(char *buf, bool kernel)
-{
-	if (kernel && strchr(buf, '['))
-		return true;
-	if (!kernel && !strchr(buf, '['))
-		return true;
-	return false;
-}
-
-static bool skip_entry(char *name)
-{
-	/*
-	 * We attach to almost all kernel functions and some of them
-	 * will cause 'suspicious RCU usage' when fprobe is attached
-	 * to them. Filter out the current culprits - arch_cpu_idle
-	 * default_idle and rcu_* functions.
-	 */
-	if (!strcmp(name, "arch_cpu_idle"))
-		return true;
-	if (!strcmp(name, "default_idle"))
-		return true;
-	if (!strncmp(name, "rcu_", 4))
-		return true;
-	if (!strcmp(name, "bpf_dispatcher_xdp_func"))
-		return true;
-	if (!strncmp(name, "__ftrace_invalid_address__",
-		     sizeof("__ftrace_invalid_address__") - 1))
-		return true;
-	return false;
-}
-
-/* Do comparision by ignoring '.llvm.<hash>' suffixes. */
-static int compare_name(const char *name1, const char *name2)
-{
-	const char *res1, *res2;
-	int len1, len2;
-
-	res1 = strstr(name1, ".llvm.");
-	res2 = strstr(name2, ".llvm.");
-	len1 = res1 ? res1 - name1 : strlen(name1);
-	len2 = res2 ? res2 - name2 : strlen(name2);
-
-	if (len1 == len2)
-		return strncmp(name1, name2, len1);
-	if (len1 < len2)
-		return strncmp(name1, name2, len1) <= 0 ? -1 : 1;
-	return strncmp(name1, name2, len2) >= 0 ? 1 : -1;
-}
-
-static int load_kallsyms_compare(const void *p1, const void *p2)
-{
-	return compare_name(((const struct ksym *)p1)->name, ((const struct ksym *)p2)->name);
-}
-
-static int search_kallsyms_compare(const void *p1, const struct ksym *p2)
-{
-	return compare_name(p1, p2->name);
-}
-
-static int get_syms(char ***symsp, size_t *cntp, bool kernel)
-{
-	size_t cap = 0, cnt = 0;
-	char *name = NULL, *ksym_name, **syms = NULL;
-	struct hashmap *map;
-	struct ksyms *ksyms;
-	struct ksym *ks;
-	char buf[256];
-	FILE *f;
-	int err = 0;
-
-	ksyms = load_kallsyms_custom_local(load_kallsyms_compare);
-	if (!ASSERT_OK_PTR(ksyms, "load_kallsyms_custom_local"))
-		return -EINVAL;
-
-	/*
-	 * The available_filter_functions contains many duplicates,
-	 * but other than that all symbols are usable in kprobe multi
-	 * interface.
-	 * Filtering out duplicates by using hashmap__add, which won't
-	 * add existing entry.
-	 */
-
-	if (access("/sys/kernel/tracing/trace", F_OK) == 0)
-		f = fopen("/sys/kernel/tracing/available_filter_functions", "r");
-	else
-		f = fopen("/sys/kernel/debug/tracing/available_filter_functions", "r");
-
-	if (!f)
-		return -EINVAL;
-
-	map = hashmap__new(symbol_hash, symbol_equal, NULL);
-	if (IS_ERR(map)) {
-		err = libbpf_get_error(map);
-		goto error;
-	}
-
-	while (fgets(buf, sizeof(buf), f)) {
-		if (is_invalid_entry(buf, kernel))
-			continue;
-
-		free(name);
-		if (sscanf(buf, "%ms$*[^\n]\n", &name) != 1)
-			continue;
-		if (skip_entry(name))
-			continue;
-
-		ks = search_kallsyms_custom_local(ksyms, name, search_kallsyms_compare);
-		if (!ks) {
-			err = -EINVAL;
-			goto error;
-		}
-
-		ksym_name = ks->name;
-		err = hashmap__add(map, ksym_name, 0);
-		if (err == -EEXIST) {
-			err = 0;
-			continue;
-		}
-		if (err)
-			goto error;
-
-		err = libbpf_ensure_mem((void **) &syms, &cap,
-					sizeof(*syms), cnt + 1);
-		if (err)
-			goto error;
-
-		syms[cnt++] = ksym_name;
-	}
-
-	*symsp = syms;
-	*cntp = cnt;
-
-error:
-	free(name);
-	fclose(f);
-	hashmap__free(map);
-	if (err)
-		free(syms);
-	return err;
-}
-
-static int get_addrs(unsigned long **addrsp, size_t *cntp, bool kernel)
-{
-	unsigned long *addr, *addrs, *tmp_addrs;
-	int err = 0, max_cnt, inc_cnt;
-	char *name = NULL;
-	size_t cnt = 0;
-	char buf[256];
-	FILE *f;
-
-	if (access("/sys/kernel/tracing/trace", F_OK) == 0)
-		f = fopen("/sys/kernel/tracing/available_filter_functions_addrs", "r");
-	else
-		f = fopen("/sys/kernel/debug/tracing/available_filter_functions_addrs", "r");
-
-	if (!f)
-		return -ENOENT;
-
-	/* In my local setup, the number of entries is 50k+ so Let us initially
-	 * allocate space to hold 64k entries. If 64k is not enough, incrementally
-	 * increase 1k each time.
-	 */
-	max_cnt = 65536;
-	inc_cnt = 1024;
-	addrs = malloc(max_cnt * sizeof(long));
-	if (addrs == NULL) {
-		err = -ENOMEM;
-		goto error;
-	}
-
-	while (fgets(buf, sizeof(buf), f)) {
-		if (is_invalid_entry(buf, kernel))
-			continue;
-
-		free(name);
-		if (sscanf(buf, "%p %ms$*[^\n]\n", &addr, &name) != 2)
-			continue;
-		if (skip_entry(name))
-			continue;
-
-		if (cnt == max_cnt) {
-			max_cnt += inc_cnt;
-			tmp_addrs = realloc(addrs, max_cnt);
-			if (!tmp_addrs) {
-				err = -ENOMEM;
-				goto error;
-			}
-			addrs = tmp_addrs;
-		}
-
-		addrs[cnt++] = (unsigned long)addr;
-	}
-
-	*addrsp = addrs;
-	*cntp = cnt;
-
-error:
-	free(name);
-	fclose(f);
-	if (err)
-		free(addrs);
-	return err;
-}
-
 static void do_bench_test(struct kprobe_multi_empty *skel, struct bpf_kprobe_multi_opts *opts)
 {
 	long attach_start_ns, attach_end_ns;
@@ -670,7 +456,7 @@ static void test_kprobe_multi_bench_attach(bool kernel)
 	char **syms = NULL;
 	size_t cnt = 0;
 
-	if (!ASSERT_OK(get_syms(&syms, &cnt, kernel), "get_syms"))
+	if (!ASSERT_OK(bpf_get_ksyms(&syms, &cnt, kernel), "bpf_get_ksyms"))
 		return;
 
 	skel = kprobe_multi_empty__open_and_load();
@@ -696,13 +482,13 @@ static void test_kprobe_multi_bench_attach_addr(bool kernel)
 	size_t cnt = 0;
 	int err;
 
-	err = get_addrs(&addrs, &cnt, kernel);
+	err = bpf_get_addrs(&addrs, &cnt, kernel);
 	if (err == -ENOENT) {
 		test__skip();
 		return;
 	}
 
-	if (!ASSERT_OK(err, "get_addrs"))
+	if (!ASSERT_OK(err, "bpf_get_addrs"))
 		return;
 
 	skel = kprobe_multi_empty__open_and_load();
diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
index 81943c6254e6..d24baf244d1f 100644
--- a/tools/testing/selftests/bpf/trace_helpers.c
+++ b/tools/testing/selftests/bpf/trace_helpers.c
@@ -17,6 +17,7 @@
 #include <linux/limits.h>
 #include <libelf.h>
 #include <gelf.h>
+#include "bpf/hashmap.h"
 #include "bpf/libbpf_internal.h"
 
 #define TRACEFS_PIPE	"/sys/kernel/tracing/trace_pipe"
@@ -519,3 +520,216 @@ void read_trace_pipe(void)
 {
 	read_trace_pipe_iter(trace_pipe_cb, NULL, 0);
 }
+
+static size_t symbol_hash(long key, void *ctx __maybe_unused)
+{
+	return str_hash((const char *) key);
+}
+
+static bool symbol_equal(long key1, long key2, void *ctx __maybe_unused)
+{
+	return strcmp((const char *) key1, (const char *) key2) == 0;
+}
+
+static bool is_invalid_entry(char *buf, bool kernel)
+{
+	if (kernel && strchr(buf, '['))
+		return true;
+	if (!kernel && !strchr(buf, '['))
+		return true;
+	return false;
+}
+
+static bool skip_entry(char *name)
+{
+	/*
+	 * We attach to almost all kernel functions and some of them
+	 * will cause 'suspicious RCU usage' when fprobe is attached
+	 * to them. Filter out the current culprits - arch_cpu_idle
+	 * default_idle and rcu_* functions.
+	 */
+	if (!strcmp(name, "arch_cpu_idle"))
+		return true;
+	if (!strcmp(name, "default_idle"))
+		return true;
+	if (!strncmp(name, "rcu_", 4))
+		return true;
+	if (!strcmp(name, "bpf_dispatcher_xdp_func"))
+		return true;
+	if (!strncmp(name, "__ftrace_invalid_address__",
+		     sizeof("__ftrace_invalid_address__") - 1))
+		return true;
+	return false;
+}
+
+/* Do comparison by ignoring '.llvm.<hash>' suffixes. */
+static int compare_name(const char *name1, const char *name2)
+{
+	const char *res1, *res2;
+	int len1, len2;
+
+	res1 = strstr(name1, ".llvm.");
+	res2 = strstr(name2, ".llvm.");
+	len1 = res1 ? res1 - name1 : strlen(name1);
+	len2 = res2 ? res2 - name2 : strlen(name2);
+
+	if (len1 == len2)
+		return strncmp(name1, name2, len1);
+	if (len1 < len2)
+		return strncmp(name1, name2, len1) <= 0 ? -1 : 1;
+	return strncmp(name1, name2, len2) >= 0 ? 1 : -1;
+}
+
+static int load_kallsyms_compare(const void *p1, const void *p2)
+{
+	return compare_name(((const struct ksym *)p1)->name, ((const struct ksym *)p2)->name);
+}
+
+static int search_kallsyms_compare(const void *p1, const struct ksym *p2)
+{
+	return compare_name(p1, p2->name);
+}
+
+int bpf_get_ksyms(char ***symsp, size_t *cntp, bool kernel)
+{
+	size_t cap = 0, cnt = 0;
+	char *name = NULL, *ksym_name, **syms = NULL;
+	struct hashmap *map;
+	struct ksyms *ksyms;
+	struct ksym *ks;
+	char buf[256];
+	FILE *f;
+	int err = 0;
+
+	ksyms = load_kallsyms_custom_local(load_kallsyms_compare);
+	if (!ksyms)
+		return -EINVAL;
+
+	/*
+	 * The available_filter_functions contains many duplicates,
+	 * but other than that all symbols are usable to trace.
+	 * Filtering out duplicates by using hashmap__add, which won't
+	 * add existing entry.
+	 */
+
+	if (access("/sys/kernel/tracing/trace", F_OK) == 0)
+		f = fopen("/sys/kernel/tracing/available_filter_functions", "r");
+	else
+		f = fopen("/sys/kernel/debug/tracing/available_filter_functions", "r");
+
+	if (!f)
+		return -EINVAL;
+
+	map = hashmap__new(symbol_hash, symbol_equal, NULL);
+	if (IS_ERR(map)) {
+		err = libbpf_get_error(map);
+		goto error;
+	}
+
+	while (fgets(buf, sizeof(buf), f)) {
+		if (is_invalid_entry(buf, kernel))
+			continue;
+
+		free(name);
+		if (sscanf(buf, "%ms$*[^\n]\n", &name) != 1)
+			continue;
+		if (skip_entry(name))
+			continue;
+
+		ks = search_kallsyms_custom_local(ksyms, name, search_kallsyms_compare);
+		if (!ks) {
+			err = -EINVAL;
+			goto error;
+		}
+
+		ksym_name = ks->name;
+		err = hashmap__add(map, ksym_name, 0);
+		if (err == -EEXIST) {
+			err = 0;
+			continue;
+		}
+		if (err)
+			goto error;
+
+		err = libbpf_ensure_mem((void **) &syms, &cap,
+					sizeof(*syms), cnt + 1);
+		if (err)
+			goto error;
+
+		syms[cnt++] = ksym_name;
+	}
+
+	*symsp = syms;
+	*cntp = cnt;
+
+error:
+	free(name);
+	fclose(f);
+	hashmap__free(map);
+	if (err)
+		free(syms);
+	return err;
+}
+
+int bpf_get_addrs(unsigned long **addrsp, size_t *cntp, bool kernel)
+{
+	unsigned long *addr, *addrs, *tmp_addrs;
+	int err = 0, max_cnt, inc_cnt;
+	char *name = NULL;
+	size_t cnt = 0;
+	char buf[256];
+	FILE *f;
+
+	if (access("/sys/kernel/tracing/trace", F_OK) == 0)
+		f = fopen("/sys/kernel/tracing/available_filter_functions_addrs", "r");
+	else
+		f = fopen("/sys/kernel/debug/tracing/available_filter_functions_addrs", "r");
+
+	if (!f)
+		return -ENOENT;
+
+	/* In my local setup, the number of entries is 50k+ so Let us initially
+	 * allocate space to hold 64k entries. If 64k is not enough, incrementally
+	 * increase 1k each time.
+	 */
+	max_cnt = 65536;
+	inc_cnt = 1024;
+	addrs = malloc(max_cnt * sizeof(long));
+	if (addrs == NULL) {
+		err = -ENOMEM;
+		goto error;
+	}
+
+	while (fgets(buf, sizeof(buf), f)) {
+		if (is_invalid_entry(buf, kernel))
+			continue;
+
+		free(name);
+		if (sscanf(buf, "%p %ms$*[^\n]\n", &addr, &name) != 2)
+			continue;
+		if (skip_entry(name))
+			continue;
+
+		if (cnt == max_cnt) {
+			max_cnt += inc_cnt;
+			tmp_addrs = realloc(addrs, max_cnt);
+			if (!tmp_addrs) {
+				err = -ENOMEM;
+				goto error;
+			}
+			addrs = tmp_addrs;
+		}
+
+		addrs[cnt++] = (unsigned long)addr;
+	}
+
+	*addrsp = addrs;
+	*cntp = cnt;
+
+error:
+	free(name);
+	fclose(f);
+	if (err)
+		free(addrs);
+	return err;
+}
diff --git a/tools/testing/selftests/bpf/trace_helpers.h b/tools/testing/selftests/bpf/trace_helpers.h
index 2ce873c9f9aa..9437bdd4afa5 100644
--- a/tools/testing/selftests/bpf/trace_helpers.h
+++ b/tools/testing/selftests/bpf/trace_helpers.h
@@ -41,4 +41,7 @@ ssize_t get_rel_offset(uintptr_t addr);
 
 int read_build_id(const char *path, char *build_id, size_t size);
 
+int bpf_get_ksyms(char ***symsp, size_t *cntp, bool kernel);
+int bpf_get_addrs(unsigned long **addrsp, size_t *cntp, bool kernel);
+
 #endif
-- 
2.39.5

