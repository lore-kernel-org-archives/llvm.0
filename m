Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941377;
	b=ztk+/Sdzt1ZY6EpvNVPDaPIHc6cfRVBF2nt7WpVHbBwLfKPiOcqq7s7V/YecKzgt6Bus
	 RD9zUqiJIzsPIzICdj0FsyUMRXCN7sgvpLg5QXhMxIWPuWGAx+lRztpW63hGnt0uQ2/3E
	 KcCuzZ7P9DLm1NK2U5xweBLahne4pTd8/MLvcCHYPjVxQTGf0xiaus0wFeMnyBOXsv8MX
	 WPG8Pmyny92s6tr4GHKDGNRadvZ7knZYIaeS/AAwJcwz8+sn4qVxX1LtNkkjoT7zkvwX4
	 Dnp1gxLcDqqq+jKlKpzvx0oDtjTNYZREosXFV75aC59ZajAO4tySgfuwGaXgUYlTKaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=b0kXemimXYZiGO65xLjbpmbH+gu1pApZ0tUAyVljl54=;
	b=naoVBuPt2uvqP6UyhtE/qbPRwzJiXjGaj7SfvuH8g+nKEix2OJ78BH0Jy1cRXY6mQCix
	 qUDdW/OUnVw43ODrzERop1Yzkg6eJOBLUofQrSPVjlkspE3VrQStnK7kMDSj3gokl7HuZ
	 uJZCZFOKj70s35x8qn8hmce3sku5sTHKpYY4y+Q5NBnK6Irtd1P8/9MUm3aePGPwBUGBy
	 x8RdIWaJ0a3JFv4iw84T7dzUadbwEZEWQfUZ7PMJPZ1k5TX8PmJ4ON0U2ntxdY1c67MbT
	 oBatqHUHAX9ZiRTVY65SItiI3NIqcfKnfrCVvHm2DADJAop5vQQFsc6X0NqenMKBB7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fJHhgVHI;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5CF606A89F
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA5CF606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fJHhgVHI
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso236369eec.0
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941376; x=1795546176; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0kXemimXYZiGO65xLjbpmbH+gu1pApZ0tUAyVljl54=;
        b=fJHhgVHIcG5yegmQHbMExeQoBZsmz2cBCyIr29b69y9GcQS5VengbzPLAKLlfMSP/L
         TnviR3N4Ht1SCyV/sLuMb6tzaE2WZhgjmmoD4NmiosdOnBhbu+QTlzK/nUnE5YkNnnKs
         i8Gbw36OzY4vgUi3l2NX+JBBhGS8zIW8wECviUoR9ilRQw8w/jzYndX84xVU8wXh5xP8
         EyKOGVf63WAUFoQCm7cgI+FDpc/N1MaftTfuRbvoq4KEvkbuOwfInM7Q2X0wa7RVzphW
         W1yqNhrWi5DYzSO80r0k4uhO9mho7oEUvZ6CRqkONBTDCahfxx/H6anw2v+j15nY+G1B
         C//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941376; x=1795546176;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0kXemimXYZiGO65xLjbpmbH+gu1pApZ0tUAyVljl54=;
        b=URoZKFdGt2aBRrtERtbYQXZPlyHf9AMWUowFP6taVDAweOi3qb4bzKQBXZdV2eQWNE
         K3fKVei+21XSl5ntc7MlOcjhuhKeyBRHb5o3B4Qv26hgILGD3K0FbBN5AeepAiBKMLxd
         18I1PwgK2oIJeZmEcX4TiJW2p3ROCv0Qwmy5h71P6rKpEmFTup34EdbAsJwWFGJuHd2r
         tg9AxH5nqJuZ/K/GEOV3V7TgAvYKluZDFRQHNyo2Ed6dwntO/KvQZrhQxXl0QK3uJvFL
         zAiwAT8MAZdOhbHbp1lruwynZp4yI/2+crYyKf74lWeFdZX5PWD4wjBQg7hmsCgMvaV+
         5UwA==
X-Forwarded-Encrypted: i=1; AL+hErH2nhV9Olg3/DayyNA8SXIMxDeIx7FZG/TeNFGh0QRkwVPlb7kRiKDMgK859pQy4qcapKgk@lists.linux.dev
X-Gm-Message-State: APuU4Z8CGSlmCmb/a1Km6KNCEnygKyuPYrq/WFFHWjvgN9s6cIA5QABc
	bd6HMt9D9z5PezoUFCValPODiQF5J0oMsVm3+xxWg8L9X2eADF6TL8sh8rYXYFUD1pza75c8w8S
	Y+1xOaVw2Dg==
