Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FDA3A8F3
	for <llvm@lists.linux.dev>; Sun, 10 Mar 2024 02:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710036368; cv=none; b=aLIwuOa9JoFGl58KEK6OsAqpehkuIJGkdrpg+berxUjqN/Z3mMOF5j6T0saxETJ2iGR/4M3WwDLnFc7Vm4xWmG8vJ9mxmTGk6K6jkl7mnF/1vOLlgydAfInzoLgQJIo6u60rjBQowjuw6AzRX4lVKFIse6Q+11Bm5nHLJwGMoM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710036368; c=relaxed/simple;
	bh=qvu80I2tuIwczv3ewDN5Kf8bkfHfC9IP72lON4Zzmek=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Cc:Content-Type; b=cTJtAJUokLnlVSnb+DDBhyLuyO3ZC5IBuD/j7cXva6tpFKTg7PdVOwz4ByZo4UUlSGgeKaI0/A2bXQ1v9Jx9AhuTf4Q8wgE1prlBfqHS261JkKdrMvzPMx1g70PQSBcI+eJcHpUjxMaL+ZGJbArabHV3oTe5497JP7nPjir6fxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Sqv56wnK; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sqv56wnK"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc693399655so6232150276.1
        for <llvm@lists.linux.dev>; Sat, 09 Mar 2024 18:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710036365; x=1710641165; darn=lists.linux.dev;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z2TI3BR52BOETJMkXQVYiCvqxjFYb61EnnuV6r2EGgU=;
        b=Sqv56wnKC1DIssJmgu8aLvSLca7jzu1RD06pai5VftaZKKxLCnBkUw5FhlcemiO2YW
         X0zkLtp+YZheuY9t9aOTb1+ZRM71EgY50Tb0WkIFLJ0KbNN6PrvHY6PEA60zNnU0YAO7
         QtAkowKBKUojprcr38X0p2da9VNcAolblOkCEAOYLZfYdLE0lVpVrm47HL37eABenk8U
         6dE8zvlYJSPRRjwsJnw30VBQRt/EAa51LNKNR9jB/Bzp5i0HCmUTNrJw0cxPlVbANhSE
         UNXb4OH3QQd2KIuxQsjqiRokxWnnOYWSIxK9x3e4erz9mewTh3bKTh1GTOxTRKcxYtsy
         yF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710036365; x=1710641165;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2TI3BR52BOETJMkXQVYiCvqxjFYb61EnnuV6r2EGgU=;
        b=Hf5nCJzeqaPSK9I571/7+5Nf7j+9zxgqF+V2bKAgdZspoATi0mITLjb1UfSDoffEWa
         YU1W2KiqGdMo6vvPiPvyMdiwee+Mg5p7kKlgqoXcTbx1OZdpoXNVptUc5PeGYIE8Kv8W
         eA/j6mbcBl/yrKKMSBU3XOpbT/oL3PpXanunptGtdfXXIIYv7c68yVPEto5nw6lE2P9b
         434HXo/L6oLosJjoq0kUZBssZ5PhNgZT4celxYiYPrrfdHtN62KAkKdDNKc4AK8c0weN
         bvtnniUOE9qAaGG46KvQZSpaqTa+PIP8flbnBDppE3/a4yFjVvl65eR41FWvC7ynV3V1
         DN0A==
X-Forwarded-Encrypted: i=1; AJvYcCVpPvfsTWdMyjpF1tIAnEUcDpz5T2j7nTlh0sZA9y76PFBPR7MUxicDLTUKQ2LeQgdgx61efNt9Srt55/EkzBO5K6bPig==
X-Gm-Message-State: AOJu0Yzhvjd/WArFSk3MPaa8fK1yoSTsLGuUUM5V02hFteXapAh/N6IE
	vAM8glCo0voFFQzYZJM1wP+45U3Y5eG8+4FnEXpuOaMX6wLUM7wdteHGK65eOsjqCHLyYK7kUwv
	DPzOsIg==
X-Google-Smtp-Source: AGHT+IHg84e8jFIAgnoZrRiN8Pu+L19uE2B6rig+tSx4eREFwobOlwuHge4FvzAmOSQKYE9pLZGbcXyYmOgE
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:a63d:1b65:e810:3ad3])
 (user=irogers job=sendgmr) by 2002:a05:6902:18c9:b0:dc6:fec4:1c26 with SMTP
 id ck9-20020a05690218c900b00dc6fec41c26mr897542ybb.1.1710036365375; Sat, 09
 Mar 2024 18:06:05 -0800 (PST)
