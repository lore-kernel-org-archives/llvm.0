Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE4610A28
	for <llvm@lists.linux.dev>; Wed, 14 Feb 2024 04:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707886478; cv=none; b=sf6DCEIe7uiLy71WkfexKJuaZs1uNfVWVirbH7mGCCWhn8y9MS6yAhtM9KNKUSBPPi2r72uAmA/b+68TZaHeYo5K40efeRBYxBcZU/tPbp1YSa/S/ET/HABhfHDtOOv0BrEt8qvVSBrCKMIUucSWUQaraOUj+Ro5fzgQDEHOKjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707886478; c=relaxed/simple;
	bh=NhiwdSNsgGhanFThf3Y8+0MhiUWCknICtVTm6IyvRmw=;
	h=Date:In-Reply-To:Message-Id:Mime-Version:References:Subject:From:
	 To:Content-Type; b=TAaxskLtKMsEGgjIOXEIwKqsrSnWjPh/YbR8TP9B03LEGKsoIXQ+Ujg1Ly4wiRrhNqWa/XZYHZxSi2myjYg0cODWL3XTfm9abYYy9CAgRFnz0ovqT2Bae8GXu8mLY/NBYROBKxQN6CPNsONjKt/usKymneeJ7UaVI8nYZ0AWGjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vnoC1d4g; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vnoC1d4g"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6077e9dd249so25754337b3.3
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 20:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707886476; x=1708491276; darn=lists.linux.dev;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YmSZNQ356QtM9WesWCMinXmK9k2yULQ13GYKx7NLJhc=;
        b=vnoC1d4ge+VlY7KjZSjBSQuOgiYw8ikylLA2qE889x4opjOnKULv9HqfvNNQJrw7Hl
         LwQEhjwfs2T1jQ+M/ijbJrUM75CVghbz1fhhY9TE1GntO+6c8+Blg8U0MgbEqSZdI53+
         Z8ttvi9+KT3g5xn7s3RBSTZQgnOFZWVJPJehXtuVHNDf0I2icRjaRnJ7KVkPcLLZHgI0
         CaEUiPIxpF/YvaQjIhKHqxWTQNl+jgOdKhEOvfbrwwgsMIKuNVdsdhH/TW0h2fMV+TBg
         PWQCCbVvPYx0zDN2gpuLjU4KoecHh6DFqXF197eO6IDdM+o9SdcKZpDezwYQPfBfF8gV
         4htA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707886476; x=1708491276;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmSZNQ356QtM9WesWCMinXmK9k2yULQ13GYKx7NLJhc=;
        b=iknA7S+ziAw1sRTRdyP7JHSyVDo4a+WgqGSjcSDiuksxeB9G/o6eZ6I7Z5dPk4EkfR
         i1AuBSlFZPW6xue/03D9YkLxejXQUJdHOfRbFp3YfjYSmfMhdQl5jfHtfRQJiG17k9QD
         Pwa7SJqLsJhhkKdjQ0bTuLOKqKT+Auq0bt8jWzkrbEL78lomnoMGabB3Ok9mCA69TsFN
         PfTUmhtks2kW6aqpiC1KKMU2vSZUNia06O0Fk1Fuc15pN2nGbTLT+ocFd6Vk+g280TEu
         +E/5BhCrIMTV59UkMCA8aqQKnlh3Og4wTPtd9bwaC7xaO7LC7nfCvTx/Kdppj/lXhN8D
         1Kvg==
X-Forwarded-Encrypted: i=1; AJvYcCUImof7E34NbgpNDSnzUpQMNDSBes9aqyvAH1gu6E9UFre2NQwk4eX578XI7m7uVZa1RLpLfCNubddVPB7n3LlE5c/wWA==
X-Gm-Message-State: AOJu0Ywvv4XB0dsc0oyoiBPc6He/IPOf8yBt2Z2rfob0VZrSdAloIdMg
	JoAV5JVfPP5XyhV0YnNes6FkY4GnaDBflmckw7sq5V/jlzX9Ndp4m+5tgt1hbvGGfW4GZtSnAiA
	WqvdqMg==
X-Google-Smtp-Source: AGHT+IEFuvHaqaekRipzgHS56dLK9shPHnKIKYxXCRw4dh0QDC9cp+ued3K17AtYGH6E73IBBe9HedDMpOlG
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:6d92:85eb:9adc:66dd])
 (user=irogers job=sendgmr) by 2002:a0d:eb15:0:b0:602:b7ce:f382 with SMTP id
 u21-20020a0deb15000000b00602b7cef382mr240294ywe.7.1707886476058; Tue, 13 Feb
 2024 20:54:36 -0800 (PST)
Date: Tue, 13 Feb 2024 20:53:50 -0800
In-Reply-To: <20240214045356.748330-1-irogers@google.com>
Message-Id: <20240214045356.748330-3-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240214045356.748330-1-irogers@google.com>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Subject: [PATCH v4 2/8] perf list: Add scandirat compatibility function
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	James Clark <james.clark@arm.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
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
2.43.0.687.g38aa6559b0-goog

