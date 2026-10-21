Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792622392;
	b=JLU2Vq12xMcXACa63wDeOlpgREhdar/eQzRyYbnNReVJki2wjycEc6nRIbKwOYzk8TX/
	 PiRB32+YJhK+AV9H9KUQ9rjG5+jOl3DL/sldEv4XnKLGYDgrtfSL7BCd4Zp0MxUbEx0WK
	 s0HNP9nYRpwBIq1sdIbhBXiOrtoCGPmtFNb1ckba+AGuOia++TOpcOLGbn86GVC5iBicJ
	 Dy/33TLCcxLPTVf+f6b4XRx179fLeUTjG0m64epypiRc3kRn8HSVsFJw5Z9hbfQbocTAn
	 p3PKpVmgXt3ERBnmrFikAeKVzvbJQYX9x7r7HSJhQ0NDF5j/+0Dexo+KBOPmWrQHbYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792622392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tSMiQ6NIUcAT0NRQb854JTEOyM6xl86cQuNOuZ1ci/Y=;
	b=f6/zV2t37uUegZkBXv2fFmShpURwkDTfkfSIBqmupnH4jGBAsUUV0uYYKOFUDSac/aZD
	 WOTEB1u7W74WjSO0THUZGGk8uHKWBoL2msFjJbRcGmOpj3dZ+qOoj8cUUhkAhkJqjtrgw
	 8SEoQOInjIbklgwZDAZPpm1DuCUyWREAIdZgs9Ve/GUQApn1JzV7L/M1Js5xW14V6c0/u
	 JytIfAK1XpjNXLtmble7MJfg6QhtyNVrT4bV0sEk7J6Q928jOA2JhCTb4HN/hwQL5stMJ
	 Sg3qZ1jK4JcNFdxYJGVoYxXkoJtHfLNdypWQ503/iIHXn5rHEs85xcCT/HQmjZxVLpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ekPaGSYK;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05C7606A31D
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 22:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A05C7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ekPaGSYK
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c902e0da2so402791eec.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 15:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792622391; x=1793227191; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSMiQ6NIUcAT0NRQb854JTEOyM6xl86cQuNOuZ1ci/Y=;
        b=ekPaGSYKrrFQoSENj4+HzHnnbcTS3bb/zMiU/H+7iLBJVUgSP1V2XK+1CGHhDSh/dv
         ZWkXKSQp4JUz7nYFoWXzTrsZdCrWWUQt+WiwBIEfIFUBLbiCEqaO6CSG3ohkNP93tkQj
         yzuoOPbeNy8RVqfQuAu5+ohqjt+GLc0Xsq3nOiVbu7DLvZoQAygyUsBzG2/jVFF3Us/D
         eoRKNibFdmV3trY+70WYppYEE+CKmP8WrSbD+Tq0Gmh69sI9DfvmOAKssVaxAzb0M46i
         cJgiGwzbhvbZ3G3y5rohZtRQY2KyMO/YJyEgmF+Qk1zIP2DeQ9g6ow8pNf6ogUiqc3ay
         0kBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792622391; x=1793227191;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSMiQ6NIUcAT0NRQb854JTEOyM6xl86cQuNOuZ1ci/Y=;
        b=FBOwHhUl5hwzTK0qbn1VLqBivFYy/0VLasWcVbPmg3jtYhv6CsPXoqx0uO7q74DVXs
         /Tv/U/LdasQpyK2i8UZIEwhmfM28MHD3zsLlMZntdLgupdYoxYnoYtes5QPs78nlrHdN
         eqFhrXRNIbKbG9wr3Sc1KVKzVyh0XT48hApETR9En1jHBmCghDJLEfye9hcgF1yfVPxg
         zeIoyWpdpDJWzSGAUt2JPXCDsbsVAE/WoyOEVv00RkTJ9PW1JG8vNlukAumt7O1Fduot
         4wV7bF36zArpMHiC6s7MOjOoFjj4OBEiC9lS99SlPlZDFTAywdLHfNyUJj25W1suKlpY
         4fYA==
X-Forwarded-Encrypted: i=1; AKwUvBzjjqV3KsQ8s5emaVZmgKFNbCMPhDArP45K3+rysww8Q445dYpPoviSxBTFnjrjvcfr7HNf@lists.linux.dev
X-Gm-Message-State: AFq9FYJk6phPT+/h7wSY5ZBl7XcZVvhSrebwcM7HTkdOL2T0VmGVJc1i
	WqXV/t2wM6rOk/098CbD0ljGStyJix0TyP8ha/Z3F0/kjjIWLNqjKDtGJTMafshJWs7/Ft4HMop
	qJ5lZmO/Faw==
X-Received: from dycpq17.prod.google.com ([2002:a05:7301:fd11:b0:351:5787:a37a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:42d1:20b0:185:e68c:904c
 with SMTP id a92af1059eb24-192f2f0ae92mr831963c88.7.1792622390367; Wed, 21
 Oct 2026 15:39:50 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:39:00 -0700
In-Reply-To: <20261021223905.715051-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261021171044.155240-1-irogers@google.com> <20261021223905.715051-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021223905.715051-13-irogers@google.com>
Subject: [PATCH v7 12/17] perf thread: Expand context analysis annotations to
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
2.56.0.218.g1ec904b173-goog

