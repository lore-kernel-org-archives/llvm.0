Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103E0426689;
	Wed, 21 Jan 2026 11:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768994006; cv=none; b=bEACRsnJ/2M7tJSYS6yO+k23j9QkPxvcGuwyCRvEA3vd/2wyCxrRy0hXwrJsSPyrW/6PUfXPUzCXuu1m8L+YvnZzFnoAWcgCXVogPVIuPZpUGiL26XOsUfFDF1ZLS2Twe7X93JyFEQ1JNN00negf86WppOD5K4Sdbsl1EHHmqZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768994006; c=relaxed/simple;
	bh=vh1O4EIYizTr7NT3ajUQjADPt9uxJvBii+vXKhCbVbE=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=JHlaTLiOcFSWsqSmTkDAcnRd5P4lVlACS83YURAm8MzeDxJX+QNSDWb481M/vwzjxVM3YyXxna8meef1tK4GwA46y3qwUvV98B1diIaoCdFnxm3EVa0UX6HTOIxcT+93wBu8ri9fa5tyV80+/1bA4jf4R+1JAho0FvfFmBtdPV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tHl6VtRe; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tHl6VtRe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=EBpAjq5+89SGNPHAA/ASAna+7nwkw2fC1LR7V9KwUeA=; b=tHl6VtReokdUJsJJGRZexhENfU
	B+bnsvPI/D2Y+/el0aU3sborlqlZdr07T3/jDPuKsDwrv+700GwMIBwQ1474QjDvLOaTMtSPO+LeK
	6g7L04xwNclh3j6tDfXvJWTFM1orJOpLAnLBr8sDbAh/OWY4poW0OYaspsuSD1b3hhoh5kMNvM4iX
	5fgRstF9510AyUvLsOgsT6zM92jkOcMeOcTiECXQ66mssGp5zv5vmFF4zaQYXzjkUrGEpu+hCvdOD
	9vvX2jUmG9AcnV0RejItVNn1jBnAqhfv0tEmK4RPCbja4b1V0BSPDHCNFU+Ny9oCMnQughwbzsZGz
	fZ+dBZdg==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW9E-0000000GGcY-3tdY;
	Wed, 21 Jan 2026 11:13:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 9E96F300BD1; Wed, 21 Jan 2026 12:13:10 +0100 (CET)
Message-ID: <20260121111213.950376128@infradead.org>
User-Agent: quilt/0.68
Date: Wed, 21 Jan 2026 12:07:08 +0100
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
Subject: [RFC][PATCH 4/4] futex: Convert to compiler context analysis
References: <20260121110704.221498346@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Convert the sparse annotations over to the new compiler context
analysis stuff.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://patch.msgid.link/20260114110828.GE830229@noisy.programming.kicks-ass.net
---
 kernel/futex/Makefile   |    2 ++
 kernel/futex/core.c     |    9 ++++++---
 kernel/futex/futex.h    |   17 ++++++++++++++---
 kernel/futex/pi.c       |    9 +++++++++
 kernel/futex/waitwake.c |    4 ++++
 5 files changed, 35 insertions(+), 6 deletions(-)

--- a/kernel/futex/Makefile
+++ b/kernel/futex/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CONTEXT_ANALYSIS := y
+
 obj-y += core.o syscalls.o pi.o requeue.o waitwake.o
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -864,7 +864,6 @@ void __futex_unqueue(struct futex_q *q)
 
 /* The key must be already stored in q->key. */
 void futex_q_lock(struct futex_q *q, struct futex_hash_bucket *hb)
-	__acquires(&hb->lock)
 {
 	/*
 	 * Increment the counter before taking the lock so that
@@ -879,10 +878,10 @@ void futex_q_lock(struct futex_q *q, str
 	q->lock_ptr = &hb->lock;
 
 	spin_lock(&hb->lock);
+	__acquire(q->lock_ptr);
 }
 
 void futex_q_unlock(struct futex_hash_bucket *hb)
-	__releases(&hb->lock)
 {
 	futex_hb_waiters_dec(hb);
 	spin_unlock(&hb->lock);
@@ -1443,12 +1442,15 @@ static void futex_cleanup(struct task_st
 void futex_exit_recursive(struct task_struct *tsk)
 {
 	/* If the state is FUTEX_STATE_EXITING then futex_exit_mutex is held */
-	if (tsk->futex_state == FUTEX_STATE_EXITING)
+	if (tsk->futex_state == FUTEX_STATE_EXITING) {
+		__assume_ctx_lock(&tsk->futex_exit_mutex);
 		mutex_unlock(&tsk->futex_exit_mutex);
+	}
 	tsk->futex_state = FUTEX_STATE_DEAD;
 }
 
 static void futex_cleanup_begin(struct task_struct *tsk)
