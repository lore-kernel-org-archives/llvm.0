Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794941373;
	b=ZXb3xwRHyFqcCZbdmm5CZql4fvWIv+Jc1YYsmI36RPaIOHfUiWsLwpPKQoxyHIhd6UYn
	 evVTwnOKY7ze1HL/0A1TTpY54UtLOZ6j78tsRJZTkhC7goboeWTkoGMv2grmSJZpmuWQe
	 7nUnK7IeS2EXT6w9Tht6hZUqVeZt5I7qrZraunUAlOEL5WUIMvdYoQfRUOKcLgPl/O/6y
	 p4kd3ENV6sYrU74DXoYB42rZUV+lmtYe6mReA5qELJh40mOcEIDVMgWYDL/0eldXrGKS3
	 YnrtOuZBAadBzd3b0knny+5LVFr/dkhrx34zoOFiJJssjnMTwdw5C7+6tcbpN58SL/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794941373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=pXPIGPG54oUqWIojIh2GG7bYUuWDaaWRUZbCMT5Ft+Q=;
	b=gpv3xKKYrJpEots/HNTwp6MN5LkT7HlXZ2Ht75FWu77JfwZKmicDonEoCliu+E5Puh6X
	 Mb+EMeDQeVmLziqAIdu6Cea6ObmmCIUwuk35Q1TT9Ot7/YgdMFBZrCKc7PauSFptU+b3x
	 YnUx9Ks3bE9de6QU5GGBxS4YF9zraaUH+NDZ0hY3VUk9jEqBfff07sF6smu3OxUnWWS/A
	 C+3gPEwu77V2Jau+xwfhvXX6rWBPmOC7/Nkwn28fvyRyND7jk/C7FZ8ubvO66I4yKcs47
	 nVpn7/OIBKyhvIgDMEY34TN70ahtjXjNppP8LxovJ69szIWb7LtC79GnPYdfRz521Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H+rs9XF3;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ECE606A893
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 18:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7ECE606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=H+rs9XF3
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36de26cb4b3so99294eec.1
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 10:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794941372; x=1795546172; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXPIGPG54oUqWIojIh2GG7bYUuWDaaWRUZbCMT5Ft+Q=;
        b=H+rs9XF3srmfgACp/pOjgIbAttql8Px+UguRM3crWOjXlgyUjON83eVPI7FvPaFdGS
         Ixk5mZJHgYvvGqFUwUcnU8XK3Pk7EeQevPPZjzOBCn5Wh5se5HhrnZ2fEYtO9C2fGr8v
         0bEq1wPxYcoougrktasuEoJ88HgcD8DIfK3JMpsUC28jS7JocrHQDdt2op7+058Zd9Qa
         gofE9gawTnbm1MTAQvBqswMBisDM5lHjkiNVNn3EoEPGWUieDg0RxmPxsagQQrcKMGBa
         3xt+a2sfjXRS5QxcHLHaDLNowpqQHpSue7yOyfNBaFYuQ2hih5YJxWpFNFqeBgS/xzKR
         OBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794941372; x=1795546172;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXPIGPG54oUqWIojIh2GG7bYUuWDaaWRUZbCMT5Ft+Q=;
        b=GKjn16gzdH75eRZlcqj0jo/P37c+ZTBco1/3YxgjNxHboDylIoWZza/tC0r2jO4iEf
         /dfIC4OkWPRyAnL6h5AME3kP1B2DXgb1opMSjpM0izcbe0rUCTwLfOBDne+w+GdhCXRw
         2731Alto5Q7k3uqO7mcfr15s0s1IZk5BhLP1pXhnF8OCakVYCza/b2AMI9oGTcYVtfMO
         s48RRrp/m8fnEB+WrZcGkkmQNs/K3UXjvmYUWgFvV8bK5xYe3MWkeTXyg9t4FZejcsOh
         20Ynl0fBmpgkjfSV25ZsQJrbmd0xLz6o8NI0HUAy+m1Hheu+Psxw9z1vyYYXZAKCh90p
         bkSg==
