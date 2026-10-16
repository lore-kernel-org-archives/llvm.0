Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1C9598BF5
	for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 17:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792171915; cv=none; b=lguYcyZ/UFCZuv+wEnOcZwCGD2E6Kw6IYBUVfHh90AjmFRQxi4NrUSc1q0GzoRXpgegkCaSzp3u5zQFmohpC2eJLFaUf2LFdeF39eH8XH01rAS8bih1t3fpJOkuct1Tu50Z7W092UgRhpvwNHQVX7fNfSNGRHvcmY5NB3HfJ6OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792171915; c=relaxed/simple;
	bh=lXDicjRb52fj+rMBHlcsZH2YE6FpOO8swAccPqHksxQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dz3oR6hOUATHz5bdhjshHVd1weAd33I4EYQkdIdMD+D2/I8EdxBECq0yCRzlXStItp+9bYHOEc/G4dns/MyHh4CDOL8PNp+LCIH5qX/2P/Slx3H5+W2o6oLi/jdPb/A5ekHOGwGsTkvHCnZpj9+zCIA784gkKSgEFEfJP9H/j9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wGMZDo6j; arc=none smtp.client-ip=74.125.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wGMZDo6j"
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1663fb7e005so130381c88.0
        for <llvm@lists.linux.dev>; Fri, 16 Oct 2026 10:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792171913; x=1792776713; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tGQDYuEhDc78TImgQ32YcWadll//nwsG33eLqYi4wFU=;
        b=wGMZDo6jDpAOd/tfZtEQsJ4iinvljLXFNS9biUF4UQdiETFL3r1DHmyq2A+1TtSzKa
         PStkRqMUjMAR+NLhE+0VivhHEyTZVTb4zoPApd+Peu7StjjlrmSkscpy/kZo9+x/rwqx
         8gcSjx/74xpWGleHBlgvQYqWUFSGHVEiAR+qErqhUDZIey/lA4VVzayNijPmYo+ZBPnS
         Ugl1Rbl4pDvWO+GVV5B5dXP/+iCKBj9y/enKm5mTZjo1BAiKOnytQ7Co/4TS+GZ07lqL
         4tzfpsL7jkEJmOxO72fbU8bLSgOOf3vxjIDn4jfdqbtJwl8+VmwtPP3uhPGXD+5lXb86
         iPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792171913; x=1792776713;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tGQDYuEhDc78TImgQ32YcWadll//nwsG33eLqYi4wFU=;
        b=12p/ZgDyMFKaeND/m646ljutzcaA2UrzduAZrVYdFg07kaBwGhS0KP+Kp4LipINKmu
         a+DU9gwzuNHQUjwwbas/Rq2XyH+kFIpdsuEowSPjr62Xl/X0X1/nXsjfR5C+jIAi+4TT
         ytRwBno9u/Tkpl09TIs+0KDH9RCTN9OqZJT4a/5UmX8SecabDc3bVd+qHuM9e4QB8Opt
         UyU0NXwV+hqz6ZYoo6cYq3Pr3TXDLKSIXao6UqcBd/l1hl4bt9sCdvvudxfZy1AHodJT
         1536v9iqMufS2SWTK1VdCj29tTPJXmFLYexPlVbi25oCK4ozkqXRUNdb/uYMMA8eOyyM
         H2iA==
X-Forwarded-Encrypted: i=1; AKwUvBxsk4/yvTv9STvs2xh4CVk2n4qntv50WDTH10oYbvuuP887KEFnGIm2oG6cTA+GbkO7Ov3n@lists.linux.dev
X-Gm-Message-State: AFq9FYLECLcB0c5lj2V+SCyhQXL7+fqK+gZOH9CI8j3DyT3OCKo/a5bP
	wnNQzJQ6c3DnJpTtRDf2wdNbjYBiSxq7IZM66B+z4f3XG7DzdrSU4hRBzBYNTWw860D2Dajtn05
	EdPdofMxRcA==
X-Received: from dlbrd12.prod.google.com ([2002:a05:7022:f10c:b0:16d:1d8b:2ef4])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7023:a4c:b0:144:fdf0:9d91
 with SMTP id a92af1059eb24-1851285de14mr637107c88.24.1792171912882; Fri, 16
 Oct 2026 10:31:52 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:31:02 -0700
