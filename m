Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700142;
	b=w+LJ78TcgojI3UAOyvgm+wsxCob9xyLlm3VnG0sqNLAASkaU98SVipGRWL/ko/L7nr/0
	 zwxkW9E0vgSQv+pGQZGq16i6RYG7IZHUUIvGn1NmsdIq3kW3+rOU3DzDlOgrX2z1HPxNz
	 BGP8lu7sCbpm59sKlG9dzn4s5v0Lnm4JRusA7I+MLDZXdSHQMQwfqJKxc0Hz7MygP2WIT
	 6XSB4eZDXlG1bn3sod6lcgaYSq+F/61KFmjk93SRwhI4GSD4ZEkqgKUF/vMlOtGXX6ezH
	 PQd/4lYcDWgYj77EsAYl1DQcg39gSvcmrWsZbXIX/N2oNuADU/TfED7vm7n1cBnINaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=epHYqq259OlvmbM5bUfE9T1RK5z8edIqXpc6UY2H9Ks=;
	b=a7jVWFgt6Q2pC+fQl2L5O9N4HqdW+Wc8qaTqsW08bl3maZ5xwHEsnBSfzNsDWu9x09NC
	 PoSPf3gTZjl8A+EsjA9Rr2u5AoCd2EiAuzJUSx0yC7+XjxNyhpEomAqVb2qGKaU/nqbDL
	 KK6QCQP6eMbWAYq8skd+YW8NfnuIMd4G/h1A/K/cEd/ZP9bC5/fG42EbVS6wyDTYo015D
	 IOZOIv8m93Z/IeOdHXBHVvjAkHm/0LQopWuAj7Z1FF2nqlJVKpC6d/t6WTSwHvRClvqVF
	 qAKiSvGH+9xbdays4hQnogVFzuFZlxH8YWq8oV4szLQs5MAzvv7kNHjtHw6RdiYWL1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WT1bSOhv;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8EF60A380D
	for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 20:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8EF60A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=WT1bSOhv
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso246360c88.0
        for <llvm@lists.linux.dev>; Thu, 22 Oct 2026 13:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792700141; x=1793304941; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epHYqq259OlvmbM5bUfE9T1RK5z8edIqXpc6UY2H9Ks=;
        b=WT1bSOhvxeHh2ws6l6lbyYNIP0juQQAPkHpXKAMk087GJUpafKiycCgKhcMJvESreZ
         gPfs26iiI2tmSNW6G7rHoNiST3JybS82m0Iy6mZ0ZK5oSdyXnkcSUOFZZI088R/ZMk5E
         IrTMPD0MPVRpmY184xRhN/i5GrdNyzDxbb37fIog8Rk96mQGR22SMoQQfMbXQf+It/AQ
         oVFplS6rsI8Y2dkY+6pLPsjYbV3EluSO1gmwPDiyXfJubMk+8+pGwNzLl3EBuWe9SCbV
         VPJGI6IAv3u4oI8lqVlA7MvShNA9Ek8TT+oc4GeqAxQtiaFq4BMmvPcWp7SZkaaOZ1UJ
         Mrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700141; x=1793304941;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epHYqq259OlvmbM5bUfE9T1RK5z8edIqXpc6UY2H9Ks=;
        b=C/3LpkaqmsZmwpLlD//WRQlBwBH9+eZ+cPPC8YFmmLPFbIjawqxKDtfE7esOliZeG0
         rrQ5wb+P3ZRtCY6V7KG3xx+dRb1vPmZdBpHOLqc345oLZiVn9x4Tp5RH+DrlFOXtU1PI
         GzDn/iGkdhb38mk2plexZC9vrh8zrkxX5/o1W1ahkA65XnzeBqAZq1kdozbBRKrJU4el
         SgU03JMW/JCPUucXmzLb3WCJDfdo9laS4CKXHNEpmeWinjPIpk0vAMqqC6s8AdnZ07Rt
         zZ2C1SzE9ZoyliFcSzSq2F6jCF5VcfJ/viq49/P8KyGoEa0HimBqPR6Du+bNW1cWvQkb
         hFkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvuWRxVkF1Y/Yn+P8LxIn6yhwiFda083+mgriaCTrZlasLNkuDB0ic0au63HcvoQn2dZ4b@lists.linux.dev
X-Gm-Message-State: AFq9FYIRGBlAMTZk92WVZX2hdjYhhq0IM/tmvSwOepW8JoL8Djc7yJMT
	/Ht524uxTdcoQX8ucPYKI4coJse8Pa5mk8SpAw8h7wG0X4h3nAQuzYw/+7BqC6oMSLyIdSJlX32
	AEfuNXAx9xQ==
X-Received: from dlam18-n1.prod.google.com ([2002:a05:701b:2092:10b0:15d:bfd9:370b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:404:b0:147:8a40:cdf3
 with SMTP id a92af1059eb24-195c5ad11d9mr579396c88.24.1792700140868; Thu, 22
 Oct 2026 13:15:40 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:14:47 -0700
In-Reply-To: <20261022201453.1717523-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261021223905.715051-1-irogers@google.com> <20261022201453.1717523-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261022201453.1717523-15-irogers@google.com>
Subject: [PATCH v8 14/19] perf thread: Expand context analysis annotations to
 threads and namespaces_lock
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, elver@google.com, james.clark@linaro.org, 
	jolsa@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, 
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
2.56.0.307.g5fe7bd680c-goog

