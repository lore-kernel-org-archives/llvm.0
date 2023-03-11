Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EC77B
	for <llvm@lists.linux.dev>; Sat, 11 Mar 2023 06:58:42 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5416d3a321eso5478057b3.12
        for <llvm@lists.linux.dev>; Fri, 10 Mar 2023 22:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678517922;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P5GcUUcZRN+AEu9vpTIS9W0tRqRRERda5Pu2Ht/K9Pk=;
        b=pR13zWUd1h9CUw/T2GV0Cj+B8jhP5cn1b0sfJynxS58CMKOE3JqEuutXfxMi4Wioti
         EFbn2mdwNoHJ/wARCIZO56BUhwpqgFZ4Bn5sPoYHugdpGrzTJmayahuR+TNP5iqQgy/x
         CqWQeouCG3GnHU6qgt4kdZpK5XM+ljNUv0Jsdzr7g/tl9L65XCuwCndRocKy+po/BQzU
         ruGs389OD5dZUXcUWJjPGX566lwUNDY7Xc+oEkZSRYH+PVXpT8RFXWNcEPR71t4g47Sx
         sLTI3WeR7S1OZCkHPeDiOq26WyWmPGQPgAJqIzyXSYb0CMy3RBdWVwkUSQGv+qwnbW9q
         VBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678517922;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5GcUUcZRN+AEu9vpTIS9W0tRqRRERda5Pu2Ht/K9Pk=;
        b=0enEANLCIP2Vm1MXC4XG6Q/mMpru7nGd4655EM+MxiyQuIisoZnWoeuW+g81hggGs2
         mZfHg4YmNgr27YBki87QvoEBCl6rudWBpBeun+zcdtQiKq0l05iucKQXjWrYQiwkNYMf
         Kw32gO1J52Q7bEfch9JXOs9hisfk3kGu5pZvjyYrQdQ6QrV1c0h6LO6TfN5pBxwmVbvQ
         /X0XqTGvjd7+a/nMXP5pBHCpYtWA+85jJ0hsLs04++X8fuCVnLCoBIKxIAq+UUrrUgxn
         G/mhMmuMqYM9oWVxXPw/MnG3uVZRKv2qn5bTWm7oE90bi0vwI0jSc8SlYKpuwhn++jen
         XyWA==
X-Gm-Message-State: AO0yUKWe7KW6h4d44gIQyP3JW4Qct6b0YMLjDdpfynL2lV8cOGd6b1PK
	K2dmmdMzjOL9YQeoEZM6l1eNaJz5LIef
X-Google-Smtp-Source: AK7set+6srXuJ0wtMRw7PpcSCeXW+oUgIuzrriuNVGeyYG1RPaHgSLMosGnTbUK0w+ieDCHiEIQd12hje2ew
X-Received: from irogers.svl.corp.google.com ([2620:15c:2d4:203:a11d:a763:a328:f2d6])
 (user=irogers job=sendgmr) by 2002:a05:6902:208:b0:ace:1ae4:9dd2 with SMTP id
 j8-20020a056902020800b00ace1ae49dd2mr17170987ybs.8.1678517921899; Fri, 10 Mar
 2023 22:58:41 -0800 (PST)
Date: Fri, 10 Mar 2023 22:57:45 -0800
In-Reply-To: <20230311065753.3012826-1-irogers@google.com>
Message-Id: <20230311065753.3012826-6-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230311065753.3012826-1-irogers@google.com>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Subject: [PATCH v1 05/13] perf util: Remove weak sched_getcpu
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Quentin Monnet <quentin@isovalent.com>, 
	Andres Freund <andres@anarazel.de>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Pavithra Gurushankar <gpavithrasha@gmail.com>, Yang Jihong <yangjihong1@huawei.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@linaro.org>, 
	"=?UTF-8?q?Martin=20Li=C5=A1ka?=" <mliska@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Cc: Stephane Eranian <eranian@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

sched_getcpu may not be present and so a feature test and definition
exist to workaround this in the build. The feature test is used to
define HAVE_SCHED_GETCPU_SUPPORT and so this is sufficient to know
whether the local sched_getcpu is needed and a weak symbol can be
avoided.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/cloexec.c | 13 -------------
 tools/perf/util/util.c    | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/tools/perf/util/cloexec.c b/tools/perf/util/cloexec.c
index fa8248aadb59..8830604c3a8d 100644
--- a/tools/perf/util/cloexec.c
+++ b/tools/perf/util/cloexec.c
@@ -13,19 +13,6 @@
 
 static unsigned long flag = PERF_FLAG_FD_CLOEXEC;
 
-int __weak sched_getcpu(void)
-{
-#ifdef __NR_getcpu
-	unsigned cpu;
-	int err = syscall(__NR_getcpu, &cpu, NULL, NULL);
-	if (!err)
-		return cpu;
-#else
-	errno = ENOSYS;
-#endif
-	return -1;
-}
-
 static int perf_flag_probe(void)
 {
 	/* use 'safest' configuration as used in evsel__fallback() */
diff --git a/tools/perf/util/util.c b/tools/perf/util/util.c
index 391c1e928bd7..b356c9f7f0c3 100644
--- a/tools/perf/util/util.c
+++ b/tools/perf/util/util.c
@@ -533,3 +533,19 @@ int do_realloc_array_as_needed(void **arr, size_t *arr_sz, size_t x, size_t msz,
 	*arr_sz = new_sz;
 	return 0;
 }
+
+#ifndef HAVE_SCHED_GETCPU_SUPPORT
+int sched_getcpu(void)
+{
+#ifdef __NR_getcpu
+	unsigned int cpu;
+	int err = syscall(__NR_getcpu, &cpu, NULL, NULL);
+
+	if (!err)
+		return cpu;
+#else
+	errno = ENOSYS;
+#endif
+	return -1;
+}
+#endif
-- 
2.40.0.rc1.284.g88254d51c5-goog