In-Reply-To: <20261016173106.679725-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261013222622.1822619-1-irogers@google.com> <20261016173106.679725-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261016173106.679725-14-irogers@google.com>
Subject: [PATCH v3 13/17] perf intel-tpebs: Fix race in tpebs_stop() and
 tpebs_cmd.out fd handling
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In tpebs_stop(), read tpebs_reader_thread into a local variable before
releasing tpebs_mtx to call pthread_join().

Transfer ownership of tpebs_cmd.out to __sample_reader() by passing it as
the thread argument and setting tpebs_cmd.out = -1 in
evsel__tpebs_open() so tpebs_stop() does not double-close the fd closed
by perf_session__delete(). Also reset tpebs_cmd.out = -1 if
start_command() fails in evsel__tpebs_start_perf_record(), as
start_command() closes the pipe internally on error without resetting
cmd->out.

Include <stdint.h>, <stdlib.h>, <string.h>, and <unistd.h> explicitly for
intptr_t, close(), read(), write(), malloc(), and strlen().

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 7c0b8b15bd10..b81831f5e5a4 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -27,6 +27,10 @@
 #include <errno.h>
 #include <poll.h>
 #include <math.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
 
 #define PERF_DATA		"-"
 
@@ -119,6 +123,8 @@ static int evsel__tpebs_start_perf_record(struct evsel *evsel)
 	tpebs_cmd.argv = record_argv;
 	tpebs_cmd.out = -1;
 	ret = start_command(&tpebs_cmd);
+	if (ret)
+		tpebs_cmd.out = -1;
 	zfree(&tpebs_cmd.argv);
 	list_for_each_entry(t, &tpebs_results, nd)
 		t->started = true;
@@ -220,13 +226,13 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 	return 0;
 }
 
-static void *__sample_reader(void *arg __maybe_unused)
+static void *__sample_reader(void *arg)
 {
 	struct perf_session *session;
 	struct perf_data data = {
 		.mode = PERF_DATA_MODE_READ,
 		.path = PERF_DATA,
-		.file.fd = tpebs_cmd.out,
+		.file.fd = (int)(intptr_t)arg,
 	};
 	struct perf_tool tool;
 
@@ -236,8 +242,10 @@ static void *__sample_reader(void *arg __maybe_unused)
 	tool.attr = perf_event__process_attr;
 
 	session = perf_session__new(&data, &tool);
-	if (IS_ERR(session))
+	if (IS_ERR(session)) {
+		close(data.file.fd);
 		return NULL;
+	}
 	perf_session__process_events(session);
 	perf_session__delete(session);
 
@@ -331,12 +339,14 @@ static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
 	/* Like tpebs_start, we should only run tpebs_end once. */
 	if (tpebs_cmd.pid != 0) {
 		pid_t actual_pid = tpebs_cmd.pid;
+		pthread_t reader_thread;
 
 		tpebs_stopping = true;
 		tpebs_send_record_cmd(EVLIST_CTL_CMD_STOP_TAG);
 		tpebs_cmd.pid = 0;
+		reader_thread = tpebs_reader_thread;
 		mutex_unlock(tpebs_mtx_get());
-		pthread_join(tpebs_reader_thread, NULL);
+		pthread_join(reader_thread, NULL);
 		mutex_lock(tpebs_mtx_get());
 		if (control_fd[0] >= 0) {
 			close(control_fd[0]);
@@ -567,12 +577,14 @@ int evsel__tpebs_open(struct evsel *evsel)
 			goto out;
 
 		if (pthread_create(&tpebs_reader_thread, /*attr=*/NULL, __sample_reader,
-				   /*arg=*/NULL)) {
+				   (void *)(intptr_t)tpebs_cmd.out)) {
 			kill(tpebs_cmd.pid, SIGTERM);
 			pr_err("Could not create thread to process sample data.\n");
 			ret = -1;
 			goto out;
 		}
+		/* __sample_reader now owns and closes the output fd. */
+		tpebs_cmd.out = -1;
 		ret = tpebs_send_record_cmd(EVLIST_CTL_CMD_ENABLE_TAG);
 	}
 out:
-- 
2.56.0.212.g129ede20d9-goog