X-Received: from dycjq7.prod.google.com ([2002:a05:7301:5807:b0:35d:1771:4816])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:162b:b0:36e:e349:f2cb
 with SMTP id 5a478bee46e88-38280172caamr275899eec.19.1794941375691; Tue, 17
 Nov 2026 10:49:35 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:37 -0800
In-Reply-To: <20261117184844.99889-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117184844.99889-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117184844.99889-17-irogers@google.com>
Subject: [PATCH v14 16/23] perf intel-tpebs: Use DEFINE_MUTEX for tpebs_mtx
 and add lock annotations
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Replace tpebs_mtx_get() and its pthread_once() initialization helper
tpebs_init() with DEFINE_MUTEX(tpebs_mtx) and static initializers for
control_fd and ack_fd, and add __guarded_by(&tpebs_mtx) and
__must_hold(&tpebs_mtx) annotations to the TPEBS state.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/intel-tpebs.c | 109 +++++++++++++++-------------------
 1 file changed, 48 insertions(+), 61 deletions(-)

diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-tpebs.c
index 23d1e8bb678c..2f3231bab61c 100644
--- a/tools/perf/util/intel-tpebs.c
+++ b/tools/perf/util/intel-tpebs.c
@@ -38,19 +38,20 @@
 
 bool tpebs_recording;
 enum tpebs_mode tpebs_mode;
