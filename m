Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518C6B665
	for <llvm@lists.linux.dev>; Thu, 15 Jan 2026 00:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768438383; cv=none; b=EuQFMso6F34aeh70BYVTbHi87uFRyVf+a9v5Neb1RATBCbsUIpsI0poR72FWJalNyCtHBzUURT6TCZHE9G1WtMko0zFZmD7Hz3tCV89U004aG90a9HTKjiIXf4Lbw1JpuAkLm58+bqya2iwi2/Gtp1hwIOo4w0KJ/M6Jrzep7kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768438383; c=relaxed/simple;
	bh=bbBXOMpnvOMscPhCRJR0c8NC2Hffo1D0TL/S+r/wfo8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nWXUO77KFJmQKaKHMbyZzvNdcG9LtedbHs8RA9nOF2kPNpb4n6uSR/GTAmvn6N8EQlkgyGEeuFKMuEgWAzJ3/kdsUXF6ObE1A8KYBlxoE07sISnsmiKG9k1PseoF7v2r4sNMtTfclUGcdfbgqI6Tb7L8aTJBiVycQX1Ze/e6J/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O36U5n+F; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O36U5n+F"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-64b830ab6baso2360757a12.1
        for <llvm@lists.linux.dev>; Wed, 14 Jan 2026 16:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768438380; x=1769043180; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dqgetmiAy0b0Qn1kDCTLs/7WDW+pjc6e0Vb7LM5rLrk=;
        b=O36U5n+FjHW6eWA/IGbmWXDc+CoPctCuyFp+IrMfmphR9evzjCvYEKsVKMAriUHTvn
         lwCHieN9IBoqMQuMlK4SPKJqkD4+9AHows5ejPafDTIWX7PfSe63GHFe5ZHZxfe52Lyq
         wxkEVI/NKrFaLj2kdhTcz6KMGfl4TRrF6Pp8KN7hH/c55ROAw9ghjlOsMHVR3xfvtJjw
         61iUn6uQGJtfpNG4Np4CPy7kiJWLHhLtup5CRxTwIYWs89U30bPyFa3Wm/u1l70LSc11
         we8pOz85nLy0szyllcgBQBwXu53RLvS+Gfe5lHzETKkPSwNwdoOuzGo4chTNq8A6Xdtd
         aHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768438380; x=1769043180;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dqgetmiAy0b0Qn1kDCTLs/7WDW+pjc6e0Vb7LM5rLrk=;
        b=p8QC0LWhn0QOGIRCrX2WN09/N6qlHMaWAUnc0Jx2bOl2WBX5V5nCdOlEMoBJchEyS4
         /r0OJfww29C0s1hOvZz95dtvRar4a+5zA2uk98N2pul6FlGoBBLh6mO8qxsEFMV18PfP
         tkf1J9HPDCopCee6C0Lr8pZ2FJt1F9PU0++VzRgALSzQHq/LGUxWuTxqsnJubhEipXTH
         LVCdomkG7psReO3Dt1VndaHp4R24zRnNFVeMORPe6c8EweOmPpnCzxnmTkjfi7tYgss4
         qj7jXAYbP6PyQ5Acaj5gBiltveIIP6iZHCpoWZYuxYh0oUgbyt2T3yCP4UE8NFMrZCXu
         Su0A==
X-Forwarded-Encrypted: i=1; AJvYcCVqmTKNheLHS2dxMAjDlHqveeNUBRWEeoh4c0/sI80e5gWiYVc0TOQwg+Ho7yyliRIdSbGF@lists.linux.dev
X-Gm-Message-State: AOJu0YyalOaj2GeiWLJmw4j2rRbXKDwrbL0lZpfNaKh1ozS4I+nMDZ7R
	q3fKlnhasPBUUK8L9XiyIPyJYTfOnhdx+AgKPz0Z0Ed2u4Aa5ltw4+f7zMw1KoJG9BztbDaZD7J
	biA==
