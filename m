Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FB339860
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 03:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708486929; cv=none; b=RssiJtyjg+iOQgoNT9w/aomFapYHndaI/M5fyz3xWF4jKWs6P6ycjiR6YXwPWKt8ZVMJsZTvZKz16YVm5M1BqiIHW53qz/uYrGew9Y1eoHiDjyVRTr/x59uRg/uyTEB7FuRBjDZrQI0zyeUdVg9tDXj/M7zxI/t258k/OM3XiZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708486929; c=relaxed/simple;
	bh=3dph1oOgPNiMARTIk1TUv0cnoXVZ3w2YcrnwEMmaGXE=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=BHoQL74pAz8x207E14WUgn1vr6ByYCCaRImYUR1ce4NiUD97eO/25CWdx778zOFKe5m4LpJOAdJj0Wd+XEHXLRSTLVNlPDkCt212/ApytOrG3i2/CyK0tI5MxujB0DgOuLxC5GCQyb2pFTRPqlbE+T6rornkCB+KrlQUCobe0WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x9QLZBti; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x9QLZBti"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60802b0afd2so42498557b3.1
        for <llvm@lists.linux.dev>; Tue, 20 Feb 2024 19:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708486927; x=1709091727; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GN8DooxqnWYMX4Lx9QAzw7baLGn2b+1JMBP0il1xEM0=;
        b=x9QLZBtirr8pNYFJVeKiKvpFJ3CH6yd9ftNtXdatqLx1bkhMeZbpg6WG5pBjMa0svl
         4+PLwApjr5Ql1vo80O63j9yflPFnHd1Q3zoLBy2tU3kRK1T4nGN8IY6ExQnRKBh8Jhg0
         8/h4JYwKpSTjAf8CK80LN45cxiOYn6yN0rhL29ySQJ9do/72HIFlhPl5jR7MYc/gGGkR
         tGZRwMZfLM85lynoYbHOIaMQRUzbPMbUImREtyxDY1ZFH9UUxQthtd8Xi1X/hiZJBYA7
         UO0+bk4IRcNn3p8rX3r6RO8nETy68YmUb35VmCq/ihXzTKLIk6ghnDuevM7oBuYNxQUk
         Dq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486927; x=1709091727;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GN8DooxqnWYMX4Lx9QAzw7baLGn2b+1JMBP0il1xEM0=;
        b=qda4nikI9t9ak66As842oVWhRcz3p15/liVswOQ1+KPg6W3p/gJn4vGjsCMftXLRQP
         3qT9of9KTGPBPidCBWsW64dOt4zNrweLTo5tAdMFAT40414k66gjPKaxCLJiGLEKvHxy
         beOLplNdUwzcm/zSA264laOUGZKyGiqlLnOx2Y45lr6uJiwaCNnzW2UhIZuNqxgRnsga
         U7FPzA19O4MZTjk7cUX2A8kKBCMlfjcu0oOI69dZ4b+YRQAP4tmIyws6k/sJELzsK9/s
         WkUOFitu2OhBnuiyLs30TBLtZyAwqDFrchPL6+z0kU7M9AM72kRvTiYizQhbeuHbOYJE
         U3sw==
X-Forwarded-Encrypted: i=1; AJvYcCXRZF1Hlx92usbtlEtf5O2XLIwpMEjADoWtf1jLL1OwGVQdwVFzd8vgVSxFAn2n94S+X3gKsw3hIPD9HJnL7Mb9mVDDzQ==
X-Gm-Message-State: AOJu0YxQtv/Pr3zvYq9b7kE9JAkTTGqkyjjK8JmTZRqdYb8jpa/VJP8t
	dJUBHOnhcNHa/RU0kJnfJW9nkTRKtQqzlycZtnSA5OzDz5JCikfu3mywJgWQjZFHVbd4PROtx9Y
	P9jE0/w==
X-Google-Smtp-Source: AGHT+IHcimSGjtXP/J/UxCh+R6kQfYuW768ba/K0H1tyN90UXsV/9dElbyr75/bcNmmISHcycP36jLk6uHUp
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:3c02:f882:5876:b7ab])
 (user=irogers job=sendgmr) by 2002:a05:690c:338e:b0:608:28cf:3592 with SMTP
 id fl14-20020a05690c338e00b0060828cf3592mr2065532ywb.1.1708486927165; Tue, 20
 Feb 2024 19:42:07 -0800 (PST)
