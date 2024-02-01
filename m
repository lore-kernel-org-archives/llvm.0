Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9C5652
	for <llvm@lists.linux.dev>; Thu,  1 Feb 2024 00:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706746526; cv=none; b=azNIHa9/xivju15OtZaEL/pfdTT3YRf3gJ/FAJAB0j4FeJnrL3uVvhHGov+kiAt9yFZDAq9iI893cyJC8GEpvgjB017yTdmhza+DbqyCGv7GbNzzIztvE6E3UR118mIB/1wvYt+SDPybfa2DF+gmE784A2HbnusXBfEX1nYnOyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706746526; c=relaxed/simple;
	bh=6ZpLBuInMEOZtrqrEBa7yzNG4a6Xjz6IF3cCBjCdIOc=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=YvVhHtd7001IUPNkye4kAWE5nYBNDgfHz2ZcNEZ0PTodC6eWYkRf2Fbta6SEuR05ILQNr0O1NqT6namwCICi3De3dx+Rcw7/oy9ydzIe5J7bbKn7i9Lz2Pn1SXsMR+50w8wcm7onyaKoqv8uLeBb6v42enpmTNexAdHN6M5jBHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aqcSkHSn; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aqcSkHSn"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc6cd10fd4aso543274276.1
        for <llvm@lists.linux.dev>; Wed, 31 Jan 2024 16:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706746523; x=1707351323; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aRy9RhZw5CJlB7gMEzQb2ZjhFzzNCUTS7Rkwtu2S9w4=;
        b=aqcSkHSncu8tQjKSQAsvmSFktcI/sRQ3rZazfPtUAQM+5ZghEP/JOqyi/MydoaXEQT
         ZH6OtxyFh4fZu3Y/ECzbFATWo+7Q7ERGHTh89KAu48MuwWE47En+vqaTokViv9J2JIt0
         0F2R52w01MalrzChG6RmQ169W/cRM4CzgSyrrXloinsqtZfPEwp3j+oiuzPl5OUaDY3Q
         1G6F7ZISR9mhth5CmS627RG1mABcAzHL7pWdVIECm4A9RmQ6+n8d7cCuusSpG2/9bq3p
         SwwiPYch1XfHGB9IrIl75pw38Pishm+ql/2n85HB/UGlD8Q3cCgfXQPgRwejBLKZxnZx
         2XMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706746523; x=1707351323;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aRy9RhZw5CJlB7gMEzQb2ZjhFzzNCUTS7Rkwtu2S9w4=;
        b=sMaVI8exp2RE2c87wtD+UC7SLG28X65TpBZmm54VJi/d1ZNhSSe5NG6rSQaXEkbk23
         ASaTQqbagQTsxBz0Swbv5DkfwKWe20342uKpxZqpH/ZxXDdHH2Lzf3tNE4yZpb/wmRUV
         j2zbiCM7MZlWqZH5ZEXn/9hQFPBjAiJI/COozpCiGdE+xxXU/2VQ3R+dTvpIL3lXuXwV
         p3o2TCyI7LJAxcYTtRCW9ocE21YEIjNxLM5v0KfQaELgZQvzQ0dR21ZQvvJoszzu/moy
         QCi79AOJGkhtXFcMqcCWwzh8yM6duoQ923hkrQWqlCaQJFvAyyhgCTHZYLyHbOE8u3vY
         tZkA==
X-Gm-Message-State: AOJu0YxJ09DS+UBwYjaHTXOSePrRYEV1aAP0uwMJSUU4eLfCbCqTLfAb
	7sV3dHgdBpWKD1XHFq7Zbn7dIk6S3yqevAcVEPuHmpGEem2uUu+OclDbZ9Z/I+GQlSCLlwzuvxI
	c0ygghQ==
X-Google-Smtp-Source: AGHT+IGLIq2YuQ/OgkyczLRajvjeinn9zrh3SgHDApPkGJzViTczB9IY1di1E2HUB+kFYLDLxXTkq1FuEVBS
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:16c5:1feb:bf99:a5d1])
 (user=irogers job=sendgmr) by 2002:a05:6902:2702:b0:dc6:c623:ce6f with SMTP
 id dz2-20020a056902270200b00dc6c623ce6fmr27336ybb.13.1706746523485; Wed, 31
 Jan 2024 16:15:23 -0800 (PST)
Date: Wed, 31 Jan 2024 16:14:56 -0800
In-Reply-To: <20240201001504.1348511-1-irogers@google.com>
Message-Id: <20240201001504.1348511-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240201001504.1348511-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Subject: [PATCH v2 2/9] perf list: Add scandirat compatibility function
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
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
index b0fc48be623f..15ec55b07bfd 100644
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
2.43.0.429.g432eaa2c6b-goog

