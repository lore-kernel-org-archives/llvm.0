Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B7831B81C;
	Wed, 21 Jan 2026 11:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768994006; cv=none; b=YOt3m7q1Yp1kRtBDmxQtJn9IMi9OfRds2umKdr/Qm33tUwXwxou0NQCuJFatfjdWtHmHFzBrGZNWDNaddBuhuOOZodJcg6IkPcnQp7fMiDGvCiryBpH1cUBkHhep8wf0RUGAijsGZ8KVucZkdYdwEtZuE9A60EhDp71eoqYWarc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768994006; c=relaxed/simple;
	bh=km26pb3ZdwNOViBejbN2iYhmzTppnt1RpaeBVCTh+Dk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=ssTcrjr0PW30w9wYXF43ZFJYc5lcJWxaQriFuSNHiP9Cvjc//EN8uZfXCaMUEOq5ZdfHuEDXEVgaVqoCfNDsaszFZebEGcmacebrGv0j9H2DGh1JOv4rwu9pJJuoIuZHKbpKaIY81qTzqw6nQtYWcjRvBhmUC6K7BDxyFxVAcXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=quPrSJXZ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="quPrSJXZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=PZ+Uf+dvhepQhlA2Mmn/Q1N+4hN27R4sSLCiZ6o2Hpg=; b=quPrSJXZ3lrpnpq3kscl7QsWBV
	rhPf82ARQK7h/CZ4uc8/2EJw1MaPugmRb4dRtyWDouWMr4vGnkgGQ83ETbJholtOW+vrUrigg2cNK
	JEfy+IEm+rTDnbnFTDpkaceXyyriYihsjO2Dt5Z8SM9zZz2eEgBHuaNWUOqmdhEI+o7WZyn+i3rXF
	Wt+t2MvG8GQuTptgYiQH2K/ewQBa8OYKT7prqHcQ8rapSJkl7rAjOZyGZSngzpuVht07Tub/vRqC6
	alvqHWgku9im4m5JgMEa4HIYV/ysjQ60xacB1moeHu4A4DReWbe7Z08CgaLKK4+5a7XghojQO6rC4
	4ZqeLdRg==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW9E-0000000Fsbc-3pzJ;
	Wed, 21 Jan 2026 11:13:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 99D60300B8A; Wed, 21 Jan 2026 12:13:10 +0100 (CET)
Message-ID: <20260121111213.851599178@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 21 Jan 2026 12:07:07 +0100
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
Subject: [RFC][PATCH 3/4] locking/rtmutex: Add context analysis
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
 include/linux/mutex.h           |    2 +-
 include/linux/rtmutex.h         |    4 ++--
 kernel/locking/Makefile         |    2 ++
 kernel/locking/mutex.c          |    2 --
 kernel/locking/rtmutex.c        |   18 +++++++++++++++++-
 kernel/locking/rtmutex_api.c    |    3 +++
 kernel/locking/rtmutex_common.h |   22 ++++++++++++++++------
 kernel/locking/ww_mutex.h       |   18 +++++++++++++-----
 kernel/locking/ww_rt_mutex.c    |    1 +
 9 files changed, 55 insertions(+), 17 deletions(-)

