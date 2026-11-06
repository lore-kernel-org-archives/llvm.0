Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793948661;
	b=bUh4LxZKkttvM8+ADVVYdEDYcHQGChQPWB6DcEx0eCHiuc2B8IjXGN7IzHqenVqIiDUg
	 qR8L6huNc9LQrMqXN4PlV7Bd+iJfTesGJaYP/FDO8QFXvxcYsp95CQaVHZVQEbvlFcNnA
	 WZNNaXk07uQQfdFF7LpN77vqcQxZqglxnq3yylQaAuj+xH5btbm3R//xhDG+yMnUmZ7AF
	 eBOb9B+9fSh720KYgQJ081VcF0JPDZ59jUcZJm8hkL7jAUfy828dyrhnrfbLlBldot7VZ
	 geoaq6hC86xumawz/BNh1e3kaEXVAnJ8VD7lCNlN7jY4y6JvVnZYMfXW6KTUAxzpeRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793948661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=o7CTrAhrkmxdP5PCIw1MA98wNNK+lzvPv6pZbJYyzjo=;
	b=LzqiXkpugl5P7qJbIbYv/QT60dxtLnTL/lghp2lUaGpxvvE6p2+cpFEGRLDADPaCxlAb
	 f3VsQx2LSWPJr/LEQakbSGErHf7DTvOCKD+vByZoVgLCWJrp3s+/aSAbHGu5wqV2b2j6T
	 xv5irC0p8gDFIwCNtce1WoRFNRHB9am5Tzaoulfp/9/SoNO2IbrkKokJIsk9mcN2HLmhU
	 0TUm2SEP9r8t+BvVCRnQTRAAM28qEbe2iDjm6mFlirZJUI0VdHkPQwUwkiJX1dhnafKKl
	 fQMWJeO2SyigpI3lpfJRP37AchVGWgo3sIYmYlsjJ/YwPx/FlmTUSMETMB3/iLJ7TTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PvbzFqQE;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23ED606D81D
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 07:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A23ED606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PvbzFqQE
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso672073eec.0
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 23:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793948660; x=1794553460; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o7CTrAhrkmxdP5PCIw1MA98wNNK+lzvPv6pZbJYyzjo=;
        b=PvbzFqQEF7vlr6zjls/cCo9152vReXo2kWlAIHXTFkK++icERMHtrZ28Kp81usgOso
         4NJXatEbyYIG3MIMWncEtGXshGJKHQ5zdy6lNUXDlc5pJvTH1kosz3aa0L0s11QYOxhP
         LQFFRzOq9p9+S5KgKay4K4NyYzhk58X9gY0utiZXyo0OloqN9LO0Hr1X0L10JvgRW4ST
         A17Nyb/HuipHHKnndG28468YrxiT1cfXcVaGMSjgKt+BzuZN49gWsYcKYjMqtoaNVK81
         dR3V2aFYmeoMgILX/8N2ylOzz4kiqDmJ8/c4th62KDYBejn9Sb1iPYkZBs7pELSAosvg
         GykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793948660; x=1794553460;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o7CTrAhrkmxdP5PCIw1MA98wNNK+lzvPv6pZbJYyzjo=;
        b=wrkeJeH61VrbSDqNKOC59iSLNEko5savHJanFaZs1wJq7/9aIcxeePD2YYIjOH7CVL
         12qCpaM7l5FNXoqBQhSG3vlfaxAvXR/QvK7/QOagQt+c2uEl6o5P5EM4xrrDGwxPnN/G
         KeNx3zZSZ8bQDiEdUElI3Lr7DTHV6V+duSj72UrsjAEEpmUVuCMbuyR37/LbT+ztBoEn
         q0c8/KtvesYKYVDzknJdwFRk4LkmdLfrx8p1DbQONBxhLTZPic44SIn2uJTodDga4gi9
         iEEBzk58yke52PiZz3+yHEF8G4EP5VsBN8x9jqSgUNACv4ySaCKbFKwFg5O+YcWJpXLy
         nPZA==
X-Forwarded-Encrypted: i=1; AKwUvBxQNT2i3W1ZzrdzO9L9vIe8Am+C6AVYfPgEyHPVEvVvnLJiwtwIO8/xq6nNGPvz45aUKfkN@lists.linux.dev
X-Gm-Message-State: APuU4Z85Ff+MkKrSDIGmVFQwy/+se5V+RWKSIIiZmx+bojf0QFLrLqzI
	ZUAqiMGZc6i/NullLDhOsOP0tTprGGcau8b0MAurTXcj+zxQ4nUmv+U6wTU8ZlVeZ2nNRA3BpL3
	1zv/U/v6MHg==
X-Received: from dleb9-n1.prod.google.com ([2002:a05:701b:4249:10b0:189:f88f:f17c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4186:10b0:184:992:c9ec
 with SMTP id a92af1059eb24-1b25d361f58mr1911349c88.38.1793948659539; Thu, 05
 Nov 2026 23:04:19 -0800 (PST)
Date: Thu,  5 Nov 2026 23:03:38 -0800
In-Reply-To: <20261106070344.329897-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261106070344.329897-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106070344.329897-15-irogers@google.com>
Subject: [PATCH v10 14/20] perf thread: Expand context analysis annotations to
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
2.56.0.455.g6c5a503b38-goog

