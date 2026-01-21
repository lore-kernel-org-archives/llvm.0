Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1050D43E498;
	Wed, 21 Jan 2026 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768994005; cv=none; b=uJNaktRym+Vu0jKOCBQYKKbE1GyiuEftHwVONa4KDmHujPLaKk+JbRG/iZXWN+/zZ9NJBMQtcTrLPZvPaj8YMM4tJaN/SVFFoxFYkUtUy9l6QO+ncL7znv5R7rGK+bIhj3W+OSDcUhdHgLwl1PPKADl/WTAkJ5sywV/A7Eliews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768994005; c=relaxed/simple;
	bh=gf7HGLPmJRyJabHKvsFXvXcchddVQjW1K/zHdf0nruY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=DPqSW13WVttPcKfZeMzq6v3e/Vbfyr3lsCCD0B66zTX35fEVof5RwoghMecR1TLgryfGrob5MafveNo7fapnpfhWrGvoV3OhIdwCag6BHyYouRLUzKVq2uRzVYyYUSUmt6Fs6qQ5ImxKlOx2rsH0W/Ezp1CDlA/amu2KBE69KOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EZwrOEde; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EZwrOEde"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=SvLN+jltMnHOXswWPJZdg4kjJwgVTHy5ikJ8lA1+mos=; b=EZwrOEdeTkT+Ofqbj2HSvquVuR
	ICvPX8CP1zbmquULGVUiiuJSG0mGuLvGmmtYLWuOiwmHjHnhDosEVy5YBPAyxmFJMQpXUiW9D1+2N
	QNKlPe8J02frqM/04dh8pzmY5zLAKWmHGnBVnOcsfIWxtHeuk1FDISG5AVZ3CLeQoNd2mo1QnnKfF
	8Twvu5kRcP1KwZwJIa0a2FZsAu7MX+MoyaoNq7fiozKyvcJWUUPbUUEtXrxOKuIrwjYe+8qf0BeOV
	mAHJ//QCf8O52Lfqf0zjp4gkllBPejpFAEtSeZ2jEy+TYbusJai7cbJ5lyvDgqicqzSUf4Lwqh79V
	JDu/UMzQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW9E-0000000GGcZ-3rj3;
	Wed, 21 Jan 2026 11:13:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 94E6C3008E2; Wed, 21 Jan 2026 12:13:10 +0100 (CET)
Message-ID: <20260121111213.745353747@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 21 Jan 2026 12:07:06 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: elver@google.com
Cc: linux-kernel@vger.kernel.org,
 bigeasy@linutronix.de,
 peterz@infradead.org,
 mingo@kernel.org,
 tglx@linutronix.de,
 will@kernel.org,
 boqun.feng@gmail.com,
 longman@redhat.com,
 hch@lst.de,
 rostedt@goodmis.org,
 bvanassche@acm.org,
 llvm@lists.linux.dev
Subject: [RFC][PATCH 2/4] locking/mutex: Add context analysis
References: <20260121110704.221498346@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Add compiler context analysis annotations.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/mutex_types.h |    2 +-
 kernel/locking/Makefile     |    2 ++
 kernel/locking/mutex.c      |   42 +++++++++++++++++++++++++++++++++++++-----
 kernel/locking/mutex.h      |    1 +
 kernel/locking/ww_mutex.h   |   12 ++++++++++++
 5 files changed, 53 insertions(+), 6 deletions(-)

