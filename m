Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602729;
	b=twi8glTdiZdcjOhE2f/D3UZqyo7XzQckBMchuXgY8vIDcbIlqnf5fIdlWVDOV10qHhIq
	 w9g7a7kHFPrV9LM+6dyjZvVK8PqY21Sapjlmk8Yhb8XBoKb+zryRx4qUOzlV2N8vYwx1O
	 g3kEZCGxSM01HGbPVH3G8Gyn7YPmWuyApMNrOL1apyO3coJ3f0V413mld+HypznX6uFY4
	 dlzMyEAqXKpXPgCwe1T62mzAQfcsGwYczMIAVunxALDkXgGc9u8fuO1rd3B8ovfzA01y4
	 pFRHL4jFUzr/hA5FOoTNMaooTTMoxke38MboRw8cpj+V2NIwF8Y5hMXibBBI8tJSycw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=v2rrXS1ate7b8OOQCuZc5vd/vkFrx7oPEHSNFj+/YLY=;
	b=epWMvdkmkyMBamZ5YCLZguXvx2fZgKys3mgfuCZ3Er+RPLhDxtIb2eZMSjeQ1BZtBmSs
	 D3tRxLBJMyJ62bp5nJ2VEHZl1v1wfG8qzXywXH4zAX9TcqBNJCngjMhk0MVWnirAJ/OJW
	 4rDeCda33me/nqon+PgaT7olxFPBP5lLdt7WbQx6iWdKpyMcMuOBaInmMBRfB9F7JDCI+
	 bagmM/WQ8pzfnjb36VEE6LXyNQ2Hnq7Ahb04Bj8uoI7ygTdF3QqiccB0NXXs80X5in0fC
	 +pCE4N7esTey0Tpzj0kzAjur56qYHRhLY2GtF5Q9pxDbYIeBSRUFOqlmxpnVmRqZTzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FjnnzCsH;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDAD60A3826
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 17:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDDAD60A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FjnnzCsH
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so2222279eec.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 10:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602728; x=1793207528; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2rrXS1ate7b8OOQCuZc5vd/vkFrx7oPEHSNFj+/YLY=;
        b=FjnnzCsHV2JdprxXOeQ18D9vQPGzlUJODM8yRWHkVmxOQCmgqRvvo58Iz78D1iXbOt
         c/PNK5H+Bz4B3DWKeX9gkuHV7p8nKO+RjrAiKTGCj8cG4ySdXGCZllzovtRea8Mp+1AW
         WuATYXPNe5W7k7Xd8WxAV3TJlBhF62Y+kaOP6bw9rDG2DUYCe6pzgmW9gNvelo3r9hHm
         CnPSEYRWZmoKlMUQPmNtN+yRWN++iuRLjunthQttMVE195ZzTbHM+ikj05ISmtj3CTya
         9N8k3qo8kbiam6hDmacrnPrUO+IVG+HcFLJqLv2oTCBkxyPH+GwoLDJOANV1RIjjIg9L
         dnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602728; x=1793207528;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2rrXS1ate7b8OOQCuZc5vd/vkFrx7oPEHSNFj+/YLY=;
        b=At9sV3+NrpOobc3RVfr6m9smYFU1BLCHhoPk/L57FcYKSy86iuOoTvnolUIs1mKhwN
         8FKlA+ZDz5KLKUJWDhxnSZNq+Ltj9MXjSsUGGZN96MtPxkPM3whK60HYBmEDRMqvXxGY
         MqNLHVCAlpy20DNwIxSmoFBeOe9f/y4FlECe50LJAM2FI8Snvj2LD5GW8+Aj9yB2deEt
         ZkbVe0HSUct6MD8d9k8gO9bmLJwYw61K7JhJ5Zsja9ApH100GQiPXZa2DObYbiUlbOXE
         Uo8ADAsIWKn7FzOS0nEMaJwDRXZQO6sb6EPlpkK2MpCCcc2EekeDTFSonxPLa+/YY566
         6ckQ==
X-Forwarded-Encrypted: i=1; AKwUvByRv29YoLpB7uG0GyH7Z2T6sxRqVsBiyoY3ubaUgFoUKJigS8EGRz/UxIczg2UyNp4+P1qk@lists.linux.dev
X-Gm-Message-State: AFq9FYJfEoENGmFHIOTefatEmt4nBI0WYYPWBhkGvAcaCp4My7XCe/p9
	mJaa3qgvayoqmmMpzgbgn0mP1Nd+BodTRbcM3gzBvkWsOUNUDm4Mmc6sUhGb1WjdLnTAI64Ua2e
	X5ItXYc7+RQ==
X-Received: from dydr17.prod.google.com ([2002:a05:7300:50f1:b0:366:5b79:cc98])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:32cd:b0:35d:e0da:ad2d
 with SMTP id 5a478bee46e88-3674cf378ddmr4074485eec.17.1792602727439; Wed, 21
 Oct 2026 10:12:07 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:39 -0700
