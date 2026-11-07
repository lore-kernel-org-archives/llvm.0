Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794026500;
	b=hbmG/GjoRTQeM1SdgPhSAyqB9xgAk9rO+CRyv3z34Kp+Jn8JRUqa1l9DOddjl7SjA0D1
	 TxdNX+M25nl3Z3JCiFNo7mDg9r31LvVBbSA8F2wqIXCVyURdKRGHcZ6wQK+PeJv+G8gJp
	 yR9XkrtuzfmXHaC9KcPv6g83UtUnhnztrUT256vbuQmmiz5kWZtFHnCKfEguSWuKCce3i
	 BjQfbHkHo60g+iq7PY6DF2T3no9RjlkyyWNGrb9wqoI3RtOk53T0qD7B+gmR7USa9xTn0
	 7+RoDk/RfYHKEoQDL6HmSL7E4Ef4b1AfBGL7JDPMoRPwUZv+qu2pzAFhwYWRMCqNSOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794026500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=s4C6VSkUsKcA/XReA8X+gTc8wqynE+fYe31cERcc+sQ=;
	b=GVe5BOkKD3sUlhwqfBZwJXqXbtNqU91Wmy0A4RaIL2OG6Dz/5Bkv2n+l8u2zdBbdChe/
	 yN0mg41QxddQ4KOtlObJSvUw5X4pTPbm5iikJPZyKAe2Zwadl27B5NjLA884S8gaJ9qG7
	 a/t9XmmdZ9fk8ERP34TZgRWcAybHmoZoX2vy2eUTCgTwKGvh+JYFzFngFzfT3z80WELy1
	 cXqJiC5d0x3Pa3m4cqKiTw0UWlPAojx1LFRWA37tdOJurc00luWMf0S5DXZGVeLHlpbV3
	 l6l200hgXWgWFn16KFVJJ230BnHcjb4jTcvCIzg9zaYCcoWlE9Xy6Z9UjShTf0cwGxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zh3N1tDz;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432A3606D832
	for <llvm@lists.linux.dev>; Sat,  7 Nov 2026 04:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 432A3606D832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Zh3N1tDz
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36fa5673fccso3166634eec.1
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 20:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794026499; x=1794631299; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4C6VSkUsKcA/XReA8X+gTc8wqynE+fYe31cERcc+sQ=;
        b=Zh3N1tDzQ7THSLfLfMfDQ/dqe3cdfqyUg7VzzYkqCSQHtzN2udkDd8Mkbo49O2AGVd
         89mHlKqAf54c9lGxXJVybYB0p/Hy//+MMjQXY2M5TWBtIpLdaGCSF7zlKnlt9Ly/XIOb
         LnOOmAJgT/SJ8y8Rxhse7UMBPuFU0weHWvShhaGoZE+x1ahMZpw/R49TGgCpJfasDrlj
         UF5rhQKF3MHjBijO5xPU6G4+hRHnjPkpRZ+3lJ1RAvfj+6LbHe+wpmH5vVDOY+oJUJER
         Pk/40DMaCoiWDor6tL2BgSyKWnN+PSaMOFVhZ4eudyaK3ZEBKCHZOwfdklbTdw2beLn2
         FsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794026499; x=1794631299;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4C6VSkUsKcA/XReA8X+gTc8wqynE+fYe31cERcc+sQ=;
        b=ZrJInoLryhRUnapUVMmAKrClQgVMCuN4fF3uforF1ZwtITjsJ47sHzJDKN7mJY3y1X
         ZAFne70F6fs8OkGOntz7X96VTZYcCZ8gzahvq57ktgPZiD4evI9NWEL3T1LtO6AQ3z9C
         MXc3yGnz9ZOJqy+JihwStDUb9mr/SNj8pcK16vGN5ks3sYZElB5LG7N/JOCYgy0if02j
         +Mxxm3JKZU+mlfdV9x8LfgzFrpmVcOE+eAEMF2bD/8Z6KuBYJ8HxWvYqqxVJGEhhbLiK
         8/r39Bm6baulREYqI+L+ZUdQbEIA5o3flEjET8qzbOVFpGmBJ3GP4mcBWHFVQiWCg79O
         oYDw==
X-Forwarded-Encrypted: i=1; AL+hErFKPPhGVRj0esPQLLBVOpOTwq3Mt+6XWKddwSfk9HDpG+1P+chhmnQEbCjC7SwLEn3Dicle@lists.linux.dev
X-Gm-Message-State: APuU4Z8LMF7YNXkpLmf4Wg5ZIFe3XLvt8vXlzyICqMT6pefbHeiPYv6q
	awEkxvBmALT6+sRa3JlSeW/CJmGKUSuoOfmRGgGe0oVt8dfRl4xM+qhUm7vP6zSQ9m7d1xPcqfA
	FLna79cyGyQ==
