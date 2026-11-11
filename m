Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418970;
	b=nHqvcvxoePy7ECLGZBOILa0m6WJkNSYXnqGcd0V+UVn2HjOht+Z8zV5G14A9GAwUciaS
	 m6xxmB8edCM6q4Dg2qoHQzFopIR334Jbol9Ar0CAOjmjRB/CrqiTy5TPg7C/vytAJ5JJ8
	 ZcwB7fvOqe6ocI4iL/A2p4TSjXbYzSwJI3rQYFLXxvj23G3axOFaYUwojdxMn8Mxt73G2
	 hN48X38ilfnp2DFgLSsLm5tx1dEiWY6G31plX1YqpglJ/H4FaN3NkAf5Q9B/8wF5rUDzY
	 571myVa0+aX9suq3JmFx3G1+vqQhZYbnP9JGRFUtrfPyjxqaJtPPcAjTVPsOere7T8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=eF890Lh5ob1yT1GraUK8lg1+cV0L3BM+5yLqGVVOxIk=;
	b=QZZTQhOxkrzHK/qW5Xdu9EESMlwsVh/GDYeD775Rfo0tL32S/XfpL80BBdkYkpmzlBDv
	 xsmc2J5GiZaHaHLI5nrsKZomhIbuGdsubqTGfBJydPxJi33nUcRlUszmRPE2aThdW1KJp
	 C4JYINbKJoGoyRtVu01ilR/gtQ2WfudRIVTNKh4nm1c2PTFI3Sp9IBfgMKydMHGCKSUgH
	 xrNTkkE4pVV7N0s/BI/movYmxq2Mmm6/iStqPsjzm/UFhatqSjxYk/JaLP7p/mvNh4UOv
	 rXpqJZJbTWHuFKZfc4wAvTm54Cp80xpZtGZwRVo9PJ/cUvAKJCumhK9Dm5y9CE56IFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Oeq8YNVN;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E953606A8B0
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 17:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E953606A8B0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Oeq8YNVN
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso4956065c88.0
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 09:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794418969; x=1795023769; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eF890Lh5ob1yT1GraUK8lg1+cV0L3BM+5yLqGVVOxIk=;
        b=Oeq8YNVNcIklUQp0Q7MFFXtUauyy2HwAN1BhBQQ6CrnajeGcJWpI4zg67wPIYUPeL+
         JbkBdiRkPLamTAbHQKZtO1ICayWSsCA6L8uM2ovjoEvJZZ03wlO5UksVJFzfdSyQDNIo
         nY8/NJ9ms9WvO1LIEGpL7y/XlExJdfrb4GR0ECoqkhAOlFKqIsXhMBDbiFMJFxVEzyR7
         jva0xp6EUrp3ARX2rLFWrKwOEiT9FqoVwPiWsedJ18jhVoci/jUuI9vfQ+8k6esctm1h
         eq+1EvwstZyiKlQ+OsTlrrxJ9A49rqCXrOKvzYlWkTUAMg82brpNzeQ3AgU6SDPBaYQT
         0fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418969; x=1795023769;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eF890Lh5ob1yT1GraUK8lg1+cV0L3BM+5yLqGVVOxIk=;
        b=BtBLvq4s8NZ3n/IKvIzRKFCVyQbDuBldjizcNI1OfHGiL6XXRVzQ9yQqpsvBwMCH84
         zpaM6UWxtowvd3mKNN0rh3WqgduqqFTXYwsJqqk5yMVRKKAgJ/4WXN/syCj3ooQIZluQ
         XYsVtXs1FO0DxvfgTaA5sVFlwxTT9vLh2xDi31E8Bgc17UtWS/lAzMr4toJTpyKkwIrw
         stDmnqyMQZdCNUCFBcXbebnvYMO3YGLFFVqYfDhW+8F8lTvOhZSR7E6PZjrvo0LvewCQ
         y1RohUeVbCiABWgWIKLSU8nl6KztGw7xToxCq39bO8r4S4RAS5JKEeN1bSO39xniQnW6
         4SnQ==
X-Forwarded-Encrypted: i=1; AL+hErEMmYHAHXpekNrbRi1FRON5ncNOBrWfcjisqbvMyjYYEqg7Ma9oNJG7FbBUNm6IlIMmKewa@lists.linux.dev
X-Gm-Message-State: APuU4Z97qhhyd25D3IxBJK+iDdY3I+DpCp7n6ohd6PNXBwav9b+MFOJZ
	nRux5rFiqeROjUrX1x70mYPNKr9TnVaVkwfqoiRpx8u7QxTgz/5pVzKnQR6JBfPzvoD5NnVx1tr
	9HbqGzr1+KA==
X-Received: from dlbvv19.prod.google.com ([2002:a05:7022:5f13:b0:1b2:6e34:9a49])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:45d8:10b0:151:6e80:ba7e
 with SMTP id a92af1059eb24-1b3c023c475mr3025197c88.4.1794418968991; Wed, 11
 Nov 2026 09:42:48 -0800 (PST)
Date: Wed, 11 Nov 2026 09:42:06 -0800
In-Reply-To: <20261111174213.3526604-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261111174213.3526604-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261111174213.3526604-15-irogers@google.com>
Subject: [PATCH v12 14/20] perf thread: Expand context analysis annotations to
 threads and namespaces_lock
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
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
2.56.0.542.g3ef89b7020-goog