--- a/include/linux/mutex_types.h
+++ b/include/linux/mutex_types.h
@@ -44,7 +44,7 @@ context_lock_struct(mutex) {
 #ifdef CONFIG_MUTEX_SPIN_ON_OWNER
 	struct optimistic_spin_queue osq; /* Spinner MCS lock */
 #endif
-	struct list_head	wait_list;
+	struct list_head	wait_list __guarded_by(&wait_lock);
 #ifdef CONFIG_DEBUG_MUTEXES
 	void			*magic;
 #endif
--- a/kernel/locking/Makefile
+++ b/kernel/locking/Makefile
@@ -3,6 +3,8 @@
 # and is generally not a function of system call inputs.
 KCOV_INSTRUMENT		:= n
 
+CONTEXT_ANALYSIS_mutex.o := y
+
 obj-y += mutex.o semaphore.o rwsem.o percpu-rwsem.o
 
 # Avoid recursion lockdep -> sanitizer -> ... -> lockdep & improve performance.
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -46,8 +46,9 @@
 static void __mutex_init_generic(struct mutex *lock)
 {
 	atomic_long_set(&lock->owner, 0);
-	raw_spin_lock_init(&lock->wait_lock);
-	INIT_LIST_HEAD(&lock->wait_list);
+	scoped_guard (raw_spinlock_init, &lock->wait_lock) {
+		INIT_LIST_HEAD(&lock->wait_list);
+	}
 #ifdef CONFIG_MUTEX_SPIN_ON_OWNER
 	osq_lock_init(&lock->osq);
 #endif
@@ -150,6 +151,7 @@ EXPORT_SYMBOL(mutex_init_generic);
  * follow with a __mutex_trylock() before failing.
  */
 static __always_inline bool __mutex_trylock_fast(struct mutex *lock)
+	__cond_acquires(true, lock)
 {
 	unsigned long curr = (unsigned long)current;
 	unsigned long zero = 0UL;
@@ -163,6 +165,7 @@ static __always_inline bool __mutex_tryl
 }
 
 static __always_inline bool __mutex_unlock_fast(struct mutex *lock)
+	__cond_releases(true, lock)
 {
 	unsigned long curr = (unsigned long)current;
 
@@ -195,6 +198,7 @@ static inline void __mutex_clear_flag(st
 }
 
 static inline bool __mutex_waiter_is_first(struct mutex *lock, struct mutex_waiter *waiter)
+	__must_hold(&lock->wait_lock)
 {
 	return list_first_entry(&lock->wait_list, struct mutex_waiter, list) == waiter;
 }
@@ -206,6 +210,7 @@ static inline bool __mutex_waiter_is_fir
 static void
 __mutex_add_waiter(struct mutex *lock, struct mutex_waiter *waiter,
 		   struct list_head *list)
+	__must_hold(&lock->wait_lock)
 {
 	hung_task_set_blocker(lock, BLOCKER_TYPE_MUTEX);
 	debug_mutex_add_waiter(lock, waiter, current);
@@ -217,6 +222,7 @@ __mutex_add_waiter(struct mutex *lock, s
 
 static void
 __mutex_remove_waiter(struct mutex *lock, struct mutex_waiter *waiter)
+	__must_hold(&lock->wait_lock)
 {
 	list_del(&waiter->list);
 	if (likely(list_empty(&lock->wait_list)))
@@ -259,7 +265,8 @@ static void __mutex_handoff(struct mutex
  * We also put the fastpath first in the kernel image, to make sure the
  * branch is predicted by the CPU as default-untaken.
  */
-static void __sched __mutex_lock_slowpath(struct mutex *lock);
+static void __sched __mutex_lock_slowpath(struct mutex *lock)
+	__acquires(lock);
 
 /**
  * mutex_lock - acquire the mutex
@@ -340,7 +347,7 @@ bool ww_mutex_spin_on_owner(struct mutex
 	 * Similarly, stop spinning if we are no longer the
 	 * first waiter.
 	 */
-	if (waiter && !__mutex_waiter_is_first(lock, waiter))
+	if (waiter && !data_race(__mutex_waiter_is_first(lock, waiter)))
 		return false;
 
 	return true;
@@ -525,7 +532,8 @@ mutex_optimistic_spin(struct mutex *lock
 }
 #endif
 
-static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigned long ip);
+static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigned long ip)
+	__releases(lock);
 
 /**
  * mutex_unlock - release the mutex
@@ -544,6 +552,7 @@ static noinline void __sched __mutex_unl
  * This function is similar to (but not equivalent to) up().
  */
 void __sched mutex_unlock(struct mutex *lock)
+	__releases(lock)
 {
 #ifndef CONFIG_DEBUG_LOCK_ALLOC
 	if (__mutex_unlock_fast(lock))
@@ -565,6 +574,8 @@ EXPORT_SYMBOL(mutex_unlock);
  * of a unlocked mutex is not allowed.
  */
 void __sched ww_mutex_unlock(struct ww_mutex *lock)
+	__releases(lock)
+	__no_context_analysis
 {
 	__ww_mutex_unlock(lock);
 	mutex_unlock(&lock->base);
@@ -578,6 +589,7 @@ static __always_inline int __sched
 __mutex_lock_common(struct mutex *lock, unsigned int state, unsigned int subclass,
 		    struct lockdep_map *nest_lock, unsigned long ip,
 		    struct ww_acquire_ctx *ww_ctx, const bool use_ww_ctx)
+	__cond_acquires(0, lock)
 {
 	DEFINE_WAKE_Q(wake_q);
 	struct mutex_waiter waiter;
@@ -772,6 +784,7 @@ __mutex_lock_common(struct mutex *lock,
 static int __sched
 __mutex_lock(struct mutex *lock, unsigned int state, unsigned int subclass,
 	     struct lockdep_map *nest_lock, unsigned long ip)
+	__cond_acquires(0, lock)
 {
 	return __mutex_lock_common(lock, state, subclass, nest_lock, ip, NULL, false);
 }
@@ -779,6 +792,7 @@ __mutex_lock(struct mutex *lock, unsigne
 static int __sched
 __ww_mutex_lock(struct mutex *lock, unsigned int state, unsigned int subclass,
 		unsigned long ip, struct ww_acquire_ctx *ww_ctx)
+	__cond_acquires(0, lock)
 {
 	return __mutex_lock_common(lock, state, subclass, NULL, ip, ww_ctx, true);
 }
@@ -824,22 +838,27 @@ EXPORT_SYMBOL(ww_mutex_trylock);
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 void __sched
 mutex_lock_nested(struct mutex *lock, unsigned int subclass)
+	__acquires(lock)
 {
 	__mutex_lock(lock, TASK_UNINTERRUPTIBLE, subclass, NULL, _RET_IP_);
+	__acquire(lock);
 }
 
 EXPORT_SYMBOL_GPL(mutex_lock_nested);
 
 void __sched
 _mutex_lock_nest_lock(struct mutex *lock, struct lockdep_map *nest)
+	__acquires(lock)
 {
 	__mutex_lock(lock, TASK_UNINTERRUPTIBLE, 0, nest, _RET_IP_);
+	__acquire(lock);
 }
 EXPORT_SYMBOL_GPL(_mutex_lock_nest_lock);
 
 int __sched
 _mutex_lock_killable(struct mutex *lock, unsigned int subclass,
 				      struct lockdep_map *nest)
+	__cond_acquires(0, lock)
 {
 	return __mutex_lock(lock, TASK_KILLABLE, subclass, nest, _RET_IP_);
 }
@@ -854,6 +873,7 @@ EXPORT_SYMBOL_GPL(mutex_lock_interruptib
 
 void __sched
 mutex_lock_io_nested(struct mutex *lock, unsigned int subclass)
+	__acquires(lock)
 {
 	int token;
 
@@ -862,12 +882,14 @@ mutex_lock_io_nested(struct mutex *lock,
 	token = io_schedule_prepare();
 	__mutex_lock_common(lock, TASK_UNINTERRUPTIBLE,
 			    subclass, NULL, _RET_IP_, NULL, 0);
+	__acquire(lock);
 	io_schedule_finish(token);
 }
 EXPORT_SYMBOL_GPL(mutex_lock_io_nested);
 
 static inline int
 ww_mutex_deadlock_injection(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+	__cond_releases(nonzero, lock)
 {
 #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
 	unsigned tmp;
@@ -894,6 +916,7 @@ ww_mutex_deadlock_injection(struct ww_mu
 
 int __sched
 ww_mutex_lock(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+	__cond_acquires(nonzero, lock)
 {
 	int ret;
 
@@ -909,6 +932,7 @@ EXPORT_SYMBOL_GPL(ww_mutex_lock);
 
 int __sched
 ww_mutex_lock_interruptible(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+	__cond_acquires(0, lock)
 {
 	int ret;
 
@@ -929,6 +953,7 @@ EXPORT_SYMBOL_GPL(ww_mutex_lock_interrup
  * Release the lock, slowpath:
  */
 static noinline void __sched __mutex_unlock_slowpath(struct mutex *lock, unsigned long ip)
+	__releases(lock)
 {
 	struct task_struct *next = NULL;
 	DEFINE_WAKE_Q(wake_q);
@@ -936,6 +961,7 @@ static noinline void __sched __mutex_unl
 	unsigned long flags;
 
 	mutex_release(&lock->dep_map, ip);
+	__release(lock);
 
 	/*
 	 * Release the lock before (potentially) taking the spinlock such that
@@ -1061,24 +1087,29 @@ EXPORT_SYMBOL_GPL(mutex_lock_io);
 
 static noinline void __sched
 __mutex_lock_slowpath(struct mutex *lock)
+	__acquires(lock)
 {
 	__mutex_lock(lock, TASK_UNINTERRUPTIBLE, 0, NULL, _RET_IP_);
+	__acquire(lock);
 }
 
 static noinline int __sched
 __mutex_lock_killable_slowpath(struct mutex *lock)
+	__cond_acquires(0, lock)
 {
 	return __mutex_lock(lock, TASK_KILLABLE, 0, NULL, _RET_IP_);
 }
 
 static noinline int __sched
 __mutex_lock_interruptible_slowpath(struct mutex *lock)
+	__cond_acquires(0, lock)
 {
 	return __mutex_lock(lock, TASK_INTERRUPTIBLE, 0, NULL, _RET_IP_);
 }
 
 static noinline int __sched
 __ww_mutex_lock_slowpath(struct ww_mutex *lock, struct ww_acquire_ctx *ctx)
+	__cond_acquires(0, lock)
 {
 	return __ww_mutex_lock(&lock->base, TASK_UNINTERRUPTIBLE, 0,
 			       _RET_IP_, ctx);
@@ -1087,6 +1118,7 @@ __ww_mutex_lock_slowpath(struct ww_mutex
 static noinline int __sched
 __ww_mutex_lock_interruptible_slowpath(struct ww_mutex *lock,
 					    struct ww_acquire_ctx *ctx)
+	__cond_acquires(0, lock)
 {
 	return __ww_mutex_lock(&lock->base, TASK_INTERRUPTIBLE, 0,
 			       _RET_IP_, ctx);
--- a/kernel/locking/mutex.h
+++ b/kernel/locking/mutex.h
@@ -7,6 +7,7 @@
  *  Copyright (C) 2004, 2005, 2006 Red Hat, Inc., Ingo Molnar <mingo@redhat.com>
  */
 #ifndef CONFIG_PREEMPT_RT
+#include <linux/mutex.h>
 /*
  * This is the control structure for tasks blocked on mutex, which resides
  * on the blocked task's kernel stack:
--- a/kernel/locking/ww_mutex.h
+++ b/kernel/locking/ww_mutex.h
@@ -7,6 +7,7 @@
 
 static inline struct mutex_waiter *
 __ww_waiter_first(struct mutex *lock)
+	__must_hold(&lock->wait_lock)
 {
 	struct mutex_waiter *w;
 
@@ -19,6 +20,7 @@ __ww_waiter_first(struct mutex *lock)
 
 static inline struct mutex_waiter *
 __ww_waiter_next(struct mutex *lock, struct mutex_waiter *w)
+	__must_hold(&lock->wait_lock)
 {
 	w = list_next_entry(w, list);
 	if (list_entry_is_head(w, &lock->wait_list, list))
@@ -29,6 +31,7 @@ __ww_waiter_next(struct mutex *lock, str
 
 static inline struct mutex_waiter *
 __ww_waiter_prev(struct mutex *lock, struct mutex_waiter *w)
+	__must_hold(&lock->wait_lock)
 {
 	w = list_prev_entry(w, list);
 	if (list_entry_is_head(w, &lock->wait_list, list))
@@ -39,6 +42,7 @@ __ww_waiter_prev(struct mutex *lock, str
 
 static inline struct mutex_waiter *
 __ww_waiter_last(struct mutex *lock)
+	__must_hold(&lock->wait_lock)
 {
 	struct mutex_waiter *w;
 
@@ -51,6 +55,7 @@ __ww_waiter_last(struct mutex *lock)
 
 static inline void
 __ww_waiter_add(struct mutex *lock, struct mutex_waiter *waiter, struct mutex_waiter *pos)
+	__must_hold(&lock->wait_lock)
 {
 	struct list_head *p = &lock->wait_list;
 	if (pos)
@@ -71,16 +76,19 @@ __ww_mutex_has_waiters(struct mutex *loc
 }
 
 static inline void lock_wait_lock(struct mutex *lock, unsigned long *flags)
+	__acquires(&lock->wait_lock)
 {
 	raw_spin_lock_irqsave(&lock->wait_lock, *flags);
 }
 
 static inline void unlock_wait_lock(struct mutex *lock, unsigned long *flags)
+	__releases(&lock->wait_lock)
 {
 	raw_spin_unlock_irqrestore(&lock->wait_lock, *flags);
 }
 
 static inline void lockdep_assert_wait_lock_held(struct mutex *lock)
+	__must_hold(&lock->wait_lock)
 {
 	lockdep_assert_held(&lock->wait_lock);
 }
@@ -307,6 +315,7 @@ static bool __ww_mutex_wound(struct MUTE
 			     struct ww_acquire_ctx *ww_ctx,
 			     struct ww_acquire_ctx *hold_ctx,
 			     struct wake_q_head *wake_q)
+	__must_hold(&lock->wait_lock)
 {
 	struct task_struct *owner = __ww_mutex_owner(lock);
 
@@ -371,6 +380,7 @@ static bool __ww_mutex_wound(struct MUTE
 static void
 __ww_mutex_check_waiters(struct MUTEX *lock, struct ww_acquire_ctx *ww_ctx,
 			 struct wake_q_head *wake_q)
+	__must_hold(&lock->wait_lock)
 {
 	struct MUTEX_WAITER *cur;
 
@@ -464,6 +474,7 @@ __ww_mutex_kill(struct MUTEX *lock, stru
 static inline int
 __ww_mutex_check_kill(struct MUTEX *lock, struct MUTEX_WAITER *waiter,
 		      struct ww_acquire_ctx *ctx)
+	__must_hold(&lock->wait_lock)
 {
 	struct ww_mutex *ww = container_of(lock, struct ww_mutex, base);
 	struct ww_acquire_ctx *hold_ctx = READ_ONCE(ww->ctx);
@@ -514,6 +525,7 @@ __ww_mutex_add_waiter(struct MUTEX_WAITE
 		      struct MUTEX *lock,
 		      struct ww_acquire_ctx *ww_ctx,
 		      struct wake_q_head *wake_q)
+	__must_hold(&lock->wait_lock)
 {
 	struct MUTEX_WAITER *cur, *pos = NULL;
 	bool is_wait_die;


