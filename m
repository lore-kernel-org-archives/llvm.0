Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700150;
	b=kA+qmoT8plMn3d9LN8/t6nrzbvrkQm9uVMxpHrR8cS6+T7NHU14jBHS3xqPO6R5p1qgK
	 iD4+xGSXD3ND3QoA1sselHPsY4+Xx42lHYgMIqFAQCpjHa2X1QRT85B8j4+/cHIPFTtjL
	 N2Ne5mKlnsswoB1EtleT0ZbCbHhgwLT6w34j2J71R0WZteImmvtV5K8NRiLLlosJ3p3z4
	 Y6KB0DGfnbfHiuqw+naiePuQSR5o8FhFZQEj3YRTHFvyZLwyLoUsP0uCsfzVQrMKflk05
	 2DxxWjS1b39FsbJILikE2VURdkfXrJ/KZQ1bXcE1IW/5HZru01SP0JZTVwNsFBZ2vcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2xDkyVwKOR14cu0DSimvn78NCfE/+WZV/F/W5kCR4EI=;
	b=2ssc+jOb7WMpGAzP7IZ/ECq1kAS826nsA5nhyzj8YQR+r1KUeOR+SDrK/QR2kdb3YMjJ
	 LTnMwXCXwHeN/Ile8c8bxV/Y0bDUw+plNSbq5675t2hgI8nmmDONxLrIyWzLaz5nu6n+p
	 9JCm9RAWVufXR0h7Qhe+/KaEVoa9T77FWJ2B9n2T5xNqjegTg5IjYPiEmT6pxrP76Ab6N
	 9dUbXw87sYpBm9umCmtN6PDQcCvxU5I0SsLKfBK2GT5ZdO+vDc6ShMx7UVcfZeJFhTT2/
	 KBqi3d3VTbRaZruO81Ta6/lPgixONa3q9NfMTOfpnFEB46KwtZA1h+o7shkD0hyboVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=S2Z0N6Fq;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8165D60A2616
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 20:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8165D60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=S2Z0N6Fq
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso276369eec.1
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 13:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700149; x=1793304949; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xDkyVwKOR14cu0DSimvn78NCfE/+WZV/F/W5kCR4EI=;
        b=S2Z0N6Fqhl68q8Dfxl9wRDxFciGKAyXAj4qaiZiH7dvAggEljohjFQEWw12AHTGX/h
         ol47FTQCXpRt3t/ukZNyFyDKDwUYHEPn5FSBCV2B92Gqg9nh28BaYLjiB37j0+T7aKoC
         FE+TFyXISsMyHffQkTZ0xiFXGCvfI99R+VyObEoz/EUajcUW6tYKrcToZCz5mEeRc6dG
         8tQUhSk5A6x+XKKMdYijuOd49jKvevE8HxWqcqsWJr0gRvpXjUk37BTdLUWaSoYEnu6a
         nK+x0CPOflPRb2TOWZxFrW6dLSTH4o13W0Qz/Hzs5/8pb6dHqoF0pfyNUIMcieSGPGFD
         BA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700149; x=1793304949;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2xDkyVwKOR14cu0DSimvn78NCfE/+WZV/F/W5kCR4EI=;
        b=j6c9cxC/7vv1vlFlBkpfG+BIQCW4pWTTJ3fi6svrRR/rA+KE5SPz+7TA3Qd8ktTbzI
         RfRHQWafw/gwcyhX58HGKdMocbCYnmzvUgIMmZceIJjk8fV0X29u0OTyUBWB1O6qQ4O5
         dabeqL8KExje8A/KkTnSleHMaXOJn4Y02Um51s3GFJFUUotn+Rz7xdjemihK3XzTjZgx
         goBQXwa+kVIBht9uzhzmeZQAbHX6xXQxBaW4NmYtwNvUO6G13li7dek5Af4AQgXN3SBi
         tXGPuMzWW32pf6WzJWAQ2/ABa3XaKX7tsWQ2lIoFN5VOvRnMkSpH2C3wgJ5CTbLys+eX
         EjOg==
X-Forwarded-Encrypted: i=1; AKwUvBxPKftulTSgdR6EfH2aPScJHtWtcm9kmPeo6ZfvTFX7IWoh92SsW5WT2A7/bI6ukmGwet9M@lists.linux.dev
X-Gm-Message-State: AFq9FYInJlWyCf2nv9j6o5Sdaji4fxXoIYbeNT3N1jl1u7DOkGSWJFHJ
	p20ldtgQ/PpH+ukM1j9zJx4K544GxvgaLOnIlBZJ+AKF9QW7BzOpETEzBromZC7i26Bs8x+yPe5
	GAOqgfWSBYw==
X-Received: from dleb17-n2.prod.google.com ([2002:a05:701b:4251:20b0:15e:225e:ae03])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4559:10b0:15b:7f7a:730d
 with SMTP id a92af1059eb24-195c77a8177mr315037c88.28.1792700148205; Thu, 22
 Oct 2026 13:15:48 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:14:48 -0700
In-Reply-To: <20261022201453.1717523-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261021223905.715051-1-irogers@google.com> <20261022201453.1717523-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261022201453.1717523-16-irogers@google.com>
Subject: [PATCH v8 15/19] perf intel-tpebs: Fix race in tpebs_stop() and
 tpebs_cmd.out fd handling
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, elver@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
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
2.56.0.307.g5fe7bd680c-goog