In-Reply-To: <20261021171044.155240-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261020163640.746159-1-irogers@google.com> <20261021171044.155240-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021171044.155240-14-irogers@google.com>
Subject: [PATCH v6 13/17] perf intel-tpebs: Fix race in tpebs_stop() and
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
by perf_session__delete(). Also reset tpebs_cmd.pid = 0 and tpebs_cmd.out = -1 and return early if
start_command() fails in evsel__tpebs_start_perf_record(), as
start_command() closes the pipe internally and may leave cmd->pid = -1
on error, and join tpebs_reader_thread on error in evsel__tpebs_open()
if it was already started.

Include <pthread.h>, <signal.h>, <stdint.h>, <stdlib.h>, <string.h>, and
<unistd.h> explicitly.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 51 ++++++++++++++++++++++++++++++-----
 1 file changed, 44 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 7c0b8b15bd10..47c939fc2058 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -27,6 +27,12 @@
 #include <errno.h>
 #include <poll.h>
 #include <math.h>
+#include <pthread.h>
+#include <signal.h>
+#include <stdint.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
 
 #define PERF_DATA		"-"
 
@@ -120,10 +126,15 @@ static int evsel__tpebs_start_perf_record(struct evsel *evsel)
 	tpebs_cmd.out = -1;
 	ret = start_command(&tpebs_cmd);
 	zfree(&tpebs_cmd.argv);
+	if (ret) {
+		tpebs_cmd.pid = 0;
+		tpebs_cmd.out = -1;
+		return ret;
+	}
 	list_for_each_entry(t, &tpebs_results, nd)
 		t->started = true;
 
-	return ret;
+	return 0;
 }
 
 static bool is_child_pid(pid_t parent, pid_t child)
@@ -220,13 +231,13 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
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
 
@@ -236,8 +247,10 @@ static void *__sample_reader(void *arg __maybe_unused)
 	tool.attr = perf_event__process_attr;
 
 	session = perf_session__new(&data, &tool);
-	if (IS_ERR(session))
+	if (IS_ERR(session)) {
+		close(data.file.fd);
 		return NULL;
+	}
 	perf_session__process_events(session);
 	perf_session__delete(session);
 
@@ -331,12 +344,19 @@ static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
 	/* Like tpebs_start, we should only run tpebs_end once. */
 	if (tpebs_cmd.pid != 0) {
 		pid_t actual_pid = tpebs_cmd.pid;
+		pthread_t reader_thread;
 
 		tpebs_stopping = true;
 		tpebs_send_record_cmd(EVLIST_CTL_CMD_STOP_TAG);
+		/*
+		 * tpebs_results is empty when stopping; clear pid so
+		 * process_sample_event() ignores any late samples while
+		 * draining the pipe.
+		 */
 		tpebs_cmd.pid = 0;
+		reader_thread = tpebs_reader_thread;
 		mutex_unlock(tpebs_mtx_get());
-		pthread_join(tpebs_reader_thread, NULL);
+		pthread_join(reader_thread, NULL);
 		mutex_lock(tpebs_mtx_get());
 		if (control_fd[0] >= 0) {
 			close(control_fd[0]);
@@ -515,6 +535,7 @@ int evsel__tpebs_open(struct evsel *evsel)
 	int ret;
 	bool tpebs_empty;
 	bool started_process = false;
+	bool started_thread = false;
 
 	/* We should only run tpebs_start when tpebs_recording is enabled. */
 	if (!tpebs_recording)
@@ -567,12 +588,15 @@ int evsel__tpebs_open(struct evsel *evsel)
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
+		started_thread = true;
 		ret = tpebs_send_record_cmd(EVLIST_CTL_CMD_ENABLE_TAG);
 	}
 out:
@@ -586,9 +610,22 @@ int evsel__tpebs_open(struct evsel *evsel)
 
 		if (started_process) {
 			if (tpebs_cmd.pid > 0) {
-				kill(tpebs_cmd.pid, SIGTERM);
+				pid_t actual_pid = tpebs_cmd.pid;
+
+				tpebs_stopping = true;
+				kill(actual_pid, SIGTERM);
+				tpebs_cmd.pid = 0;
+				if (started_thread) {
+					pthread_t reader_thread = tpebs_reader_thread;
+
+					mutex_unlock(tpebs_mtx_get());
+					pthread_join(reader_thread, NULL);
+					mutex_lock(tpebs_mtx_get());
+				}
+				tpebs_cmd.pid = actual_pid;
 				finish_command(&tpebs_cmd);
 				tpebs_cmd.pid = 0;
+				tpebs_stopping = false;
 			}
 			if (tpebs_cmd.out >= 0) {
 				close(tpebs_cmd.out);
-- 
2.56.0.218.g1ec904b173-goog