+	__acquires(&tsk->futex_exit_mutex)
 {
 	/*
 	 * Prevent various race issues against a concurrent incoming waiter
@@ -1475,6 +1477,7 @@ static void futex_cleanup_begin(struct t
 }
 
 static void futex_cleanup_end(struct task_struct *tsk, int state)
+	__releases(&tsk->futex_exit_mutex)
 {
 	/*
 	 * Lockless store. The only side effect is that an observer might
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -217,7 +217,7 @@ enum futex_access {
 
 extern int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
 			 enum futex_access rw);
-extern void futex_q_lockptr_lock(struct futex_q *q);
+extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
 extern struct hrtimer_sleeper *
 futex_setup_timer(ktime_t *time, struct hrtimer_sleeper *timeout,
 		  int flags, u64 range_ns);
@@ -311,9 +311,11 @@ extern int futex_unqueue(struct futex_q
 static inline void futex_queue(struct futex_q *q, struct futex_hash_bucket *hb,
 			       struct task_struct *task)
 	__releases(&hb->lock)
+	__releases(q->lock_ptr)
 {
 	__futex_queue(q, hb, task);
 	spin_unlock(&hb->lock);
+	__release(q->lock_ptr);
 }
 
 extern void futex_unqueue_pi(struct futex_q *q);
@@ -358,9 +360,12 @@ static inline int futex_hb_waiters_pendi
 #endif
 }
 
-extern void futex_q_lock(struct futex_q *q, struct futex_hash_bucket *hb);
-extern void futex_q_unlock(struct futex_hash_bucket *hb);
+extern void futex_q_lock(struct futex_q *q, struct futex_hash_bucket *hb)
+	__acquires(&hb->lock)
+	__acquires(q->lock_ptr);
 
+extern void futex_q_unlock(struct futex_hash_bucket *hb)
+	__releases(&hb->lock);
 
 extern int futex_lock_pi_atomic(u32 __user *uaddr, struct futex_hash_bucket *hb,
 				union futex_key *key,
@@ -379,6 +384,9 @@ extern int fixup_pi_owner(u32 __user *ua
  */
 static inline void
 double_lock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *hb2)
+	__acquires(&hb1->lock)
+	__acquires(&hb2->lock)
+	__no_context_analysis
 {
 	if (hb1 > hb2)
 		swap(hb1, hb2);
@@ -390,6 +398,9 @@ double_lock_hb(struct futex_hash_bucket
 
 static inline void
 double_unlock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *hb2)
+	__releases(&hb1->lock)
+	__releases(&hb2->lock)
+	__no_context_analysis
 {
 	spin_unlock(&hb1->lock);
 	if (hb1 != hb2)
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -389,6 +389,7 @@ static void __attach_to_pi_owner(struct
 	 * Initialize the pi_mutex in locked state and make @p
 	 * the owner of it:
 	 */
+	__assume_ctx_lock(&pi_state->pi_mutex.wait_lock);
 	rt_mutex_init_proxy_locked(&pi_state->pi_mutex, p);
 
 	/* Store the key for possible exit cleanups: */
@@ -614,6 +615,8 @@ int futex_lock_pi_atomic(u32 __user *uad
 static int wake_futex_pi(u32 __user *uaddr, u32 uval,
 			 struct futex_pi_state *pi_state,
 			 struct rt_mutex_waiter *top_waiter)
+	__must_hold(&pi_state->pi_mutex.wait_lock)
+	__releases(&pi_state->pi_mutex.wait_lock)
 {
 	struct task_struct *new_owner;
 	bool postunlock = false;
@@ -670,6 +673,8 @@ static int wake_futex_pi(u32 __user *uad
 
 static int __fixup_pi_state_owner(u32 __user *uaddr, struct futex_q *q,
 				  struct task_struct *argowner)
+	__must_hold(&q->pi_state->pi_mutex.wait_lock)
+	__must_hold(q->lock_ptr)
 {
 	struct futex_pi_state *pi_state = q->pi_state;
 	struct task_struct *oldowner, *newowner;
@@ -966,6 +971,7 @@ int futex_lock_pi(u32 __user *uaddr, uns
 				 * - EAGAIN: The user space value changed.
 				 */
 				futex_q_unlock(hb);
+				__release(q.lock_ptr);
 				/*
 				 * Handle the case where the owner is in the middle of
 				 * exiting. Wait for the exit to complete otherwise
@@ -1090,6 +1096,7 @@ int futex_lock_pi(u32 __user *uaddr, uns
 		if (res)
 			ret = (res < 0) ? res : 0;
 
+		__release(&hb->lock);
 		futex_unqueue_pi(&q);
 		spin_unlock(q.lock_ptr);
 		if (q.drop_hb_ref) {
@@ -1101,10 +1108,12 @@ int futex_lock_pi(u32 __user *uaddr, uns
 
 out_unlock_put_key:
 		futex_q_unlock(hb);
+		__release(q.lock_ptr);
 		goto out;
 
 uaddr_faulted:
 		futex_q_unlock(hb);
+		__release(q.lock_ptr);
 
 		ret = fault_in_user_writeable(uaddr);
 		if (ret)
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -462,6 +462,7 @@ int futex_wait_multiple_setup(struct fut
 			}
 
 			futex_q_unlock(hb);
+			__release(q->lock_ptr);
 		}
 		__set_current_state(TASK_RUNNING);
 
@@ -628,6 +629,7 @@ int futex_wait_setup(u32 __user *uaddr,
 
 		if (ret) {
 			futex_q_unlock(hb);
+			__release(q->lock_ptr);
 
 			ret = get_user(uval, uaddr);
 			if (ret)
@@ -641,11 +643,13 @@ int futex_wait_setup(u32 __user *uaddr,
 
 		if (uval != val) {
 			futex_q_unlock(hb);
+			__release(q->lock_ptr);
 			return -EWOULDBLOCK;
 		}
 
 		if (key2 && futex_match(&q->key, key2)) {
 			futex_q_unlock(hb);
+			__release(q->lock_ptr);
 			return -EINVAL;
 		}
 