--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -183,7 +183,7 @@ static inline int __must_check __devm_mu
  */
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 extern void mutex_lock_nested(struct mutex *lock, unsigned int subclass) __acquires(lock);
-extern void _mutex_lock_nest_lock(struct mutex *lock, struct lockdep_map *nest_lock);
+extern void _mutex_lock_nest_lock(struct mutex *lock, struct lockdep_map *nest_lock) __acquires(lock);
 extern int __must_check mutex_lock_interruptible_nested(struct mutex *lock,
 					unsigned int subclass) __cond_acquires(0, lock);
 extern int __must_check _mutex_lock_killable(struct mutex *lock,
--- a/include/linux/rtmutex.h
+++ b/include/linux/rtmutex.h
@@ -22,8 +22,8 @@ extern int max_lock_depth;
 
 struct rt_mutex_base {
 	raw_spinlock_t		wait_lock;
-	struct rb_root_cached   waiters;
-	struct task_struct	*owner;
+	struct rb_root_cached   waiters __guarded_by(&wait_lock);
+	struct task_struct	*owner  __guarded_by(&wait_lock);
 };
 
 #define __RT_MUTEX_BASE_INITIALIZER(rtbasename)				\
--- a/kernel/locking/Makefile
+++ b/kernel/locking/Makefile
@@ -4,6 +4,8 @@
 KCOV_INSTRUMENT		:= n
 
 CONTEXT_ANALYSIS_mutex.o := y
+CONTEXT_ANALYSIS_rtmutex_api.o := y
+CONTEXT_ANALYSIS_ww_rt_mutex.o := y
 
 obj-y += mutex.o semaphore.o rwsem.o percpu-rwsem.o
 
--- a/kernel/locking/mutex.c
+++ b/kernel/locking/mutex.c
@@ -848,7 +848,6 @@ EXPORT_SYMBOL_GPL(mutex_lock_nested);
 
 void __sched
 _mutex_lock_nest_lock(struct mutex *lock, struct lockdep_map *nest)
-	__acquires(lock)
 {
 	__mutex_lock(lock, TASK_UNINTERRUPTIBLE, 0, nest, _RET_IP_);
 	__acquire(lock);
@@ -858,7 +857,6 @@ EXPORT_SYMBOL_GPL(_mutex_lock_nest_lock)
 int __sched
 _mutex_lock_killable(struct mutex *lock, unsigned int subclass,
 				      struct lockdep_map *nest)
-	__cond_acquires(0, lock)
 {
 	return __mutex_lock(lock, TASK_KILLABLE, subclass, nest, _RET_IP_);
 }
--- a/kernel/locking/rtmutex.c
+++ b/kernel/locking/rtmutex.c
@@ -94,6 +94,7 @@ static inline int __ww_mutex_check_kill(
 
 static __always_inline struct task_struct *
 rt_mutex_owner_encode(struct rt_mutex_base *lock, struct task_struct *owner)
+	__must_hold(&lock->wait_lock)
 {
 	unsigned long val = (unsigned long)owner;
 
@@ -105,6 +106,7 @@ rt_mutex_owner_encode(struct rt_mutex_ba
 
 static __always_inline void
 rt_mutex_set_owner(struct rt_mutex_base *lock, struct task_struct *owner)
+	__must_hold(&lock->wait_lock)
 {
 	/*
 	 * lock->wait_lock is held but explicit acquire semantics are needed
@@ -114,12 +116,14 @@ rt_mutex_set_owner(struct rt_mutex_base
 }
 
 static __always_inline void rt_mutex_clear_owner(struct rt_mutex_base *lock)
+	__must_hold(&lock->wait_lock)
 {
 	/* lock->wait_lock is held so the unlock provides release semantics. */
 	WRITE_ONCE(lock->owner, rt_mutex_owner_encode(lock, NULL));
 }
 
 static __always_inline void clear_rt_mutex_waiters(struct rt_mutex_base *lock)
+	__must_hold(&lock->wait_lock)
 {
 	lock->owner = (struct task_struct *)
 			((unsigned long)lock->owner & ~RT_MUTEX_HAS_WAITERS);
@@ -127,6 +131,7 @@ static __always_inline void clear_rt_mut
 
 static __always_inline void
 fixup_rt_mutex_waiters(struct rt_mutex_base *lock, bool acquire_lock)
+	__must_hold(&lock->wait_lock)
 {
 	unsigned long owner, *p = (unsigned long *) &lock->owner;
 
@@ -328,6 +333,7 @@ static __always_inline bool rt_mutex_cmp
 }
 
 static __always_inline void mark_rt_mutex_waiters(struct rt_mutex_base *lock)
+	__must_hold(&lock->wait_lock)
 {
 	lock->owner = (struct task_struct *)
 			((unsigned long)lock->owner | RT_MUTEX_HAS_WAITERS);
@@ -1206,6 +1212,7 @@ static int __sched task_blocks_on_rt_mut
 					   struct ww_acquire_ctx *ww_ctx,
 					   enum rtmutex_chainwalk chwalk,
 					   struct wake_q_head *wake_q)
+	__must_hold(&lock->wait_lock)
 {
 	struct task_struct *owner = rt_mutex_owner(lock);
 	struct rt_mutex_waiter *top_waiter = waiter;
@@ -1249,6 +1256,7 @@ static int __sched task_blocks_on_rt_mut
 
 		/* Check whether the waiter should back out immediately */
 		rtm = container_of(lock, struct rt_mutex, rtmutex);
+		__assume_ctx_lock(&rtm->rtmutex.wait_lock);
 		res = __ww_mutex_add_waiter(waiter, rtm, ww_ctx, wake_q);
 		if (res) {
 			raw_spin_lock(&task->pi_lock);
@@ -1356,6 +1364,7 @@ static void __sched mark_wakeup_next_wai
 }
 
 static int __sched __rt_mutex_slowtrylock(struct rt_mutex_base *lock)
+	__must_hold(&lock->wait_lock)
 {
 	int ret = try_to_take_rt_mutex(lock, current, NULL);
 
@@ -1505,7 +1514,7 @@ static bool rtmutex_spin_on_owner(struct
 		 *  - the VCPU on which owner runs is preempted
 		 */
 		if (!owner_on_cpu(owner) || need_resched() ||
-		    !rt_mutex_waiter_is_top_waiter(lock, waiter)) {
+		    !data_race(rt_mutex_waiter_is_top_waiter(lock, waiter))) {
 			res = false;
 			break;
 		}
@@ -1538,6 +1547,7 @@ static bool rtmutex_spin_on_owner(struct
  */
 static void __sched remove_waiter(struct rt_mutex_base *lock,
 				  struct rt_mutex_waiter *waiter)
+	__must_hold(&lock->wait_lock)
 {
 	bool is_top_waiter = (waiter == rt_mutex_top_waiter(lock));
 	struct task_struct *owner = rt_mutex_owner(lock);
@@ -1613,6 +1623,8 @@ static int __sched rt_mutex_slowlock_blo
 	struct task_struct *owner;
 	int ret = 0;
 
+	__assume_ctx_lock(&rtm->rtmutex.wait_lock);
+
 	lockevent_inc(rtmutex_slow_block);
 	for (;;) {
 		/* Try to acquire the lock: */
@@ -1658,6 +1670,7 @@ static int __sched rt_mutex_slowlock_blo
 static void __sched rt_mutex_handle_deadlock(int res, int detect_deadlock,
 					     struct rt_mutex_base *lock,
 					     struct rt_mutex_waiter *w)
+	__must_hold(&lock->wait_lock)
 {
 	/*
 	 * If the result is not -EDEADLOCK or the caller requested
@@ -1694,11 +1707,13 @@ static int __sched __rt_mutex_slowlock(s
 				       enum rtmutex_chainwalk chwalk,
 				       struct rt_mutex_waiter *waiter,
 				       struct wake_q_head *wake_q)
+	__must_hold(&lock->wait_lock)
 {
 	struct rt_mutex *rtm = container_of(lock, struct rt_mutex, rtmutex);
 	struct ww_mutex *ww = ww_container_of(rtm);
 	int ret;
 
+	__assume_ctx_lock(&rtm->rtmutex.wait_lock);
 	lockdep_assert_held(&lock->wait_lock);
 	lockevent_inc(rtmutex_slowlock);
 
@@ -1750,6 +1765,7 @@ static inline int __rt_mutex_slowlock_lo
 					     struct ww_acquire_ctx *ww_ctx,
 					     unsigned int state,
 					     struct wake_q_head *wake_q)
+	__must_hold(&lock->wait_lock)
 {
 	struct rt_mutex_waiter waiter;
 	int ret;
--- a/kernel/locking/rtmutex_api.c
+++ b/kernel/locking/rtmutex_api.c
@@ -169,6 +169,7 @@ int __sched rt_mutex_futex_trylock(struc
 }
 
 int __sched __rt_mutex_futex_trylock(struct rt_mutex_base *lock)
+	__must_hold(&lock->wait_lock)
 {
 	return __rt_mutex_slowtrylock(lock);
 }
@@ -526,6 +527,7 @@ static __always_inline int __mutex_lock_
 					       unsigned int subclass,
 					       struct lockdep_map *nest_lock,
 					       unsigned long ip)
+	__acquires(lock) __no_context_analysis
 {
 	int ret;
 
@@ -647,6 +649,7 @@ EXPORT_SYMBOL(mutex_trylock);
 #endif /* !CONFIG_DEBUG_LOCK_ALLOC */
 
 void __sched mutex_unlock(struct mutex *lock)
+	__releases(lock) __no_context_analysis
 {
 	mutex_release(&lock->dep_map, _RET_IP_);
 	__rt_mutex_unlock(&lock->rtmutex);
--- a/kernel/locking/rtmutex_common.h
+++ b/kernel/locking/rtmutex_common.h
@@ -79,12 +79,18 @@ struct rt_wake_q_head {
  * PI-futex support (proxy locking functions, etc.):
  */
 extern void rt_mutex_init_proxy_locked(struct rt_mutex_base *lock,
-				       struct task_struct *proxy_owner);
-extern void rt_mutex_proxy_unlock(struct rt_mutex_base *lock);
+				       struct task_struct *proxy_owner)
+	__must_hold(&lock->wait_lock);
+
+extern void rt_mutex_proxy_unlock(struct rt_mutex_base *lock)
+	__must_hold(&lock->wait_lock);
+
 extern int __rt_mutex_start_proxy_lock(struct rt_mutex_base *lock,
 				     struct rt_mutex_waiter *waiter,
 				     struct task_struct *task,
-				     struct wake_q_head *);
+				     struct wake_q_head *)
+	__must_hold(&lock->wait_lock);
+
 extern int rt_mutex_start_proxy_lock(struct rt_mutex_base *lock,
 				     struct rt_mutex_waiter *waiter,
 				     struct task_struct *task);
@@ -109,6 +115,7 @@ extern void rt_mutex_postunlock(struct r
  */
 #ifdef CONFIG_RT_MUTEXES
 static inline int rt_mutex_has_waiters(struct rt_mutex_base *lock)
+	__must_hold(&lock->wait_lock)
 {
 	return !RB_EMPTY_ROOT(&lock->waiters.rb_root);
 }
@@ -120,6 +127,7 @@ static inline int rt_mutex_has_waiters(s
  */
 static inline bool rt_mutex_waiter_is_top_waiter(struct rt_mutex_base *lock,
 						 struct rt_mutex_waiter *waiter)
+	__must_hold(&lock->wait_lock)
 {
 	struct rb_node *leftmost = rb_first_cached(&lock->waiters);
 
@@ -127,6 +135,7 @@ static inline bool rt_mutex_waiter_is_to
 }
 
 static inline struct rt_mutex_waiter *rt_mutex_top_waiter(struct rt_mutex_base *lock)
+	__must_hold(&lock->wait_lock)
 {
 	struct rb_node *leftmost = rb_first_cached(&lock->waiters);
 	struct rt_mutex_waiter *w = NULL;
@@ -170,9 +179,10 @@ enum rtmutex_chainwalk {
 
 static inline void __rt_mutex_base_init(struct rt_mutex_base *lock)
 {
-	raw_spin_lock_init(&lock->wait_lock);
-	lock->waiters = RB_ROOT_CACHED;
-	lock->owner = NULL;
+	scoped_guard (raw_spinlock_init, &lock->wait_lock) {
+		lock->waiters = RB_ROOT_CACHED;
+		lock->owner = NULL;
+	}
 }
 
 /* Debug functions */
--- a/kernel/locking/ww_mutex.h
+++ b/kernel/locking/ww_mutex.h
@@ -4,6 +4,7 @@
 
 #define MUTEX		mutex
 #define MUTEX_WAITER	mutex_waiter
+#define MUST_HOLD_WAIT_LOCK	__must_hold(&lock->wait_lock)
 
 static inline struct mutex_waiter *
 __ww_waiter_first(struct mutex *lock)
@@ -97,9 +98,11 @@ static inline void lockdep_assert_wait_l
 
 #define MUTEX		rt_mutex
 #define MUTEX_WAITER	rt_mutex_waiter
+#define MUST_HOLD_WAIT_LOCK	__must_hold(&lock->rtmutex.wait_lock)
 
 static inline struct rt_mutex_waiter *
 __ww_waiter_first(struct rt_mutex *lock)
+	__must_hold(&lock->rtmutex.wait_lock)
 {
 	struct rb_node *n = rb_first(&lock->rtmutex.waiters.rb_root);
 	if (!n)
@@ -127,6 +130,7 @@ __ww_waiter_prev(struct rt_mutex *lock,
 
 static inline struct rt_mutex_waiter *
 __ww_waiter_last(struct rt_mutex *lock)
+	__must_hold(&lock->rtmutex.wait_lock)
 {
 	struct rb_node *n = rb_last(&lock->rtmutex.waiters.rb_root);
 	if (!n)
@@ -148,21 +152,25 @@ __ww_mutex_owner(struct rt_mutex *lock)
 
 static inline bool
 __ww_mutex_has_waiters(struct rt_mutex *lock)
+	__must_hold(&lock->rtmutex.wait_lock)
 {
 	return rt_mutex_has_waiters(&lock->rtmutex);
 }
 
 static inline void lock_wait_lock(struct rt_mutex *lock, unsigned long *flags)
+	__acquires(&lock->rtmutex.wait_lock)
 {
 	raw_spin_lock_irqsave(&lock->rtmutex.wait_lock, *flags);
 }
 
 static inline void unlock_wait_lock(struct rt_mutex *lock, unsigned long *flags)
+	__releases(&lock->rtmutex.wait_lock)
 {
 	raw_spin_unlock_irqrestore(&lock->rtmutex.wait_lock, *flags);
 }
 
 static inline void lockdep_assert_wait_lock_held(struct rt_mutex *lock)
+	__must_hold(&lock->rtmutex.wait_lock)
 {
 	lockdep_assert_held(&lock->rtmutex.wait_lock);
 }
@@ -315,7 +323,7 @@ static bool __ww_mutex_wound(struct MUTE
 			     struct ww_acquire_ctx *ww_ctx,
 			     struct ww_acquire_ctx *hold_ctx,
 			     struct wake_q_head *wake_q)
-	__must_hold(&lock->wait_lock)
+	MUST_HOLD_WAIT_LOCK
 {
 	struct task_struct *owner = __ww_mutex_owner(lock);
 
@@ -380,7 +388,7 @@ static bool __ww_mutex_wound(struct MUTE
 static void
 __ww_mutex_check_waiters(struct MUTEX *lock, struct ww_acquire_ctx *ww_ctx,
 			 struct wake_q_head *wake_q)
-	__must_hold(&lock->wait_lock)
+	MUST_HOLD_WAIT_LOCK
 {
 	struct MUTEX_WAITER *cur;
 
@@ -428,7 +436,7 @@ ww_mutex_set_context_fastpath(struct ww_
 	 * __ww_mutex_add_waiter() and makes sure we either observe ww->ctx
 	 * and/or !empty list.
 	 */
-	if (likely(!__ww_mutex_has_waiters(&lock->base)))
+	if (likely(!data_race(__ww_mutex_has_waiters(&lock->base))))
 		return;
 
 	/*
@@ -474,7 +482,7 @@ __ww_mutex_kill(struct MUTEX *lock, stru
 static inline int
 __ww_mutex_check_kill(struct MUTEX *lock, struct MUTEX_WAITER *waiter,
 		      struct ww_acquire_ctx *ctx)
-	__must_hold(&lock->wait_lock)
+	MUST_HOLD_WAIT_LOCK
 {
 	struct ww_mutex *ww = container_of(lock, struct ww_mutex, base);
 	struct ww_acquire_ctx *hold_ctx = READ_ONCE(ww->ctx);
@@ -525,7 +533,7 @@ __ww_mutex_add_waiter(struct MUTEX_WAITE
 		      struct MUTEX *lock,
 		      struct ww_acquire_ctx *ww_ctx,
 		      struct wake_q_head *wake_q)
-	__must_hold(&lock->wait_lock)
+	MUST_HOLD_WAIT_LOCK
 {
 	struct MUTEX_WAITER *cur, *pos = NULL;
 	bool is_wait_die;
--- a/kernel/locking/ww_rt_mutex.c
+++ b/kernel/locking/ww_rt_mutex.c
@@ -90,6 +90,7 @@ ww_mutex_lock_interruptible(struct ww_mu
 EXPORT_SYMBOL(ww_mutex_lock_interruptible);
 
 void __sched ww_mutex_unlock(struct ww_mutex *lock)
+	__no_context_analysis
 {
 	struct rt_mutex *rtm = &lock->base;
 


