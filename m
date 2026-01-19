Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8695358D33
	for <llvm@lists.linux.dev>; Mon, 19 Jan 2026 09:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815666; cv=none; b=cpQj/2EI9eXWHr9TrvcQjghzdZ3swtN31/nRz0Ru3b4c1Xx4COCEUDAuKwLLDHPINSTIqg8ro7tDrSTMdk5JFtDlztUPkIEeqZQVhJhc2+LJVbaZzZ25vryJ89PNjyq4kSR6+Lz00t1iEhUDRY7hqtxDkQaot34q0m62F3TnrMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815666; c=relaxed/simple;
	bh=Rz5y7C4R6h2lPczYksr0SVq/IrzgSt5kMTodp36I+ag=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Eb+BvBht71QhVOdFOie8E7ZW2KGSKvZdpatqLYb7lvxJNBPWYQr+4h5X4KBthgUq3K1+xWpB20LqUpcFdBg6QW9802ndt5Xuj/OkQtyH6Ki8n0KCv+ObzguXvdq6NrD/BOgH/erxmX6OStF2wOucA1mr74pFcLUNpR5JDwY5o54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CqU1LLQg; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CqU1LLQg"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b86fd61e3b4so459328066b.0
        for <llvm@lists.linux.dev>; Mon, 19 Jan 2026 01:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768815662; x=1769420462; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hOlRW9xg19eCgYwriGsA0YBy8PVXki3QHZit/P09OME=;
        b=CqU1LLQgdvwPJQddeCWqNNNug1NcqUTZJtqotESVBt1zp1oOnb+Epz7RQipbrmRoU0
         K8gfNClkLuu+qzzWLoVPKHUJWEFHbT7zclt8E8CJvx8P+6RFQG9i6hQ0N0B4x4fXSqvr
         ti+zlNd3K4TZVZxwd1txCsMNJdZTi7b6FFT6gflJ7wxSgWLUbXqP1MHRLnI+mnxKwwTt
         XcuJs0w758MnghR/2Q7+K/p4iQPMnj4fxnm/Eg+3XbxJ+tkIuRQ0C/7ZEU7x2mTaDuUg
         tNshIklFoD4oRw4znu1ZhhuK5fpdba4/lirxn98RB2djcANRhwB9KVaIKwtIOToYxkih
         aulQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815662; x=1769420462;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hOlRW9xg19eCgYwriGsA0YBy8PVXki3QHZit/P09OME=;
        b=xUcYzv5/s3pDzoev78srkd8wYdxCfJZd47TRFSAQBz+dm+HwVNuKd9o+1NpXuRwjuY
         8m6EQS2o8xRX5YrJYjLUqVCAx5MCjJQKpLSTzmhoaXFCxe9PvOj74fZshi0y+Kr7FzjX
         bIed2m6VEpfIsq9I3CVsI6Uh0usckluIJUlYRw4+l/id0l09E8rqZm458bigWxIqAEGv
         XKDn9vKnBiQV5imz3VY7EtPQY5QtqKcJg/woYU67BszjRARkEiBSXL1AuOmgZ5iAVzfT
         tAAaGgzQg+VhA8oZD0zbWBVwCqKUPjHy7dwY6tAAkN718eBkrzyehcoPLuIC/a0eq52z
         /ofA==
X-Forwarded-Encrypted: i=1; AJvYcCX3PRYBdzTFAHtAO5D51KP8TH4A6O6ypoHPINCbTEWKHOZP0yIEJVBiQgnO2YHFHFxr5eVh@lists.linux.dev
X-Gm-Message-State: AOJu0YyTzhFkqCPh0LtSHypegtFYhTh1uMFaAm6sM865xSGQBpFE8Jmt
	rXDnAf03FSiRkl7tUskvTZJy/JFaOBH3SWuJemBIq3rULn1gc4a+R0kJont+F9QHSbyyI5PH4MB
	YHw==
X-Received: from ejek27.prod.google.com ([2002:a17:906:2a5b:b0:b7a:21aa:899e])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:3f21:b0:b87:25a7:3ea0
 with SMTP id a640c23a62f3a-b87968f6e82mr875438166b.25.1768815662390; Mon, 19
 Jan 2026 01:41:02 -0800 (PST)