Date: Sat,  9 Mar 2024 18:05:08 -0800
In-Reply-To: <20240310020509.647319-1-irogers@google.com>
Message-Id: <20240310020509.647319-14-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240310020509.647319-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Subject: [PATCH v1 13/13] tools headers: Rename noinline to __noinline
From: Ian Rogers <irogers@google.com>
To: Arnd Bergmann <arnd@arndb.de>, Andrii Nakryiko <andrii@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <keescook@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Liam Howlett <liam.howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>, 
	David Laight <David.Laight@ACULAB.COM>, "Michael S. Tsirkin" <mst@redhat.com>, Shunsuke Mie <mie@igel.co.jp>, 
	Yafang Shao <laoar.shao@gmail.com>, Kui-Feng Lee <kuifeng@meta.com>, 
	James Clark <james.clark@arm.com>, Nick Forrington <nick.forrington@arm.com>, 
	Leo Yan <leo.yan@linux.dev>, German Gomez <german.gomez@arm.com>, Rob Herring <robh@kernel.org>, 
	John Garry <john.g.garry@oracle.com>, Sean Christopherson <seanjc@google.com>, 
	Anup Patel <anup@brainfault.org>, Fuad Tabba <tabba@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Peter Xu <peterx@redhat.com>, 
	Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-hardening@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: Christopher Di Bella <cjdb@google.com>
Content-Type: text/plain; charset="UTF-8"

An issue was reported with clang and llvm libc where the noinline
attribute [1] was being expanded due to the #define in
linux/compiler.h (now in compiler_attributes.h). The expansion caused
the __attribute__ to appear twice and break the build. To avoid this
conflict, rename noinline to __noinline which is more consistent with
other compiler attributes.

[1] https://clang.llvm.org/docs/AttributeReference.html#noinline
Reported-by: Christopher Di Bella <cjdb@google.com>

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/linux/compiler_attributes.h |  4 ++--
 tools/perf/arch/x86/tests/bp-modify.c     |  4 ++--
 tools/perf/bench/find-bit-bench.c         |  2 +-
 tools/perf/tests/bp_account.c             |  2 +-
 tools/perf/tests/bp_signal.c              |  2 +-
 tools/perf/tests/bp_signal_overflow.c     |  2 +-
 tools/perf/tests/dwarf-unwind.c           | 12 ++++++------
 tools/perf/tests/workloads/leafloop.c     |  8 ++++----
 tools/perf/tests/workloads/thloop.c       |  4 ++--
 9 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/tools/include/linux/compiler_attributes.h b/tools/include/linux/compiler_attributes.h
index 9bfaec783e48..1ff3d85f5af3 100644
--- a/tools/include/linux/compiler_attributes.h
+++ b/tools/include/linux/compiler_attributes.h
@@ -267,12 +267,12 @@
 # define __flatten			__attribute__((flatten))
 
 /*
- * Note the missing underscores.
+ * Note, the kernel version is missing the underscores.
  *
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-noinline-function-attribute
  * clang: mentioned
  */
-#define   noinline                      __attribute__((__noinline__))
+#define   __noinline                      __attribute__((__noinline__))
 
 /*
  * Optional: only supported since gcc >= 8
diff --git a/tools/perf/arch/x86/tests/bp-modify.c b/tools/perf/arch/x86/tests/bp-modify.c
index 0924ccd9e36d..65493ff7a76f 100644
--- a/tools/perf/arch/x86/tests/bp-modify.c
+++ b/tools/perf/arch/x86/tests/bp-modify.c
@@ -15,13 +15,13 @@
 #include "tests/tests.h"
 #include "arch-tests.h"
 
-static noinline int bp_1(void)
+static __noinline int bp_1(void)
 {
 	pr_debug("in %s\n", __func__);
 	return 0;
 }
 
-static noinline int bp_2(void)
+static __noinline int bp_2(void)
 {
 	pr_debug("in %s\n", __func__);
 	return 0;
diff --git a/tools/perf/bench/find-bit-bench.c b/tools/perf/bench/find-bit-bench.c
index 7e25b0e413f6..dd97a51649bc 100644
--- a/tools/perf/bench/find-bit-bench.c
+++ b/tools/perf/bench/find-bit-bench.c
@@ -31,7 +31,7 @@ static const char *const bench_usage[] = {
 static unsigned int accumulator;
 static unsigned int use_of_val;
 
-static noinline void workload(int val)
+static __noinline void workload(int val)
 {
 	use_of_val += val;
 	accumulator++;
diff --git a/tools/perf/tests/bp_account.c b/tools/perf/tests/bp_account.c
index 6f921db33cf9..459f61752a71 100644
--- a/tools/perf/tests/bp_account.c
+++ b/tools/perf/tests/bp_account.c
@@ -34,7 +34,7 @@
 
 static volatile long the_var;
 
-static noinline int test_function(void)
+static __noinline int test_function(void)
 {
 	return 0;
 }
diff --git a/tools/perf/tests/bp_signal.c b/tools/perf/tests/bp_signal.c
index 1f2908f02389..484a7e7f96ee 100644
--- a/tools/perf/tests/bp_signal.c
+++ b/tools/perf/tests/bp_signal.c
@@ -59,7 +59,7 @@ static void __test_function(volatile long *ptr)
 }
 #endif
 
-static noinline int test_function(void)
+static __noinline int test_function(void)
 {
 	__test_function(&the_var);
 	the_var++;
diff --git a/tools/perf/tests/bp_signal_overflow.c b/tools/perf/tests/bp_signal_overflow.c
index 4e897c2cf26b..9436bf2973f8 100644
--- a/tools/perf/tests/bp_signal_overflow.c
+++ b/tools/perf/tests/bp_signal_overflow.c
@@ -30,7 +30,7 @@
 
 static int overflows;
 
-static noinline int test_function(void)
+static __noinline int test_function(void)
 {
 	return time(NULL);
 }
diff --git a/tools/perf/tests/dwarf-unwind.c b/tools/perf/tests/dwarf-unwind.c
index d01aa931fe81..a669c69a9242 100644
--- a/tools/perf/tests/dwarf-unwind.c
+++ b/tools/perf/tests/dwarf-unwind.c
@@ -109,7 +109,7 @@ static int unwind_entry(struct unwind_entry *entry, void *arg)
 	return strcmp((const char *) symbol, funcs[idx]);
 }
 
-NO_TAIL_CALL_ATTRIBUTE noinline int test_dwarf_unwind__thread(struct thread *thread)
+NO_TAIL_CALL_ATTRIBUTE __noinline int test_dwarf_unwind__thread(struct thread *thread)
 {
 	struct perf_sample sample;
 	unsigned long cnt = 0;
@@ -140,7 +140,7 @@ NO_TAIL_CALL_ATTRIBUTE noinline int test_dwarf_unwind__thread(struct thread *thr
 
 static int global_unwind_retval = -INT_MAX;
 
-NO_TAIL_CALL_ATTRIBUTE noinline int test_dwarf_unwind__compare(void *p1, void *p2)
+NO_TAIL_CALL_ATTRIBUTE __noinline int test_dwarf_unwind__compare(void *p1, void *p2)
 {
 	/* Any possible value should be 'thread' */
 	struct thread *thread = *(struct thread **)p1;
