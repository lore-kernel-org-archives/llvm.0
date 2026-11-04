Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825993;
	b=MOgTss7IznlSTmO3VoppwwRnSWfbqtAJLD0IeS7HT+rhymv2slsZ/mXXrjGqgSx26FNg
	 gyUMA3ofS/7uHW7hdQOuS2BCj0MagZu6S0OrqwGQ9l0zWVN29xm1VZkwt2hwBfTR02ayj
	 Jjp4jNdNlhH+IsL4F33cH+p7AhjHK/PNPD17n45fyC4Z3KWAyQw8FmRSW4fRDpIirg8+s
	 EMiCBDr7H+v1Wt/iV5mki8BlsVwRVXkExUTXF3X+BnPdKkMmuBbAIEKDrZras/q7AGyPI
	 v9cnqC13cPvxKmV1BFXM/rkHWzPKbrX+N2ibF4zhyecYRAV0VnqZaiOmaFoK1mFz9sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=71mJGJZNH6cogPzlP4IDLPHHrA5MvoABWmVXrE7uP/E=;
	b=A+IzUVYX+yrUfWh9v1lFS2UYG2DIfpGr++FuAMe1i+e8RsXfvll1Z4G5aMAmE+HGiQS5
	 lcmVXa0628fcsJdiZZ15i0HuVV1BPIbO4EL7vZXw2g45nbUwfNuyUvAVnpTIfnbtlAnX8
	 yLqK7rGBOk5V5CEVRysPEY4Qqv6uN8ythNgbcELWUMZi00qDKP/quLIlHYXHgfy1b0rHG
	 cjdob0bjtSIVSOHngTca2LeFuT694Bq78Odfgv1UHHVAz9Fm+Qts9g/it/L67mijBehTk
	 JjiJFhS4HgJGGU4NsZtvvK5kZV0/Uy9S5AfZs+uHQ0gafhitGobOYbqAh0BTkiZIleA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O6ZLTXuK;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362C060E7518
	for <llvm@lists.linux.dev>; Wed,  4 Nov 2026 20:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 362C060E7518
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O6ZLTXuK
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso2043556eec.1
        for <llvm@lists.linux.dev>; Wed, 04 Nov 2026 12:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793825992; x=1794430792; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=71mJGJZNH6cogPzlP4IDLPHHrA5MvoABWmVXrE7uP/E=;
        b=O6ZLTXuKXPGSKTG+H31ClXENa6uokIceOUC5nx0SVAVqWsr/sowS9kbl5KCoJ2btCp
         BWiNGORsQIaQlAE2dGE7XP4mu931jYFhqhJiDOT8+2Wn26kf89+JBrGsAjzcmNzv6So8
         OsAdwoXyVOQxkAiIogDdJBZyKhcjnZ6R6W2hTL6xebKkhtKOoUQUnSQg5ywbH0k6T+cG
         c0XvHtjobANsAen+kWPM3mab/JrCHPtO2JA1SUMBnoDGNTozxm66HBXyJrRGUHcnnh+r
         qgLwe8QIW06WbkR+w+ai6IujPRZpOMtBPEbqQFgnGROwZK2S19LP1pRzZzV4vvuhxQzW
         dD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825992; x=1794430792;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71mJGJZNH6cogPzlP4IDLPHHrA5MvoABWmVXrE7uP/E=;
        b=cdRPVFcTsGGYFilIxeeObWyxhFrvPjRQFvRx50M7kzrLIxfn6BQ9tbmF9MBHM8mCSe
         cgLo925dDskps0CMpeiO59DhgJosn6csX8lpdGgerKUcyrBAoYIZW0PwGrJNnqjzjKuU
         qVwOEEJZARfaHgVinsOHh6SaTVMHbCg2TZEPYl5N+AbUTiS1YaUjCcTzyaYDftEHLKyJ
         mtm3ljH0rsJvywFddTpdX7YJR7glhOYqShn/x72iwMiyq6aUwg60ryVyrdSkPZ45ww13
         1xxYUco1dLiHdyVSdhPDNaPMAZRRedC1lGkqfrM84sB2HF1HGZCJ0LEKRZiwp9Yd0jau
         HP7w==
X-Forwarded-Encrypted: i=1; AKwUvBw/GPLtStyKfwzBpAmPnJoPzQuUb9p69cpETdZwAlunZCvYqi3RqticlilEU1JyObyvhujA@lists.linux.dev
X-Gm-Message-State: APuU4Z+VUn80FAsh1RTGbbIHAkfwiy4PwlS9WUJUfC/nrN2xp9cL52Ec
	IyE9gg9ji0mCogzcYDCR/IRWH/F3J+wnwWtlzbQOWD1v3n8KU7513+vwe0yNAb1AQsZlUkjpb7m
	KdILaw246Ew==
X-Received: from dybgk1.prod.google.com ([2002:a05:7301:181:b0:351:1da6:c2e7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:3a94:b0:34d:2c1a:9892
 with SMTP id 5a478bee46e88-36a424988b7mr24518883eec.40.1793825991963; Wed, 04
 Nov 2026 12:59:51 -0800 (PST)
Date: Wed,  4 Nov 2026 12:59:05 -0800
In-Reply-To: <20261104205909.2078411-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261104205909.2078411-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104205909.2078411-16-irogers@google.com>
Subject: [PATCH v9 15/19] perf intel-tpebs: Fix race in tpebs_stop() and
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
2.56.0.455.g6c5a503b38-goog

