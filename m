Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1940914A0B6
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 23:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708127719; cv=none; b=gwxz7thYTiAhWAgTP9msdOpMnJXbnRlA27DJ6R1Q8oEZCtTGh4YqLEF/P2Zjyx7dcuYG9NYTmTvjU+z/SrjisMvbyErfQj7s/nwlU+LMi16apzOc/+6zygQlcg2F1p8/C5KaAL5PYvbjkft7/OKtr//Y51Tx75BsbcYQu0tmNhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708127719; c=relaxed/simple;
	bh=mlDvuBmPP3TrmLBy1TVdW9K7nfBnqAONps2iWBo5bv4=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=GbGGREe5y0p1NeH5DjEB2r6PbarjzeZCrO7tLSMR8r419gsl3Rv946TiQgFu4rE/KgRTJUCRqFKE0C2QLss2gCy7WCbg+uonv6kE0rLkVLAxO79tbOOUShpu8SI/caE4FkHX3de30BWO2hkfPOrYxFhufk/e0Np1lOkGHj2yzEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VyKKScZ0; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VyKKScZ0"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dbe9e13775aso3894811276.1
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 15:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708127717; x=1708732517; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5lEV9flhamU87tdGpQxKOQUuN3cEGzsZvh7EhlSuOZU=;
        b=VyKKScZ0odH+ZFwjIyLnhyNaQFRtyh8deZmN8LeeNtRnd/BWc4CuSQ1uw4PHfUUIuY
         T5efgnL+cMJlAtV8EukRT/9w/WjDnZnGLCUv1knQWIdIWxvkWXkoz7iu1vpt0xccnTFt
         9/G+KB7G5tUFWJRH61Cr6WMx5ShBgrbs7ERUNo0tSfRpLa543JZzTzBXTGLDU3gZsbyz
         7UAZJon6+hpgiY51E5ALa6/5UG0CoJCIy3NDoPm93Os2KMGCamcqyU7Lrs2oDD2Sh1ae
         XusIbDBZvX6tWgpZaGw+noH5zwuVffo23ORZm+UEp9S8HJuEjBwXYxzlyI+4AuEf02qL
         0fpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708127717; x=1708732517;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5lEV9flhamU87tdGpQxKOQUuN3cEGzsZvh7EhlSuOZU=;
        b=puyW1Zh1U5A0Y6DT9G75wRPH8BZAAvVJCPmim8mERCvhPvBC+WBrtzUf5FIf0J2gkE
         1/Rrm2tHTY2D/q3ncPfOXEyRa7LxCvrLIxKtOuNfoOlfXeGx/sseqdg9R/Adpfy3DeX2
         MXlvP+mgvM7j33VknJHtTQYHXkypB1eMZcEsHw8RzScnjQMDFOhxPNVoJWN6g7kzgh/L
         TEsqcugGwUGFa28FIgkmPzO7GJr+y942H5FlGbXkOHNcbFBcGZjfwGotyH3o0OFy38I2
         UWRRjDhpl1z2LnIfHxddv2dnDdlMGb2ZoomhTh8aPOP75XaWVqVF/msOJRokk3rO61aH
         Q1Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVoxjkLdx40I1RqX8uyUTHkcBGcS28MrSHJCnpTtLMooET0yG4dLuAIdJ8l+f99+Gc31Equ/OGYrTz48UTKlM4BLfXkJg==
X-Gm-Message-State: AOJu0YzOwMOc2xLfe5ES9wXnNSmwcJoAfpmPcl58GSIbwoo2Z3grZfxc
	T00Ux+aW25GpyS0wEjZloojvXlJqgMCN4Ijd8eX8rq23NXq8hckpXkEwzmfwtY6wa2/nJSen+Zg
	62BdNXQ==
X-Google-Smtp-Source: AGHT+IEUu7ZIc4xVQBBz95yM/6If+AfmIrGt97iohTygKIEoa3vU8cULrj/7pehsYjAaNFO5DYaZGw3d50RX
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4b5c:352:4272:e34e])
 (user=irogers job=sendgmr) by 2002:a25:b20e:0:b0:dc6:ff54:249f with SMTP id
 i14-20020a25b20e000000b00dc6ff54249fmr1454658ybj.8.1708127717121; Fri, 16 Feb
 2024 15:55:17 -0800 (PST)
Date: Fri, 16 Feb 2024 15:51:56 -0800
In-Reply-To: <20240216235203.229256-1-irogers@google.com>
Message-Id: <20240216235203.229256-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240216235203.229256-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Subject: [PATCH v5 2/8] perf list: Add scandirat compatibility function
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
 tools/perf/util/print-events.c | 12 +++---------
 tools/perf/util/util.c         | 19 +++++++++++++++++++
 tools/perf/util/util.h         |  8 ++++++++
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/print-events.c b/tools/perf/util/print-events.c
index 9e47712507cc..bf79dd366e2e 100644
--- a/tools/perf/util/print-events.c
+++ b/tools/perf/util/print-events.c
@@ -63,6 +63,8 @@ void print_tracepoint_events(const struct print_callbacks *print_cb __maybe_unus
 {
 	char *events_path = get_tracing_file("events");
 	int events_fd = open(events_path, O_PATH);
+	struct dirent **sys_namelist = NULL;
+	int sys_items;
 
 	put_tracing_file(events_path);
 	if (events_fd < 0) {
@@ -70,10 +72,7 @@ void print_tracepoint_events(const struct print_callbacks *print_cb __maybe_unus
 		return;
 	}
 
-#ifdef HAVE_SCANDIRAT_SUPPORT
-{
-	struct dirent **sys_namelist = NULL;
-	int sys_items = tracing_events__scandir_alphasort(&sys_namelist);
+	sys_items = tracing_events__scandir_alphasort(&sys_namelist);
 
 	for (int i = 0; i < sys_items; i++) {
 		struct dirent *sys_dirent = sys_namelist[i];
@@ -130,11 +129,6 @@ void print_tracepoint_events(const struct print_callbacks *print_cb __maybe_unus
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