Date: Tue, 20 Feb 2024 19:41:49 -0800
In-Reply-To: <20240221034155.1500118-1-irogers@google.com>
Message-Id: <20240221034155.1500118-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240221034155.1500118-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Subject: [PATCH v6 2/8] perf list: Add scandirat compatibility function
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Athira Jajeev <atrajeev@linux.vnet.ibm.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Yang Jihong <yangjihong1@huawei.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

scandirat is used during the printing of tracepoint events but may be
missing from certain libcs. Add a compatibility implementation that
uses the symlink of an fd in /proc as a path for the reliably present
scandir.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/print-events.c | 13 ++++---------
 tools/perf/util/util.c         | 19 +++++++++++++++++++
 tools/perf/util/util.h         |  8 ++++++++
 3 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/print-events.c b/tools/perf/util/print-events.c
index 9e47712507cc..0dc70b87d609 100644
--- a/tools/perf/util/print-events.c
+++ b/tools/perf/util/print-events.c
@@ -28,6 +28,7 @@
 #include "tracepoint.h"
 #include "pfm.h"
 #include "thread_map.h"
+#include "util.h"
 
 #define MAX_NAME_LEN 100
 
@@ -63,6 +64,8 @@ void print_tracepoint_events(const struct print_callbacks *print_cb __maybe_unus
 {
 	char *events_path = get_tracing_file("events");
 	int events_fd = open(events_path, O_PATH);
+	struct dirent **sys_namelist = NULL;
+	int sys_items;
 
 	put_tracing_file(events_path);
 	if (events_fd < 0) {
@@ -70,10 +73,7 @@ void print_tracepoint_events(const struct print_callbacks *print_cb __maybe_unus
 		return;
 	}
 
-#ifdef HAVE_SCANDIRAT_SUPPORT
-{
-	struct dirent **sys_namelist = NULL;
-	int sys_items = tracing_events__scandir_alphasort(&sys_namelist);
+	sys_items = tracing_events__scandir_alphasort(&sys_namelist);
 
 	for (int i = 0; i < sys_items; i++) {
 		struct dirent *sys_dirent = sys_namelist[i];
@@ -130,11 +130,6 @@ void print_tracepoint_events(const struct print_callbacks *print_cb __maybe_unus
 	}
 
 	free(sys_namelist);
-}
-#else
-	printf("\nWARNING: Your libc doesn't have the scandirat function, please ask its maintainers to implement it.\n"
-	       "         As a rough fallback, please do 'ls %s' to see the available tracepoint events.\n", events_path);
-#endif
 	close(events_fd);
 }
 
diff --git a/tools/perf/util/util.c b/tools/perf/util/util.c
index c1fd9ba6d697..4f561e5e4162 100644
--- a/tools/perf/util/util.c
+++ b/tools/perf/util/util.c
@@ -552,3 +552,22 @@ int sched_getcpu(void)
 	return -1;
 }
 #endif
+
+#ifndef HAVE_SCANDIRAT_SUPPORT
+int scandirat(int dirfd, const char *dirp,
+	      struct dirent ***namelist,
+	      int (*filter)(const struct dirent *),
+	      int (*compar)(const struct dirent **, const struct dirent **))
+{
+	char path[PATH_MAX];
+	int err, fd = openat(dirfd, dirp, O_PATH);
+
+	if (fd < 0)
+		return fd;
+
+	snprintf(path, sizeof(path), "/proc/%d/fd/%d", getpid(), fd);
+	err = scandir(path, namelist, filter, compar);
+	close(fd);
+	return err;
+}
+#endif
diff --git a/tools/perf/util/util.h b/tools/perf/util/util.h
index 7c8915d92dca..9966c21aaf04 100644
--- a/tools/perf/util/util.h
+++ b/tools/perf/util/util.h
@@ -6,6 +6,7 @@
 /* glibc 2.20 deprecates _BSD_SOURCE in favour of _DEFAULT_SOURCE */
 #define _DEFAULT_SOURCE 1
 
+#include <dirent.h>
 #include <fcntl.h>
 #include <stdbool.h>
 #include <stddef.h>
@@ -56,6 +57,13 @@ int perf_tip(char **strp, const char *dirpath);
 int sched_getcpu(void);
 #endif
 
+#ifndef HAVE_SCANDIRAT_SUPPORT
+int scandirat(int dirfd, const char *dirp,
+	      struct dirent ***namelist,
+	      int (*filter)(const struct dirent *),
+	      int (*compar)(const struct dirent **, const struct dirent **));
+#endif
+
 extern bool perf_singlethreaded;
 
 void perf_set_singlethreaded(void);
-- 
2.44.0.rc0.258.g7320e95886-goog