X-Forwarded-Encrypted: i=1; AL+hErFzNcQXreUayysgS5IowfIRrXCED9caOGoVCN/UReQ06yhq/QaJFrW8fzzaRly9EEO6QwK9@lists.linux.dev
X-Gm-Message-State: APuU4Z/866c/ZByCy5ONbghBQBmRB+UjURS+f6tVXLbdG+uRPaLeO1qE
	kxHSoGLXVr9oRLNSV52QFkHxGPFUcsfQpK3xBWz0sBIwNcv+Bp63nlhtJo37+R9xydbCeL5IpeK
	zipZUmrFRwA==
X-Received: from dybgk3.prod.google.com ([2002:a05:7301:183:b0:351:1da6:c2e7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:710e:b0:369:f182:8e99
 with SMTP id 5a478bee46e88-382828a678dmr300900eec.35.1794941371799; Tue, 17
 Nov 2026 10:49:31 -0800 (PST)
Date: Tue, 17 Nov 2026 10:48:35 -0800
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
Message-ID: <20261117184844.99889-15-irogers@google.com>
Subject: [PATCH v14 14/23] perf thread: Expand context analysis annotations to
 threads and namespaces_lock
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Annotate shard and last_match in struct threads_table_entry with
__guarded_by(&lock) and add __must_hold_shared()/__must_hold() to the
last_match helpers in util/threads.c.

In util/thread.h and util/thread.c, add __returns_ctx_lock() to
thread__namespaces_lock() and thread__comm_lock(), annotate
namespaces_list and comm_list with __guarded_by(), and add
__must_hold_shared()/__must_hold() to the namespaces_list helpers.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/thread.c  |  2 ++
 tools/perf/util/thread.h  | 28 +++++++++++++++++-----------
 tools/perf/util/threads.c |  4 ++++
 tools/perf/util/threads.h |  6 +++---
 4 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
index 616d5bf87baf..af761b1fc5d5 100644
--- a/tools/perf/util/thread.c
+++ b/tools/perf/util/thread.c
@@ -149,6 +149,7 @@ void thread__put(struct thread *thread)
 }
 
 static struct namespaces *__thread__namespaces(struct thread *thread)
+	__must_hold_shared(thread__namespaces_lock(thread))
 {
 	if (list_empty(thread__namespaces_list(thread)))
 		return NULL;
@@ -169,6 +170,7 @@ struct namespaces *thread__namespaces(struct thread *thread)
 
 static int __thread__set_namespaces(struct thread *thread, u64 timestamp,
 				    struct perf_record_namespaces *event)
+	__must_hold(thread__namespaces_lock(thread))
 {
 	struct namespaces *new, *curr = __thread__namespaces(thread);
 
diff --git a/tools/perf/util/thread.h b/tools/perf/util/thread.h
index 9d0ce7742c06..a7850eebce4e 100644
--- a/tools/perf/util/thread.h
+++ b/tools/perf/util/thread.h
@@ -48,10 +48,10 @@ DECLARE_RC_STRUCT(thread) {
 	bool			exited;
 	bool			comm_set;
 	int			comm_len;
-	struct list_head	namespaces_list;
 	struct rw_semaphore	namespaces_lock;
-	struct list_head	comm_list;
+	struct list_head	namespaces_list __guarded_by(&namespaces_lock);
 	struct rw_semaphore	comm_lock;
+	struct list_head	comm_list __guarded_by(&comm_lock);
 	u64			db_id;
 
 	void			*priv;
@@ -230,30 +230,36 @@ static inline void thread__set_comm_len(struct thread *thread, int len)
 	RC_CHK_ACCESS(thread)->comm_len = len;
 }
 
-static inline struct list_head *thread__namespaces_list(struct thread *thread)
+static inline struct rw_semaphore *thread__namespaces_lock(const struct thread *thread)
+	__returns_ctx_lock(&RC_CHK_ACCESS(thread)->namespaces_lock)
 {
-	return &RC_CHK_ACCESS(thread)->namespaces_list;
+	return (struct rw_semaphore *)&RC_CHK_ACCESS(thread)->namespaces_lock;
 }
 
-static inline int thread__namespaces_list_empty(const struct thread *thread)
+static inline struct list_head *thread__namespaces_list(struct thread *thread)
+	__must_hold_shared(thread__namespaces_lock(thread))
 {
-	return list_empty(&RC_CHK_ACCESS(thread)->namespaces_list);
+	/* Readers hold the shared lock; writers hold the exclusive lock. */
+	return context_unsafe(&RC_CHK_ACCESS(thread)->namespaces_list);
 }
 
-static inline struct rw_semaphore *thread__namespaces_lock(struct thread *thread)
+static inline int thread__namespaces_list_empty(const struct thread *thread)
+	__must_hold_shared(thread__namespaces_lock(thread))
 {
-	return &RC_CHK_ACCESS(thread)->namespaces_lock;
+	return list_empty(&RC_CHK_ACCESS(thread)->namespaces_list);
 }
 
-static inline struct rw_semaphore *thread__comm_lock(struct thread *thread)
+static inline struct rw_semaphore *thread__comm_lock(const struct thread *thread)
+	__returns_ctx_lock(&RC_CHK_ACCESS(thread)->comm_lock)
 {
-	return &RC_CHK_ACCESS(thread)->comm_lock;
+	return (struct rw_semaphore *)&RC_CHK_ACCESS(thread)->comm_lock;
 }
 
 static inline struct list_head *thread__comm_list(struct thread *thread)
 	__must_hold_shared(thread__comm_lock(thread))
 {
-	return &RC_CHK_ACCESS(thread)->comm_list;
+	/* Readers hold the shared lock; writers hold the exclusive lock. */
+	return context_unsafe(&RC_CHK_ACCESS(thread)->comm_list);
 }
 
 static inline u64 thread__db_id(const struct thread *thread)
diff --git a/tools/perf/util/threads.c b/tools/perf/util/threads.c
index 5db81b9debb5..7cf951cbc963 100644
--- a/tools/perf/util/threads.c
+++ b/tools/perf/util/threads.c
@@ -24,6 +24,7 @@ static bool key_equal(long key1, long key2, void *ctx __maybe_unused)
 }
 
 void threads__init(struct threads *threads)
+	__context_unsafe(/* initialization */)
 {
 	for (int i = 0; i < THREADS__TABLE_SIZE; i++) {
 		struct threads_table_entry *table = &threads->table[i];
@@ -35,6 +36,7 @@ void threads__init(struct threads *threads)
 }
 
 void threads__exit(struct threads *threads)
+	__context_unsafe(/* teardown */)
 {
 	threads__remove_all_threads(threads);
 	for (int i = 0; i < THREADS__TABLE_SIZE; i++) {
@@ -66,6 +68,7 @@ size_t threads__nr(struct threads *threads)
  */
 static struct thread *__threads_table_entry__get_last_match(struct threads_table_entry *table,
 							    pid_t tid)
+	__must_hold_shared(&table->lock)
 {
 	struct thread *th, *res = NULL;
 
@@ -79,6 +82,7 @@ static struct thread *__threads_table_entry__get_last_match(struct threads_table
 
 static void __threads_table_entry__set_last_match(struct threads_table_entry *table,
 						  struct thread *th)
+	__must_hold(&table->lock)
 {
 	thread__put(table->last_match);
 	table->last_match = thread__get(th);
diff --git a/tools/perf/util/threads.h b/tools/perf/util/threads.h
index da68d2223f18..54fba16657db 100644
--- a/tools/perf/util/threads.h
+++ b/tools/perf/util/threads.h
@@ -11,10 +11,10 @@ struct thread;
 #define THREADS__TABLE_SIZE	(1 << THREADS__TABLE_BITS)
 
 struct threads_table_entry {
-	/* Key is tid, value is struct thread. */
-	struct hashmap	       shard;
 	struct rw_semaphore    lock;
-	struct thread	       *last_match;
+	/* Key is tid, value is struct thread. */
+	struct hashmap	       shard __guarded_by(&lock);
+	struct thread	       *last_match __guarded_by(&lock);
 };
 
 struct threads {
-- 
2.56.1.703.gf848ed807c-goog