X-Received: from dycmb1-n1.prod.google.com ([2002:a05:693c:20c1:10b0:35f:390d:248a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:6096:b0:36a:1d6a:596b
 with SMTP id 5a478bee46e88-36f77200d2dmr7725330eec.29.1794026499136; Fri, 06
 Nov 2026 20:41:39 -0800 (PST)
Date: Fri,  6 Nov 2026 20:40:56 -0800
In-Reply-To: <20261107044102.1506626-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261107044102.1506626-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261107044102.1506626-16-irogers@google.com>
Subject: [PATCH v11 15/20] perf intel-tpebs: Fix race in tpebs_stop() and
 tpebs_cmd.out fd handling
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

In tpebs_stop(), read tpebs_reader_thread into a local variable before
releasing tpebs_mtx to call pthread_join().

Transfer ownership of tpebs_cmd.out to __sample_reader() by passing it
as the thread argument and setting tpebs_cmd.out = -1 in
evsel__tpebs_open() so tpebs_stop() does not double-close the fd closed
by perf_session__delete(). Also reset tpebs_cmd.pid = 0 and
tpebs_cmd.out = -1 and return early if start_command() fails in
evsel__tpebs_start_perf_record(), as start_command() closes the pipe
internally and may leave cmd->pid = -1 on error.

Serialize tpebs_send_record_cmd() with teardown via tpebs_cmd_in_flight
and tpebs_cmd_cond, check check_if_command_finished(&tpebs_cmd) under
tpebs_mtx only when not stopping, and guard evsel__tpebs_open() against
a concurrent tpebs_stop() with a generation counter (tpebs_gen) and
tpebs_stopping across closing the fds and finish_command().

Include <pthread.h>, <signal.h>, <stdint.h>, <stdlib.h>, <string.h>, and
<unistd.h> explicitly.

Fixes: 8db5cabcf1b6 ("perf stat: Fork and launch 'perf record' when 'perf stat' needs to get retire latency value for a metric.")
Fixes: bded0398ac19 ("perf tpebs: Fix concurrent stop races and PID reuse hazards in tpebs_stop")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 121 +++++++++++++++++++++++++++++-----
 1 file changed, 104 insertions(+), 17 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 7c0b8b15bd10..4b7464cfa0eb 100644
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
 
@@ -37,7 +43,10 @@ static pthread_t tpebs_reader_thread;
 static struct child_process tpebs_cmd;
 static int control_fd[2], ack_fd[2];
 static struct mutex tpebs_mtx;
+static struct cond tpebs_cmd_cond = { .cond = PTHREAD_COND_INITIALIZER };
 static bool tpebs_stopping;
+static bool tpebs_cmd_in_flight;
+static uint64_t tpebs_gen;
 
 struct tpebs_retire_lat {
 	struct list_head nd;
@@ -120,10 +129,15 @@ static int evsel__tpebs_start_perf_record(struct evsel *evsel)
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
@@ -220,13 +234,13 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
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
 
@@ -236,8 +250,10 @@ static void *__sample_reader(void *arg __maybe_unused)
 	tool.attr = perf_event__process_attr;
 
 	session = perf_session__new(&data, &tool);
-	if (IS_ERR(session))
+	if (IS_ERR(session)) {
+		close(data.file.fd);
 		return NULL;
+	}
 	perf_session__process_events(session);
 	perf_session__delete(session);
 
@@ -247,13 +263,26 @@ static void *__sample_reader(void *arg __maybe_unused)
 static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 {
 	struct pollfd pollfd = { .events = POLLIN, };
-	int ret, len, retries = 0;
+	bool is_stop = !strcmp(msg, EVLIST_CTL_CMD_STOP_TAG);
+	int ret, len, retries = 0, ctrl_fd, resp_fd;
 	char ack_buf[8];
 
+	while (tpebs_cmd_in_flight) {
+		if (!is_stop && tpebs_stopping)
+			return -EBUSY;
+		cond_wait(&tpebs_cmd_cond, tpebs_mtx_get());
+	}
+	if (!is_stop && tpebs_stopping)
+		return -EBUSY;
+
 	/* Check if the command exited before the send, done with the lock held. */
 	if (tpebs_cmd.pid == 0)
 		return 0;
 
+	ctrl_fd = control_fd[1];
+	resp_fd = ack_fd[0];
+	tpebs_cmd_in_flight = true;
+
 	/*
 	 * Let go of the lock while sending/receiving as blocking can starve the
 	 * sample reading thread.
@@ -262,20 +291,20 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 
 	/* Send perf record command.*/
 	len = strlen(msg);
-	ret = write(control_fd[1], msg, len);
+	ret = write(ctrl_fd, msg, len);
 	if (ret != len) {
 		pr_err("perf record control write control message '%s' failed\n", msg);
 		ret = -EPIPE;
 		goto out;
 	}
 
-	if (!strcmp(msg, EVLIST_CTL_CMD_STOP_TAG)) {
+	if (is_stop) {
 		ret = 0;
 		goto out;
 	}
 
 	/* Wait for an ack. */
-	pollfd.fd = ack_fd[0];
+	pollfd.fd = resp_fd;
 
 	/*
 	 * We need this poll to ensure the ack_fd PIPE will not hang
@@ -284,7 +313,17 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 	 */
 again:
 	if (!poll(&pollfd, 1, 500)) {
-		if (check_if_command_finished(&tpebs_cmd)) {
+		bool stopping, finished;
+
+		mutex_lock(tpebs_mtx_get());
+		stopping = tpebs_stopping;
+		finished = !stopping && check_if_command_finished(&tpebs_cmd);
+		mutex_unlock(tpebs_mtx_get());
+		if (stopping) {
+			ret = -EBUSY;
+			goto out;
+		}
+		if (finished) {
 			ret = 0;
 			goto out;
 		}
@@ -297,7 +336,17 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 	}
 
 	if (!(pollfd.revents & POLLIN)) {
-		if (check_if_command_finished(&tpebs_cmd)) {
+		bool stopping, finished;
+
+		mutex_lock(tpebs_mtx_get());
+		stopping = tpebs_stopping;
+		finished = !stopping && check_if_command_finished(&tpebs_cmd);
+		mutex_unlock(tpebs_mtx_get());
+		if (stopping) {
+			ret = -EBUSY;
+			goto out;
+		}
+		if (finished) {
 			ret = 0;
 			goto out;
 		}
@@ -307,7 +356,7 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 		goto out;
 	}
 
-	ret = read(ack_fd[0], ack_buf, sizeof(ack_buf));
+	ret = read(resp_fd, ack_buf, sizeof(ack_buf));
 	if (ret > 0)
 		ret = strcmp(ack_buf, EVLIST_CTL_CMD_ACK_TAG);
 	else
@@ -315,6 +364,8 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 out:
 	/* Re-take lock as expected by caller. */
 	mutex_lock(tpebs_mtx_get());
+	tpebs_cmd_in_flight = false;
+	cond_broadcast(&tpebs_cmd_cond);
 	return ret;
 }
 
@@ -331,12 +382,21 @@ static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
 	/* Like tpebs_start, we should only run tpebs_end once. */
 	if (tpebs_cmd.pid != 0) {
 		pid_t actual_pid = tpebs_cmd.pid;
+		pthread_t reader_thread;
 
 		tpebs_stopping = true;
+		tpebs_gen++;
+		cond_broadcast(&tpebs_cmd_cond);
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
@@ -515,6 +575,8 @@ int evsel__tpebs_open(struct evsel *evsel)
 	int ret;
 	bool tpebs_empty;
 	bool started_process = false;
+	bool started_thread = false;
+	uint64_t open_gen = 0;
 
 	/* We should only run tpebs_start when tpebs_recording is enabled. */
 	if (!tpebs_recording)
@@ -550,6 +612,7 @@ int evsel__tpebs_open(struct evsel *evsel)
 	tpebs_empty = list_empty(&tpebs_results);
 	if (!tpebs_empty) {
 		started_process = true;
+		open_gen = ++tpebs_gen;
 		/*Create control and ack fd for --control*/
 		if (pipe(control_fd) < 0) {
 			pr_err("tpebs: Failed to create control fifo");
@@ -567,13 +630,18 @@ int evsel__tpebs_open(struct evsel *evsel)
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
+		if (!ret && tpebs_gen != open_gen)
+			ret = -EBUSY;
 	}
 out:
 	if (ret) {
@@ -584,11 +652,24 @@ int evsel__tpebs_open(struct evsel *evsel)
 			tpebs_retire_lat__delete(t);
 		}
 
-		if (started_process) {
-			if (tpebs_cmd.pid > 0) {
-				kill(tpebs_cmd.pid, SIGTERM);
-				finish_command(&tpebs_cmd);
+		if (started_process && tpebs_gen == open_gen) {
+			pid_t actual_pid = tpebs_cmd.pid;
+
+			tpebs_stopping = true;
+			tpebs_gen++;
+			cond_broadcast(&tpebs_cmd_cond);
+			if (actual_pid > 0) {
+				kill(actual_pid, SIGTERM);
+				while (tpebs_cmd_in_flight)
+					cond_wait(&tpebs_cmd_cond, tpebs_mtx_get());
 				tpebs_cmd.pid = 0;
+				if (started_thread) {
+					pthread_t reader_thread = tpebs_reader_thread;
+
+					mutex_unlock(tpebs_mtx_get());
+					pthread_join(reader_thread, NULL);
+					mutex_lock(tpebs_mtx_get());
+				}
 			}
 			if (tpebs_cmd.out >= 0) {
 				close(tpebs_cmd.out);
@@ -610,6 +691,12 @@ int evsel__tpebs_open(struct evsel *evsel)
 				close(ack_fd[1]);
 				ack_fd[1] = -1;
 			}
+			if (actual_pid > 0) {
+				tpebs_cmd.pid = actual_pid;
+				finish_command(&tpebs_cmd);
+				tpebs_cmd.pid = 0;
+			}
+			tpebs_stopping = false;
 		}
 	}
 	mutex_unlock(tpebs_mtx_get());
-- 
2.56.0.455.g6c5a503b38-goog