-static LIST_HEAD(tpebs_results);
-static pthread_t tpebs_reader_thread;
-static struct child_process tpebs_cmd = {
+static DEFINE_MUTEX(tpebs_mtx);
+static struct list_head tpebs_results __guarded_by(&tpebs_mtx) = LIST_HEAD_INIT(tpebs_results);
+static pthread_t tpebs_reader_thread __guarded_by(&tpebs_mtx);
+static struct child_process tpebs_cmd __guarded_by(&tpebs_mtx) = {
 	.out = -1,
 };
-static int control_fd[2], ack_fd[2];
-static struct mutex tpebs_mtx;
 static struct cond tpebs_cmd_cond = { .cond = PTHREAD_COND_INITIALIZER };
-static bool tpebs_stopping;
-static bool tpebs_starting;
-static bool tpebs_enabled;
-static bool tpebs_cmd_in_flight;
-static uint64_t tpebs_gen;
+static int control_fd[2] __guarded_by(&tpebs_mtx) = { -1, -1 };
+static int ack_fd[2] __guarded_by(&tpebs_mtx) = { -1, -1 };
+static bool tpebs_stopping __guarded_by(&tpebs_mtx);
+static bool tpebs_starting __guarded_by(&tpebs_mtx);
+static bool tpebs_enabled __guarded_by(&tpebs_mtx);
+static bool tpebs_cmd_in_flight __guarded_by(&tpebs_mtx);
+static uint64_t tpebs_gen __guarded_by(&tpebs_mtx);
 
 struct tpebs_retire_lat {
 	struct list_head nd;
@@ -66,25 +67,11 @@ struct tpebs_retire_lat {
 	bool started;
 };
 
-static void tpebs_init(void)
-{
-	mutex_init(&tpebs_mtx);
-	control_fd[0] = control_fd[1] = -1;
-	ack_fd[0] = ack_fd[1] = -1;
-}
-
-static struct mutex *tpebs_mtx_get(void)
-{
-	static pthread_once_t tpebs_once = PTHREAD_ONCE_INIT;
-
-	pthread_once(&tpebs_once, tpebs_init);
-	return &tpebs_mtx;
-}
-
 static struct tpebs_retire_lat *tpebs_retire_lat__find(struct evsel *evsel)
-	__must_hold(tpebs_mtx_get());
+	__must_hold(&tpebs_mtx);
 
 static int evsel__tpebs_start_perf_record(struct evsel *evsel)
+	__must_hold(&tpebs_mtx)
 {
 	const char **record_argv;
 	int tpebs_event_size = 0, i = 0, ret;
@@ -212,19 +199,19 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 {
 	struct tpebs_retire_lat *t;
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	if (tpebs_stopping || tpebs_cmd.pid == 0) {
 		/* Record is stopping or has terminated. */
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return 0;
 	}
 	t = tpebs_retire_lat__find(sample->evsel);
 	if (!t) {
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return -EINVAL;
 	}
 	if (should_ignore_sample(sample, t)) {
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return 0;
 	}
 	/*
@@ -234,7 +221,7 @@ static int process_sample_event(const struct perf_tool *tool __maybe_unused,
 	 */
 	t->last = sample->weight3;
 	update_stats(&t->stats, sample->weight3);
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 	return 0;
 }
 
@@ -264,7 +251,7 @@ static void *__sample_reader(void *arg)
 	return NULL;
 }
 
-static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
+static int tpebs_send_record_cmd(const char *msg) __must_hold(&tpebs_mtx)
 {
 	struct pollfd pollfd = { .events = POLLIN, };
 	bool is_stop = !strcmp(msg, EVLIST_CTL_CMD_STOP_TAG);
@@ -275,7 +262,7 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 	while (tpebs_cmd_in_flight) {
 		if (!is_stop && tpebs_stopping)
 			return -EBUSY;
-		cond_wait(&tpebs_cmd_cond, tpebs_mtx_get());
+		cond_wait(&tpebs_cmd_cond, &tpebs_mtx);
 	}
 	if (!is_stop && tpebs_stopping)
 		return -EBUSY;
@@ -292,7 +279,7 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 	 * Let go of the lock while sending/receiving as blocking can starve the
 	 * sample reading thread.
 	 */
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 
 	/* Send perf record command. */
 	len = scnprintf(cmd_buf, sizeof(cmd_buf), "%s\n", msg);
@@ -320,10 +307,10 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 	if (!poll(&pollfd, 1, 500)) {
 		bool stopping, finished;
 
-		mutex_lock(tpebs_mtx_get());
+		mutex_lock(&tpebs_mtx);
 		stopping = tpebs_stopping;
 		finished = !stopping && check_if_command_finished(&tpebs_cmd);
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		if (stopping) {
 			ret = -EBUSY;
 			goto out;
@@ -343,10 +330,10 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 	if (!(pollfd.revents & POLLIN)) {
 		bool stopping, finished;
 
-		mutex_lock(tpebs_mtx_get());
+		mutex_lock(&tpebs_mtx);
 		stopping = tpebs_stopping;
 		finished = !stopping && check_if_command_finished(&tpebs_cmd);
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		if (stopping) {
 			ret = -EBUSY;
 			goto out;
@@ -368,7 +355,7 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 		pr_err("tpebs: perf record control ack failed\n");
 out:
 	/* Re-take lock as expected by caller. */
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	tpebs_cmd_in_flight = false;
 	cond_broadcast(&tpebs_cmd_cond);
 	return ret;
@@ -377,7 +364,7 @@ static int tpebs_send_record_cmd(const char *msg) __must_hold(tpebs_mtx_get())
 /*
  * tpebs_stop - stop the sample data read thread and the perf record process.
  */
-static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
+static int tpebs_stop(void) __must_hold(&tpebs_mtx)
 {
 	int ret = 0;
 
@@ -404,9 +391,9 @@ static int tpebs_stop(void) __must_hold(tpebs_mtx_get())
 		 */
 		tpebs_cmd.pid = 0;
 		reader_thread = tpebs_reader_thread;
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		pthread_join(reader_thread, NULL);
-		mutex_lock(tpebs_mtx_get());
+		mutex_lock(&tpebs_mtx);
 		if (control_fd[0] >= 0) {
 			close(control_fd[0]);
 			control_fd[0] = -1;
@@ -533,7 +520,7 @@ static struct tpebs_retire_lat *tpebs_retire_lat__find(struct evsel *evsel)
 	return NULL;
 }
 
-static void tpebs_results__delete(void) __must_hold(tpebs_mtx_get())
+static void tpebs_results__delete(void) __must_hold(&tpebs_mtx)
 {
 	struct tpebs_retire_lat *t, *tmp;
 
@@ -543,7 +530,7 @@ static void tpebs_results__delete(void) __must_hold(tpebs_mtx_get())
 	}
 }
 
-static int evsel__tpebs_prepare_one(struct evsel *evsel) __must_hold(tpebs_mtx_get())
+static int evsel__tpebs_prepare_one(struct evsel *evsel) __must_hold(&tpebs_mtx)
 {
 	struct tpebs_retire_lat *tpebs_event;
 
@@ -562,7 +549,7 @@ static int evsel__tpebs_prepare_one(struct evsel *evsel) __must_hold(tpebs_mtx_g
  * evsel__tpebs_prepare - create tpebs data structures ready for opening.
  * @evsel: retire_latency evsel, all evsels on its list will be prepared.
  */
-static int evsel__tpebs_prepare(struct evsel *evsel) __must_hold(tpebs_mtx_get())
+static int evsel__tpebs_prepare(struct evsel *evsel) __must_hold(&tpebs_mtx)
 {
 	struct evsel *pos;
 	int ret;
@@ -603,21 +590,21 @@ int evsel__tpebs_open(struct evsel *evsel)
 	if (!tpebs_recording)
 		return 0;
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	if (tpebs_starting) {
 		uint64_t wait_gen = tpebs_gen;
 
 		while (tpebs_starting && tpebs_gen == wait_gen)
-			cond_wait(&tpebs_cmd_cond, tpebs_mtx_get());
+			cond_wait(&tpebs_cmd_cond, &tpebs_mtx);
 
 		if (tpebs_gen != wait_gen) {
-			mutex_unlock(tpebs_mtx_get());
+			mutex_unlock(&tpebs_mtx);
 			return -EBUSY;
 		}
 	}
 
 	if (tpebs_stopping) {
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return -EBUSY;
 	}
 	/* Only start the events once. */
@@ -627,7 +614,7 @@ int evsel__tpebs_open(struct evsel *evsel)
 
 		t = tpebs_retire_lat__find(evsel);
 		valid = t && t->started && tpebs_enabled;
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		/* May fail as the event wasn't started. */
 		return valid ? 0 : -EBUSY;
 	}
@@ -635,7 +622,7 @@ int evsel__tpebs_open(struct evsel *evsel)
 	ret = evsel__tpebs_prepare(evsel);
 	if (ret) {
 		tpebs_results__delete();
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		return ret;
 	}
 
@@ -696,14 +683,14 @@ int evsel__tpebs_open(struct evsel *evsel)
 				if (!tpebs_cmd.finished)
 					kill(actual_pid, SIGTERM);
 				while (tpebs_cmd_in_flight)
-					cond_wait(&tpebs_cmd_cond, tpebs_mtx_get());
+					cond_wait(&tpebs_cmd_cond, &tpebs_mtx);
 				tpebs_cmd.pid = 0;
 				if (started_thread) {
 					pthread_t reader_thread = tpebs_reader_thread;
 
-					mutex_unlock(tpebs_mtx_get());
+					mutex_unlock(&tpebs_mtx);
 					pthread_join(reader_thread, NULL);
-					mutex_lock(tpebs_mtx_get());
+					mutex_lock(&tpebs_mtx);
 				}
 			}
 			if (tpebs_cmd.out >= 0) {
@@ -736,7 +723,7 @@ int evsel__tpebs_open(struct evsel *evsel)
 			cond_broadcast(&tpebs_cmd_cond);
 		}
 	}
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 	return ret;
 }
 
@@ -756,7 +743,7 @@ int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread)
 
 	count = perf_counts(evsel->counts, cpu_map_idx, thread);
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	t = tpebs_retire_lat__find(evsel);
 	/*
 	 * If reading the first tpebs result, send a ping to the record
@@ -765,10 +752,10 @@ int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread)
 	 */
 	if (t && &t->nd == tpebs_results.next) {
 		ret = tpebs_send_record_cmd(EVLIST_CTL_CMD_PING_TAG);
-		mutex_unlock(tpebs_mtx_get());
+		mutex_unlock(&tpebs_mtx);
 		if (ret)
 			return ret;
-		mutex_lock(tpebs_mtx_get());
+		mutex_lock(&tpebs_mtx);
 		t = tpebs_retire_lat__find(evsel);
 	}
 	if (t == NULL || t->stats.n == 0) {
@@ -808,7 +795,7 @@ int evsel__tpebs_read(struct evsel *evsel, int cpu_map_idx, int thread)
 			break;
 		}
 	}
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 
 	if (old_count) {
 		count->val = old_count->val + val;
@@ -833,7 +820,7 @@ void evsel__tpebs_close(struct evsel *evsel)
 {
 	struct tpebs_retire_lat *t;
 
-	mutex_lock(tpebs_mtx_get());
+	mutex_lock(&tpebs_mtx);
 	t = tpebs_retire_lat__find(evsel);
 	if (t) {
 		list_del_init(&t->nd);
@@ -842,5 +829,5 @@ void evsel__tpebs_close(struct evsel *evsel)
 		if (list_empty(&tpebs_results))
 			tpebs_stop();
 	}
-	mutex_unlock(tpebs_mtx_get());
+	mutex_unlock(&tpebs_mtx);
 }
-- 
2.56.1.703.gf848ed807c-goog