@@ -159,7 +159,7 @@ NO_TAIL_CALL_ATTRIBUTE noinline int test_dwarf_unwind__compare(void *p1, void *p
 	return p1 - p2;
 }
 
-NO_TAIL_CALL_ATTRIBUTE noinline int test_dwarf_unwind__krava_3(struct thread *thread)
+NO_TAIL_CALL_ATTRIBUTE __noinline int test_dwarf_unwind__krava_3(struct thread *thread)
 {
 	struct thread *array[2] = {thread, thread};
 	void *fp = &bsearch;
@@ -178,7 +178,7 @@ NO_TAIL_CALL_ATTRIBUTE noinline int test_dwarf_unwind__krava_3(struct thread *th
 	return global_unwind_retval;
 }
 
-NO_TAIL_CALL_ATTRIBUTE noinline int test_dwarf_unwind__krava_2(struct thread *thread)
+NO_TAIL_CALL_ATTRIBUTE __noinline int test_dwarf_unwind__krava_2(struct thread *thread)
 {
 	int ret;
 
@@ -187,7 +187,7 @@ NO_TAIL_CALL_ATTRIBUTE noinline int test_dwarf_unwind__krava_2(struct thread *th
 	return ret;
 }
 
-NO_TAIL_CALL_ATTRIBUTE noinline int test_dwarf_unwind__krava_1(struct thread *thread)
+NO_TAIL_CALL_ATTRIBUTE __noinline int test_dwarf_unwind__krava_1(struct thread *thread)
 {
 	int ret;
 
@@ -196,7 +196,7 @@ NO_TAIL_CALL_ATTRIBUTE noinline int test_dwarf_unwind__krava_1(struct thread *th
 	return ret;
 }
 
-noinline int test__dwarf_unwind(struct test_suite *test __maybe_unused,
+__noinline int test__dwarf_unwind(struct test_suite *test __maybe_unused,
 				int subtest __maybe_unused)
 {
 	struct machine *machine;
diff --git a/tools/perf/tests/workloads/leafloop.c b/tools/perf/tests/workloads/leafloop.c
index 1bf5cc97649b..89d2cec2f461 100644
--- a/tools/perf/tests/workloads/leafloop.c
+++ b/tools/perf/tests/workloads/leafloop.c
@@ -4,18 +4,18 @@
 #include "../tests.h"
 
 /* We want to check these symbols in perf script */
-noinline void leaf(volatile int b);
-noinline void parent(volatile int b);
+__noinline void leaf(volatile int b);
+__noinline void parent(volatile int b);
 
 static volatile int a;
 
-noinline void leaf(volatile int b)
+__noinline void leaf(volatile int b)
 {
 	for (;;)
 		a += b;
 }
 
-noinline void parent(volatile int b)
+__noinline void parent(volatile int b)
 {
 	leaf(b);
 }
diff --git a/tools/perf/tests/workloads/thloop.c b/tools/perf/tests/workloads/thloop.c
index 457b29f91c3e..e252efb76203 100644
--- a/tools/perf/tests/workloads/thloop.c
+++ b/tools/perf/tests/workloads/thloop.c
@@ -9,14 +9,14 @@
 static volatile sig_atomic_t done;
 
 /* We want to check this symbol in perf report */
-noinline void test_loop(void);
+__noinline void test_loop(void);
 
 static void sighandler(int sig __maybe_unused)
 {
 	done = 1;
 }
 
-noinline void test_loop(void)
+__noinline void test_loop(void)
 {
 	while (!done);
 }
-- 
2.44.0.278.ge034bb2e1d-goog

