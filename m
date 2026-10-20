Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514241;
	b=dBvxOjmztI++E+KuZUupeFjPKJc6G5H4onBRodu9+QGcfuxbmYr//uWzNURMq1IUYO+P
	 h5sFED25HwulV1yhyTqiu2C2eLFL1sS28WnDUPOMSnP5lP2nRrom103PExwuXX07XWRVK
	 +I8a2ll3ASlWmra0TpoMSeguBEi47cOqYSZazDw3y330PWnya/lnE6RvGyAeOWgNRNw51
	 mIFmISTngD8RUFJ7N2kcsV90B1zjF8dswlcPN7oBZt/Du01TOwHCenDasXfcc9voGSbMx
	 Zc8ySBVy522QokeeiDwh8H68Qi5RTn1sLNLw1kn4sgu0HfgWGWmeSzwQS9EF2IIqXlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=m5CCUC1R4M25rKM1gT3H/lRe4lKcFq/fltsw3UkJoHQ=;
	b=W9fgfYyj33zwoIUdVqMcXfapnoOElrCmxo+mEwv8MJTjPFwOGB0mgAN/Ekg7OtwSNyeK
	 viHu5JVKIQWjPwU2RCZtZp4JfbnhXv4quLqvpp+GFzVkyRV0tAK5HT9dXVA67ToNkyYyb
	 ZGdEK3mJRMU7gvmOaSf4DSzAg4BZ0JqYNrBtF0uMuTxI97Ggs/PFiW8ZUN1eE/7Xr60u/
	 JgcTyT7YVTVmIwIkHaX910DXvaXbsshpKhUzfTuAk4gL1NmLF+ljEc46Tk+l6HAEgySVf
	 XNhPTqPamSDy8qcX1b02sD/OJ+Hz7tjfP3mZGVUxErc55ObfV0YZpFyWjnNmSvQCl4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hBmnUAYJ;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D86860A4AD3
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 16:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D86860A4AD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=hBmnUAYJ
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so5930623eec.0
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 09:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792514240; x=1793119040; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m5CCUC1R4M25rKM1gT3H/lRe4lKcFq/fltsw3UkJoHQ=;
        b=hBmnUAYJcYVHUwh67fQTQ4b9q3o6KalSGx2UX5nD+6vOGF93nRWNH3WjKmjnYn8qln
         G4ffurxvkGEf477P1M1Lg3B68zs70rvFnbwbtd1pF7vKRvmefHZKFdLzChpSIlXRLbAZ
         cbX9okYhFTIfXTGWcPStWDaiLcSoW2403QP5QWioJCXmqJeP7Ts9vL7aL65t8UQ11lL0
         JT/hdsyJhPN3QHlaWFejIBy2HpmP8nA5sjmisSw//fN6m53bofdG9FfljwjGNRmsZ4mS
         w2+3xnsckno8BnaKnjrx7HdnunOErU/Nhizr4zEPDOj+fFARukBncKX0fKxha4s80qVA
         wsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514240; x=1793119040;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m5CCUC1R4M25rKM1gT3H/lRe4lKcFq/fltsw3UkJoHQ=;
        b=cdR0ngWxum25kxNlevpOTN0vzxOFr+15pZjvhAX0edHgUiE9EWu+lAWvBWHXgP71Oe
         N+RmeoWaovLsPieA32fI4Hj0zWAwCvXHSHr3JzoB5U/fHIOTmro+X7DTTGR3rprT8kPH
         2rJP1rvizQx0vkjORz8+BfebURhqAAiggzucx7HKUzA/aYt8EUuTHhMyICEl7+ozMRur
         Dd81S8f+lCwx3Nvz/bwe2o4ZIJXybM8pBtKQh4YkMHpz1Gs3IF+LFFlpfuQQ0Tjsgxqd
         haO4YuNpithORopzDVx3oQzvbyIdbFB2OnsT9ErfTOAKvyqbaTt5T9FdkELybk5bThyQ
         CP/g==
X-Forwarded-Encrypted: i=1; AKwUvBz4CDQKET5lYI/+7tZxy1r1rMVwIWpGk0jpetGRFhe3za7tAiAATxVqvO6mF48y109qeYtq@lists.linux.dev
X-Gm-Message-State: AFq9FYJuyRD2z6qS73cKRzUz/EOA28qI0F9A2wAAkOuwmdJJ7nLg1g6U
	qbElsnvB+n2N2dBSBs5te0a3HFMzJ3R2pBcZPCt5M3jom+hGey8seyGl24LJp6yJYWibrwzh9Ah
	ZVww2C6UFxw==
X-Received: from dleb11-n1.prod.google.com ([2002:a05:701b:424b:10b0:18f:1989:2d7b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:455a:10b0:14f:8d59:edcc
 with SMTP id a92af1059eb24-185118ee7a8mr14774194c88.12.1792514240285; Tue, 20
 Oct 2026 09:37:20 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:36:35 -0700
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
Message-ID: <20261020163640.746159-13-irogers@google.com>
Subject: [PATCH v5 12/17] perf thread: Expand context analysis annotations to
 threads and namespaces_lock
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, elver@google.com, namhyung@kernel.org
Cc: adrian.hunter@intel.com, james.clark@linaro.org, jolsa@kernel.org, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, ljs@kernel.org, llvm@lists.linux.dev, 
	mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
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
index 6ca0b178fb6c..39b3c420635a 100644
--- a/tools/perf/util/threads.c
+++ b/tools/perf/util/threads.c
@@ -21,6 +21,7 @@ static bool key_equal(long key1, long key2, void *ctx __maybe_unused)
 }
 
 void threads__init(struct threads *threads)
+	__context_unsafe(/* initialization */)
 {
 	for (int i = 0; i < THREADS__TABLE_SIZE; i++) {
 		struct threads_table_entry *table = &threads->table[i];
@@ -32,6 +33,7 @@ void threads__init(struct threads *threads)
 }
 
 void threads__exit(struct threads *threads)
+	__context_unsafe(/* teardown */)
 {
 	threads__remove_all_threads(threads);
 	for (int i = 0; i < THREADS__TABLE_SIZE; i++) {
@@ -63,6 +65,7 @@ size_t threads__nr(struct threads *threads)
  */
 static struct thread *__threads_table_entry__get_last_match(struct threads_table_entry *table,
 							    pid_t tid)
+	__must_hold_shared(&table->lock)
 {
 	struct thread *th, *res = NULL;
 
@@ -76,6 +79,7 @@ static struct thread *__threads_table_entry__get_last_match(struct threads_table
 
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
2.56.0.212.g129ede20d9-goog