X-Received: from ejcrm13.prod.google.com ([2002:a17:907:6b0d:b0:b80:10d3:6918])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:1ca7:b0:b87:2f29:2054
 with SMTP id a640c23a62f3a-b8777ad3f47mr117542266b.8.1768438379728; Wed, 14
 Jan 2026 16:52:59 -0800 (PST)
Date: Thu, 15 Jan 2026 01:51:25 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260115005231.1211866-1-elver@google.com>
Subject: [PATCH tip/locking/core] compiler-context-analysis: Support immediate
 acquisition after initialization
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="UTF-8"

When a lock is initialized (e.g. mutex_init()), we assume/assert that
the context lock is held to allow initialization of guarded members
within the same scope.

However, this previously prevented actually acquiring the lock within
that same scope, as the analyzer would report a double-lock warning:

  mutex_init(&mtx);
  ...
  mutex_lock(&mtx); // acquiring mutex 'mtx' that is already held

To fix (without new init+lock APIs), we can tell the analysis to treat
the "held" context lock resulting from initialization as reentrant,
allowing subsequent acquisitions to succeed.

To do so *only* within the initialization scope, we can cast the lock
pointer to any reentrant type for the init assume/assert. Introduce a
generic reentrant context lock type `struct __ctx_lock_init` and add
`__inits_ctx_lock()` that casts the lock pointer to this type before
assuming/asserting it.

This ensures that the initial "held" state is reentrant, allowing
patterns like:

  mutex_init(&lock);
  ...
  mutex_lock(&lock);

to compile without false positives, and avoids having to make all
context lock types reentrant outside an initialization scope.

The caveat here is missing real double-lock bugs right after init scope.
However, this is a classic trade-off of avoiding false positives against
(unlikely) false negatives.

Longer-term, Peter suggested to create scoped init-guards [1], which
will both fix the issue in a more robust way and also denote clearly
where initialization starts and ends. However, that requires new APIs,
and won't help bridge the gap for code that just wants to opt into the
analysis with as little other changes as possible (as suggested in [2]).

Link: https://lore.kernel.org/all/20251212095943.GM3911114@noisy.programming.kicks-ass.net/ [1]
Link: https://lore.kernel.org/all/57062131-e79e-42c2-aa0b-8f931cb8cac2@acm.org/ [2]
Reported-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>
---
 include/linux/compiler-context-analysis.h | 12 ++++++++++++
 include/linux/local_lock_internal.h       |  6 +++---
 include/linux/mutex.h                     |  2 +-
 include/linux/rwlock.h                    |  4 ++--
 include/linux/rwlock_rt.h                 |  2 +-
 include/linux/rwsem.h                     |  4 ++--
 include/linux/seqlock.h                   |  2 +-
 include/linux/spinlock.h                  |  8 ++++----
 include/linux/spinlock_rt.h               |  2 +-
 include/linux/ww_mutex.h                  |  2 +-
 lib/test_context-analysis.c               |  3 +++
 11 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
index e86b8a3c2f89..89e893e47bb7 100644
--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -43,6 +43,14 @@
 # define __assumes_ctx_lock(...)		__attribute__((assert_capability(__VA_ARGS__)))
 # define __assumes_shared_ctx_lock(...)	__attribute__((assert_shared_capability(__VA_ARGS__)))
 
