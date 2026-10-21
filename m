Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602723;
	b=WHjgGKWxv+TsFOPMh35+mh7B5/0pH4rkPnikMqPM1Z+bZNUXZprBDh8++uBbuYL9z4TA
	 85tggpJTjX1KDH1jfOrnUnr2yr0WoSE7L9xJfrKn5318UeyDijEBEbNcLKoYIon/AT4Gw
	 /WEneeJHdrnpmHCTDfZUJMeqzLNCymAXveVHXx8l0t3yu2KKflUPGPH5g5JWfMhOlh2fY
	 sPxop7qRofE1tUzARPrjRN0CPmOhCS518XrwPFeSR4oWTssnaZCs/yLGHRPF5yre6FORW
	 mlt5xcdSzLTsclqhtCxpQLwS//IJYlcHgNzArlGMOJQUawKnr8qHr0n6O7dvNWYfTNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tSMiQ6NIUcAT0NRQb854JTEOyM6xl86cQuNOuZ1ci/Y=;
	b=v5Jou6Mg3Ehboj2WAU8GtYRAOQJMciujqWzcCuIC2sS3PAIN7EHqIhcqQEWzVRIR+Wml
	 QSKz2EJycO8Pa45o4SZlJfpe70eaI8dxV+rF6SkQWPVOoiZy8hDY3w7B8ICcBXPdHGY/Y
	 H9Hd8TCFBhRbrXhHVqtHG7J8WMlxc45UPvMNZSHqDMtztmQ59C2xCtUecEOOdpb0GEnRw
	 I5QpwhpFCoHfamMIj57VpygPAh+BN/2XYXDnT+Q7uP+uNtdpaQGtp+b4H6W1DVaH4kASC
	 IhgRY1DSjTU3TR7qJNynGufDqebtDGX4dpgzgNUjX3RRDYvxc/EUFP4D/geiWCHxgWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=N6bSMX4x;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D28F60A260A
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 17:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D28F60A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=N6bSMX4x
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so1724600eec.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792602722; x=1793207522; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tSMiQ6NIUcAT0NRQb854JTEOyM6xl86cQuNOuZ1ci/Y=;
        b=N6bSMX4xJvpLghuRA2yTn4psEDHwaM7rLgotAD1JXVkxdVwmHvTv0aR/0DelkFeXKF
         EtHRj9g8sE5DzT7YEgjT8f3h7XHKfmZ+fkshbEGAAAPDBbC3wEhO6Eh1H+m8HdyrPzuz
         KrDwUqCuyM3EXkMBrafWeWqJTyO/YHViAUTNC+5UTPhfkfHE+Dxyj9vlkc0jtTbqeTZI
         Vb71jF0Zz/OcCy247QLH6iRi6gB1U1L2tirdp8IoECCvIc9y5va5LfaKKr8MfN0R5TRs
         Pdyy/XdODwlgH3PiAf/MTEHW1yo6bjaaNuRQeqOe063LWjJzOQEZ/YnmHnEytKqxCRGy
         rrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602722; x=1793207522;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSMiQ6NIUcAT0NRQb854JTEOyM6xl86cQuNOuZ1ci/Y=;
        b=u0chPy5Bp96Lt7wpZZV+QXsU/G/ruwRPCTBa5DIW6CCYsrnmHy0oCeASB35Biy4nbj
         8xuVPizDQLw0abQBuXMGjIvU0GXsQ1McsrBf6hSSsHnPIpuc9Y2Lxp1oxGDlh+5CtZuG
         wgMwNxjsqg8m3DdrNVjB0Md8sJavRTDg46buQdvU/voggUEEh5fLOxA8wUrlhs6fVfrB
         IPfAC8iN7Gde5z1+Phb6xHFQZ5bOraZW99XLAuieCApHbFbIw9+GxoWPgE+3s/+/+hPI
         hggH0raEf0SinulRrEm+Hu6KDsKihM4zYW/mnTZoOYImWYKLQAXV9QPcIvbWvyGMA2xG
         ab9A==
X-Forwarded-Encrypted: i=1; AKwUvBzq5LiVVvLzq/dmfG3Gv1OcFtACG2WGr2yjI+h5kTr9o1FA9LwY+FpDxxwfPFQNzC+VqXWa@lists.linux.dev
X-Gm-Message-State: AFq9FYJvR/oMxouOanT4N5eKw7RjHgZp0SdnDE4Hy7Y+izDpr1AJV4v3
	JLwjJFVsNaebn/6JEQkYyHC0qyoX+wek7zPNc8vdRU+uWrM38gmDc7SfLmJ3wpVpARNhhLMQM2H
	/ivjsguQ/qg==
X-Received: from dlbvg25.prod.google.com ([2002:a05:7022:7f19:b0:182:2feb:a149])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4642:b0:188:ea93:6cf9
 with SMTP id a92af1059eb24-190a709edf1mr2930187c88.43.1792602721780; Wed, 21
 Oct 2026 10:12:01 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:10:38 -0700
In-Reply-To: <20261021171044.155240-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261020163640.746159-1-irogers@google.com> <20261021171044.155240-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261021171044.155240-13-irogers@google.com>
Subject: [PATCH v6 12/17] perf thread: Expand context analysis annotations to
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