Date: Mon, 19 Jan 2026 10:05:56 +0100
In-Reply-To: <20260119094029.1344361-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260119094029.1344361-1-elver@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260119094029.1344361-7-elver@google.com>
Subject: [PATCH tip/locking/core 6/6] compiler-context-analysis: Remove
 __assume_ctx_lock from initializers
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Christoph Hellwig <hch@lst.de>, Steven Rostedt <rostedt@goodmis.org>, Bart Van Assche <bvanassche@acm.org>, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Remove __assume_ctx_lock() from lock initializers.

Implicitly asserting an active context during initialization caused
false-positive double-lock errors when acquiring a lock immediately after its
initialization. Moving forward, guarded member initialization must either:

	1. Use guard(type_init)(&lock) or scoped_guard(type_init, ...).
	2. Use context_unsafe() for simple initialization.

Link: https://lore.kernel.org/all/57062131-e79e-42c2-aa0b-8f931cb8cac2@acm.org/
Reported-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/local_lock_internal.h | 3 ---
 include/linux/mutex.h               | 1 -
 include/linux/rwlock.h              | 3 +--
 include/linux/rwlock_rt.h           | 1 -
 include/linux/rwsem.h               | 2 --
 include/linux/seqlock.h             | 1 -
 include/linux/spinlock.h            | 5 +----
 include/linux/spinlock_rt.h         | 1 -
 include/linux/ww_mutex.h            | 1 -
 lib/test_context-analysis.c         | 6 ------
 10 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock_internal.h
index 4521c40895f8..ebfcdf517224 100644
--- a/include/linux/local_lock_internal.h
+++ b/include/linux/local_lock_internal.h
@@ -87,13 +87,11 @@ do {								\
 			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
 			      LD_LOCK_PERCPU);			\
 	local_lock_debug_init(lock);				\
-	__assume_ctx_lock(lock);				\
 } while (0)
 
 #define __local_trylock_init(lock)				\
 do {								\
 	__local_lock_init((local_lock_t *)lock);		\
-	__assume_ctx_lock(lock);				\
 } while (0)
 
 #define __spinlock_nested_bh_init(lock)				\
@@ -105,7 +103,6 @@ do {								\
 			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
 			      LD_LOCK_NORMAL);			\
 	local_lock_debug_init(lock);				\
-	__assume_ctx_lock(lock);				\
 } while (0)
 
 #define __local_lock_acquire(lock)					\
diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 6b12009351d2..ecaa0440f6ec 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -62,7 +62,6 @@ do {									\
 	static struct lock_class_key __key;				\
 									\
 	__mutex_init((mutex), #mutex, &__key);				\
-	__assume_ctx_lock(mutex);					\
 } while (0)
 
 /**
diff --git a/include/linux/rwlock.h b/include/linux/rwlock.h
index 65a5b55e1bcd..3390d21c95dd 100644
--- a/include/linux/rwlock.h
+++ b/include/linux/rwlock.h
@@ -22,11 +22,10 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__rwlock_init((lock), #lock, &__key);			\
-	__assume_ctx_lock(lock);				\
 } while (0)
 #else
 # define rwlock_init(lock)					\
-	do { *(lock) = __RW_LOCK_UNLOCKED(lock); __assume_ctx_lock(lock); } while (0)
+	do { *(lock) = __RW_LOCK_UNLOCKED(lock); } while (0)
 #endif
 
 #ifdef CONFIG_DEBUG_SPINLOCK
diff --git a/include/linux/rwlock_rt.h b/include/linux/rwlock_rt.h
index 37b387dcab21..5353abbfdc0b 100644
--- a/include/linux/rwlock_rt.h
+++ b/include/linux/rwlock_rt.h
@@ -22,7 +22,6 @@ do {							\
 							\
 	init_rwbase_rt(&(rwl)->rwbase);			\
 	__rt_rwlock_init(rwl, #rwl, &__key);		\
-	__assume_ctx_lock(rwl);				\
 } while (0)
 
 extern void rt_read_lock(rwlock_t *rwlock)	__acquires_shared(rwlock);
diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
index ea1bbdb57a47..9bf1d93d3d7b 100644
--- a/include/linux/rwsem.h
+++ b/include/linux/rwsem.h
@@ -121,7 +121,6 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__init_rwsem((sem), #sem, &__key);			\
-	__assume_ctx_lock(sem);					\
 } while (0)
 
 /*
@@ -175,7 +174,6 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__init_rwsem((sem), #sem, &__key);			\
-	__assume_ctx_lock(sem);					\
 } while (0)
 
 static __always_inline int rwsem_is_locked(const struct rw_semaphore *sem)
diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
index 22216df47b0f..c0c6235dff59 100644
--- a/include/linux/seqlock.h
+++ b/include/linux/seqlock.h
@@ -817,7 +817,6 @@ static __always_inline void write_seqcount_latch_end(seqcount_latch_t *s)
 	do {								\
 		spin_lock_init(&(sl)->lock);				\
 		seqcount_spinlock_init(&(sl)->seqcount, &(sl)->lock);	\
-		__assume_ctx_lock(sl);					\
 	} while (0)
 
 /**
diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index 7b11991c742a..e1e2f144af9b 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -106,12 +106,11 @@ do {									\
 	static struct lock_class_key __key;				\
 									\
 	__raw_spin_lock_init((lock), #lock, &__key, LD_WAIT_SPIN);	\
-	__assume_ctx_lock(lock);					\
 } while (0)
 
 #else
 # define raw_spin_lock_init(lock)				\
-	do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); __assume_ctx_lock(lock); } while (0)
+	do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
 #endif
 
 #define raw_spin_is_locked(lock)	arch_spin_is_locked(&(lock)->raw_lock)
@@ -324,7 +323,6 @@ do {								\
 								\
 	__raw_spin_lock_init(spinlock_check(lock),		\
 			     #lock, &__key, LD_WAIT_CONFIG);	\
-	__assume_ctx_lock(lock);				\
 } while (0)
 
 #else
@@ -333,7 +331,6 @@ do {								\
 do {						\
 	spinlock_check(_lock);			\
 	*(_lock) = __SPIN_LOCK_UNLOCKED(_lock);	\
-	__assume_ctx_lock(_lock);		\
 } while (0)
 
 #endif
diff --git a/include/linux/spinlock_rt.h b/include/linux/spinlock_rt.h
index 0a585768358f..373618a4243c 100644
--- a/include/linux/spinlock_rt.h
+++ b/include/linux/spinlock_rt.h
@@ -20,7 +20,6 @@ static inline void __rt_spin_lock_init(spinlock_t *lock, const char *name,
 do {								\
 	rt_mutex_base_init(&(slock)->lock);			\
 	__rt_spin_lock_init(slock, name, key, percpu);		\
-	__assume_ctx_lock(slock);				\
 } while (0)
 
 #define _spin_lock_init(slock, percpu)				\
diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
index 58e959ee10e9..c47d4b9b88b3 100644
--- a/include/linux/ww_mutex.h
+++ b/include/linux/ww_mutex.h
@@ -107,7 +107,6 @@ context_lock_struct(ww_acquire_ctx) {
  */
 static inline void ww_mutex_init(struct ww_mutex *lock,
 				 struct ww_class *ww_class)
-	__assumes_ctx_lock(lock)
 {
 	ww_mutex_base_init(&lock->base, ww_class->mutex_name, &ww_class->mutex_key);
 	lock->ctx = NULL;
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 0f05943d957f..140efa8a9763 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -542,12 +542,6 @@ struct test_ww_mutex_data {
 	int counter __guarded_by(&mtx);
 };
 
-static void __used test_ww_mutex_init(struct test_ww_mutex_data *d)
-{
-	ww_mutex_init(&d->mtx, &ww_class);
-	d->counter = 0;
-}
-
 static void __used test_ww_mutex_lock_noctx(struct test_ww_mutex_data *d)
 {
 	if (!ww_mutex_lock(&d->mtx, NULL)) {
-- 
2.52.0.457.g6b5491de43-goog