+/*
+ * Generic reentrant context lock type that we cast to when initializing context
+ * locks with __assumes_ctx_lock(), so that we can support guarded member
+ * initialization, but also immediate use after initialization.
+ */
+struct __ctx_lock_type(init_generic) __reentrant_ctx_lock __ctx_lock_init;
+# define __inits_ctx_lock(var) __assumes_ctx_lock((const struct __ctx_lock_init *)(var))
+
 /**
  * __guarded_by - struct member and globals attribute, declares variable
  *                only accessible within active context
@@ -120,6 +128,8 @@
 		__attribute__((overloadable)) __assumes_ctx_lock(var) { }				\
 	static __always_inline void __assume_shared_ctx_lock(const struct name *var)			\
 		__attribute__((overloadable)) __assumes_shared_ctx_lock(var) { }			\
+	static __always_inline void __init_ctx_lock(const struct name *var)				\
+		__attribute__((overloadable)) __inits_ctx_lock(var) { }					\
 	struct name
 
 /**
@@ -162,6 +172,7 @@
 # define __releases_shared_ctx_lock(...)
 # define __assumes_ctx_lock(...)
 # define __assumes_shared_ctx_lock(...)
+# define __inits_ctx_lock(var)
 # define __returns_ctx_lock(var)
 # define __guarded_by(...)
 # define __pt_guarded_by(...)
@@ -176,6 +187,7 @@
 # define __release_shared_ctx_lock(var)		do { } while (0)
 # define __assume_ctx_lock(var)			do { (void)(var); } while (0)
 # define __assume_shared_ctx_lock(var)			do { (void)(var); } while (0)
+# define __init_ctx_lock(var)			do { (void)(var); } while (0)
 # define context_lock_struct(name, ...)		struct __VA_ARGS__ name
 # define disable_context_analysis()
 # define enable_context_analysis()
diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock_internal.h
index 7843ab9059c2..53f44719db73 100644
--- a/include/linux/local_lock_internal.h
+++ b/include/linux/local_lock_internal.h
@@ -86,13 +86,13 @@ do {								\
 			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
 			      LD_LOCK_PERCPU);			\
 	local_lock_debug_init(lock);				\
-	__assume_ctx_lock(lock);				\
+	__init_ctx_lock(lock);					\
 } while (0)
 
 #define __local_trylock_init(lock)				\
 do {								\
 	__local_lock_init((local_lock_t *)lock);		\
-	__assume_ctx_lock(lock);				\
+	__init_ctx_lock(lock);					\
 } while (0)
 
 #define __spinlock_nested_bh_init(lock)				\
@@ -104,7 +104,7 @@ do {								\
 			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
 			      LD_LOCK_NORMAL);			\
 	local_lock_debug_init(lock);				\
-	__assume_ctx_lock(lock);				\
+	__init_ctx_lock(lock);					\
 } while (0)
 
 #define __local_lock_acquire(lock)					\
diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 89977c215cbd..5d2ef75c4fdb 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -62,7 +62,7 @@ do {									\
 	static struct lock_class_key __key;				\
 									\
 	__mutex_init((mutex), #mutex, &__key);				\
-	__assume_ctx_lock(mutex);					\
+	__init_ctx_lock(mutex);						\
 } while (0)
 
 /**
diff --git a/include/linux/rwlock.h b/include/linux/rwlock.h
index 65a5b55e1bcd..7e171634d2c4 100644
--- a/include/linux/rwlock.h
+++ b/include/linux/rwlock.h
@@ -22,11 +22,11 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__rwlock_init((lock), #lock, &__key);			\
-	__assume_ctx_lock(lock);				\
+	__init_ctx_lock(lock);					\
 } while (0)
 #else
 # define rwlock_init(lock)					\
-	do { *(lock) = __RW_LOCK_UNLOCKED(lock); __assume_ctx_lock(lock); } while (0)
+	do { *(lock) = __RW_LOCK_UNLOCKED(lock); __init_ctx_lock(lock); } while (0)
 #endif
 
 #ifdef CONFIG_DEBUG_SPINLOCK
diff --git a/include/linux/rwlock_rt.h b/include/linux/rwlock_rt.h
index 37b387dcab21..1e087a6ce2cf 100644
--- a/include/linux/rwlock_rt.h
+++ b/include/linux/rwlock_rt.h
@@ -22,7 +22,7 @@ do {							\
 							\
 	init_rwbase_rt(&(rwl)->rwbase);			\
 	__rt_rwlock_init(rwl, #rwl, &__key);		\
-	__assume_ctx_lock(rwl);				\
+	__init_ctx_lock(rwl);				\
 } while (0)
 
 extern void rt_read_lock(rwlock_t *rwlock)	__acquires_shared(rwlock);
diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
index 8da14a08a4e1..6ea7d2a23580 100644
--- a/include/linux/rwsem.h
+++ b/include/linux/rwsem.h
@@ -121,7 +121,7 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__init_rwsem((sem), #sem, &__key);			\
-	__assume_ctx_lock(sem);					\
+	__init_ctx_lock(sem);					\
 } while (0)
 
 /*
@@ -175,7 +175,7 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__init_rwsem((sem), #sem, &__key);			\
-	__assume_ctx_lock(sem);					\
+	__init_ctx_lock(sem);					\
 } while (0)
 
 static __always_inline int rwsem_is_locked(const struct rw_semaphore *sem)
diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
index 113320911a09..a0670adb4b6e 100644
--- a/include/linux/seqlock.h
+++ b/include/linux/seqlock.h
@@ -816,7 +816,7 @@ static __always_inline void write_seqcount_latch_end(seqcount_latch_t *s)
 	do {								\
 		spin_lock_init(&(sl)->lock);				\
 		seqcount_spinlock_init(&(sl)->seqcount, &(sl)->lock);	\
-		__assume_ctx_lock(sl);					\
+		__init_ctx_lock(sl);					\
 	} while (0)
 
 /**
diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index 396b8c5d6c1b..e50372a5f7d1 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -106,12 +106,12 @@ do {									\
 	static struct lock_class_key __key;				\
 									\
 	__raw_spin_lock_init((lock), #lock, &__key, LD_WAIT_SPIN);	\
-	__assume_ctx_lock(lock);					\
+	__init_ctx_lock(lock);						\
 } while (0)
 
 #else
 # define raw_spin_lock_init(lock)				\
-	do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); __assume_ctx_lock(lock); } while (0)
+	do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); __init_ctx_lock(lock); } while (0)
 #endif
 
 #define raw_spin_is_locked(lock)	arch_spin_is_locked(&(lock)->raw_lock)
@@ -324,7 +324,7 @@ do {								\
 								\
 	__raw_spin_lock_init(spinlock_check(lock),		\
 			     #lock, &__key, LD_WAIT_CONFIG);	\
-	__assume_ctx_lock(lock);				\
+	__init_ctx_lock(lock);					\
 } while (0)
 
 #else
@@ -333,7 +333,7 @@ do {								\
 do {						\
 	spinlock_check(_lock);			\
 	*(_lock) = __SPIN_LOCK_UNLOCKED(_lock);	\
-	__assume_ctx_lock(_lock);		\
+	__init_ctx_lock(_lock);			\
 } while (0)
 
 #endif
diff --git a/include/linux/spinlock_rt.h b/include/linux/spinlock_rt.h
index 0a585768358f..154d7290bd99 100644
--- a/include/linux/spinlock_rt.h
+++ b/include/linux/spinlock_rt.h
@@ -20,7 +20,7 @@ static inline void __rt_spin_lock_init(spinlock_t *lock, const char *name,
 do {								\
 	rt_mutex_base_init(&(slock)->lock);			\
 	__rt_spin_lock_init(slock, name, key, percpu);		\
-	__assume_ctx_lock(slock);				\
+	__init_ctx_lock(slock);					\
 } while (0)
 
 #define _spin_lock_init(slock, percpu)				\
diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
index 58e959ee10e9..ecb5564ee70d 100644
--- a/include/linux/ww_mutex.h
+++ b/include/linux/ww_mutex.h
@@ -107,7 +107,7 @@ context_lock_struct(ww_acquire_ctx) {
  */
 static inline void ww_mutex_init(struct ww_mutex *lock,
 				 struct ww_class *ww_class)
-	__assumes_ctx_lock(lock)
+	__inits_ctx_lock(lock)
 {
 	ww_mutex_base_init(&lock->base, ww_class->mutex_name, &ww_class->mutex_key);
 	lock->ctx = NULL;
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 1c5a381461fc..2f733b5cc650 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -165,6 +165,9 @@ static void __used test_mutex_init(struct test_mutex_data *d)
 {
 	mutex_init(&d->mtx);
 	d->counter = 0;
+
+	mutex_lock(&d->mtx);
+	mutex_unlock(&d->mtx);
 }
 
 static void __used test_mutex_lock(struct test_mutex_data *d)
-- 
2.52.0.457.g6b5491de43-goog

