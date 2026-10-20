Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514244;
	b=HeUeIzvL0XsC8mZ15cV8KRmOKF37Y8UY3VLC6hziITz+OWulmZ4bOft5M6BQiSvnA12w
	 GMGSWWTgz3CPlRDWpef4YvHLKlSJTTOgbAye08pIpkyoBhG0Wp6UersN9fcP+y6CvRqzV
	 I5SCiT3d8Eg4lhBlS1OMXUpGc9rOtGNltcs6tDR8ZY3ZVG+kgUkf69gGIRQ/ddhzEapO7
	 7hB0Dl4nLNOLd9H7wS1gCTI1tnSl6FvG7Zhy+OXPvBBrcj7yXeJigtmq9yi/Fq1zCRf9p
	 JXY6kWB8Vu7xt465SSidx4nYCSCRbUI4thxACPUIIY2UKazxGXHG3hYMJgNEdEN0qLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=AHBhTJ6DgmiFrC9tIjIEIYR/ZRkbpnES5KahAOZYnik=;
	b=EzRRKhLC7BhQ5Dcq+A0a3l7zEKhe71lLZe459AVUL4wryNjEVGWgPRXMpAkVsOeyQ1oc
	 bmrLbYgGVZk1x5UGZPXdSg+jTqaeiYuZkTIeeE+vchQZZUixX7uaDfPyLp5v2uiZKDJ/Z
	 0VdftD3ZJWfy05DEs1QURjJwMX1OcZ2GyZkJ4M5HDmU8wg7ZC+LsAhsTpCEvv7VjMN8jz
	 4caHFO+zCxPKvkzKf0QhVP5X6HrJ7ZC6838RFtNvrnpKJIBdlCvaIWlhC9alvs6+ERDNH
	 3FF7os8gELjkXoChR43NT89BVFV6F63EPhDFqJ3wk4QNjHct/lbPCLGi07SGQtGOaEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="HL/l6hb9";
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DB960A4AEC
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 16:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99DB960A4AEC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=HL/l6hb9
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso5710814c88.0
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 09:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514243; x=1793119043; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AHBhTJ6DgmiFrC9tIjIEIYR/ZRkbpnES5KahAOZYnik=;
        b=HL/l6hb9vkCV+wkMKmo4Jv/hKieu6VAepa5+yB47Wa1SlB1NsRk23wceHYBbXq9hSe
         iDpm1BnKEadcGj+ytgGLgn27MYgmU/iPPfttRaOBWsGOYanEYQojnW4bpg8FSf7zn3e5
         CZ+5gq3khnVZvgOMWPj/VQ8q/BREbc0N/fjErmbTX2q/KT4YbhTyw/5jFcMCjQo84+hz
         sNWy+zCMbHjvpYBN9xvZlzg5i4qansazZc58/JM677c7apVuPPwdaruecJCsG5TpGYNt
         ufBk/r9/ICsj+LOzQ8Lwu5rzaIpnzSsJG8S/3uPXoRwoqq3ig/iKFSnxS94a4vFgT8eh
         mRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514243; x=1793119043;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHBhTJ6DgmiFrC9tIjIEIYR/ZRkbpnES5KahAOZYnik=;
        b=iahTURd87Elc5NXE0FBQIPjWNQ/NMYPQ9uYHtxSzBfKCpesXzuG8Mp1JtFChTCJp1X
         0zzCsYErzg5vwET2cXTmwqSo8ZqhlRRnay95NkKip53hdsCpWZ7AVW+9nfUDG6Ec5jEm
         XuxiPMCfY/kINXVepPW3Lg/hzB11Y5U5O0qGqY170V2XCtVMl8Jnl6HOnvVKcWK+yjmx
         dDy6dz5hw6rtEemHjFovnJGrYNk0I6JAT8uYeviMZp8qluLLyjtANqrHbLed1LO+sZtp
         6VAhRyDyhDD4p6Oo5C4agXuurbur6ALgaupgPBSlHi37CYGxXCtJwmkcVUniLVDT0kPb
         zZnw==
X-Forwarded-Encrypted: i=1; AKwUvBwf0wm579v6TTiEGEiyDVG2UoxRK/+13Wb9RaokQVl6UMd1rRXJUaZ3AhBpDk/nDqs5SUe/@lists.linux.dev
X-Gm-Message-State: AFq9FYLYqSmixLYd1gB/VE7OmrKojJ8Djx0ixmqyAZVND9/oBA2IKZiB
	VfDWh2TdlbNe/XjT3UMU4qQQuyi8ok3GQ/apEXfPYetRExC4pPfChsZ6facjbq9TRlu1RfNke4M
	tRsOVKtVIIA==
X-Received: from dlbvg7.prod.google.com ([2002:a05:7022:7f07:b0:15f:bc5b:ddbb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2906:b0:141:4a06:ad6f
 with SMTP id a92af1059eb24-1851238b5f2mr16989219c88.8.1792514242659; Tue, 20
 Oct 2026 09:37:22 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:36 -0700
In-Reply-To: <20261020163640.746159-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261016221700.1282659-1-irogers@google.com> <20261020163640.746159-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020163640.746159-14-irogers@google.com>
Subject: [PATCH v5 13/17] perf intel-tpebs: Fix race in tpebs_stop() and
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
2.56.0.212.g129ede20d9-goog

