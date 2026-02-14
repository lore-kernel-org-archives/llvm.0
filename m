Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B5F261B9B
	for <llvm@lists.linux.dev>; Sat, 14 Feb 2026 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771064421; cv=none; b=D/atigDqQ/0GVSSfa4epi0REz6GLhJxMmGQIIJFbTRNZqno1Ir/TiWmk422Zd//KQq4KPdAOmQj0USKO4/la1YC+yzyoC0tB/Fubh4g0l4QFKyXftYOdyarZhdLiz2Na12DPSJMEzqV0Uq/PF+EB6Jiuwq0L+Vn2HdoDJZpbt2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771064421; c=relaxed/simple;
	bh=7kpNh99AToG/vTQK0WBVKOZg3twB9gDz48MBmJUiCVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hre+0ErueLK6+mus8jOD/XM/7Qhc/truI3Ulb2Y+fz5qP3yCwa9BSqXqrr79R0mfvQnfzWnjqxsyCSCrp/TpwnThrWrAC1wcgguxBsZXBM2G+IoHqbq6DKw30a07L7MtNt5H107A3GmJDEFgs7y/szVUEdJikisgVayCJmJBBYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0Imc6yz; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0Imc6yz"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-124afd03fd1so2738958c88.0
        for <llvm@lists.linux.dev>; Sat, 14 Feb 2026 02:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771064418; x=1771669218; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=byrtd/ubLay3CAsg8BBm3ST0N7GyC7ok0dhlgBs7r74=;
        b=k0Imc6yz6EvRWV/1nAzu4K7RZYGjk5rAg+vwGZFSdXNqqgagtK1SICaGuNMSSaUYBl
         Nha5+eLX6dZqN7/jyfL7rzuH97Mpc9aVaFD8FVbqJZMkZN8CXhVburvVGKCnk4Lhj8ap
         K4/hjc9x5gfDW09U52gFLS3c8Yu7cH7Fnvv5IYj0/VcqPmq0qZYlSctESfaoQRQb1f7M
         prowDnbHb2XdGOtqW5Sszpx7CTim0yebFCcPVLP+4NUI6NeGD7JfQRKNC7Gw6Ndf5804
         wtBUEvfmYDGrEeaS9lw/N1o4Uh7BBWLkR9zvBzrsGY5zDPFRFe3iCOHk3nU4YZGX8Byj
         l/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771064418; x=1771669218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byrtd/ubLay3CAsg8BBm3ST0N7GyC7ok0dhlgBs7r74=;
        b=BoWiLTGP00VzRHMF8rZhWjYE94IQd0NwfLuVKYch1cLWxWUeLU65jhxbmiYQNF8l7C
         G6/aKhk6Y6eIN3x+QspJ5SVTAiS6q/IxzEGs38q+Uj2RkLUKQtVNePHag0bu6N/t52v6
         9eEpPKtNCBlEra//xtPvlaMoXgv9E//ajMO5PzAdutXue3yByWPomWXSYQ+yrqA71FF8
         OJWftcSty93CU9dyKwb8AWqr8zgqelrKVPdt67jS8hDyOCGwJ/WvBLoO6zG4d14xgr/6
         dho9KgqiPGS/ofkPVloAtdV/vBkyj7DapIW+OKep4s7joW5Du5vfMxSArqVVVKPXYZGo
         Pthg==
X-Forwarded-Encrypted: i=1; AJvYcCXJChBGeozY5UQ6tRUF6Rrqt/bSstUahphyoBCfkSCHW1Ob5Anmrh4NXBYpaXwye8jQCt8r@lists.linux.dev
X-Gm-Message-State: AOJu0YzYQn2KF0X5kR6rPwBwrljEZBdp1nmdYP9lEzrGNEYs4MD3DrTE
	7/VYxUuyHNpF31Q8AsrlD4wBAR/TkEzUkAOeSnbaUpIaSE1ksN/6JR2G
X-Gm-Gg: AZuq6aIvgwCp6RJVzPolnUMrZP3YIrGE4gx4gm91yvXKh834nBnRkwV3KXst7RuhfZs
	JddcMzKiVPBTYxduu957ZFAnGNJzcMQVVRHizWah9QrBEbVYzCq693zAgXezELAcbt37DjohwOn
	fb3t1rg7iRchuBqV0rIf5gXXnU12MCec71WIYyu1eLvWaHR/ujoQ9ngQ2alX363LSnh69K6Hyiw
	LV7bzBw1cuWnTlGIRybzQgob8wxn+HlL/QWCTA/tB9fvwbBj+mUSiHnjPkJfYBXJSs1J7TFLUoY
	agIXtuPckqw+1zTv2EwG1m7rEQ04pJoyKJgA6STyL7dKVRcMLfHb8sS9HdJP+nS6q/SsP3ZdDzm
	RS1dGrDVL0KgSOccsY/zCc5IkwDELiL5Fq/Q7sWtudzl/Afqd0EIkXiV1sUaOPxyl5Ior6Xob6z
	+SIA0X8/JxLRP4+ZBpa/ipfGzH1JPJdmyAIEDWyPoDKNrxU+DOHekwVPxIh3IGHhWJos+aCfdiE
	Gk4O6216rov/vGIlp86RSq0qVF0wAAgug==
X-Received: by 2002:a05:7022:238d:b0:11b:95fe:beed with SMTP id a92af1059eb24-12741bd1088mr795303c88.38.1771064417927;
        Sat, 14 Feb 2026 02:20:17 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742aff32asm2032277c88.0.2026.02.14.02.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 02:20:17 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH] sched: rcu: fix rq->{curr,donor} address space annotations
Date: Sat, 14 Feb 2026 18:20:05 +0800
Message-ID: <20260214102005.1398306-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_SCHED_PROXY_EXEC, struct rq::curr and rq::donor are
annotated as __rcu. Several call sites access these pointers as
plain struct task_struct * even while the relevant rq lock is held,
which triggers address space warnings from static checkers.

Fix these sites by:
- using rcu_dereference_protected() under rq locks and then reusing a local
  pointer; and
- using rcu_access_pointer() for address-only comparisons.

No functional change intended.

Note: the __schedule() prev assignment cleanup is intentionally left out
and will be handled separately.

Build/verify:
  make -j$(nproc) O=../out/full-clang-x86_64 LLVM=1 kernel/sched/core.o
  make -j$(nproc) O=../out/full-clang-x86_64 LLVM=1 C=2 CHECK=sparse \
    kernel/sched/core.o

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 kernel/sched/core.c  | 73 +++++++++++++++++++++++++++++++-------------
 kernel/sched/pelt.h  |  5 ++-
 kernel/sched/sched.h | 19 ++++++------
 3 files changed, 64 insertions(+), 33 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 759777694c78..a1a3b2816a46 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -330,7 +330,8 @@ void sched_core_dequeue(struct rq *rq, struct task_struct *p, int flags)
 	 * and re-examine whether the core is still in forced idle state.
 	 */
 	if (!(flags & DEQUEUE_SAVE) && rq->nr_running == 1 &&
-	    rq->core->core_forceidle_count && rq->curr == rq->idle)
+	    rq->core->core_forceidle_count &&
+	    rcu_access_pointer(rq->curr) == rq->idle)
 		resched_curr(rq);
 }
 
@@ -891,7 +892,12 @@ static enum hrtimer_restart hrtick(struct hrtimer *timer)
 
 	rq_lock(rq, &rf);
 	update_rq_clock(rq);
-	rq->donor->sched_class->task_tick(rq, rq->donor, 1);
+	{
+		struct task_struct *donor =
+			rcu_dereference_protected(rq->donor,
+				lockdep_is_held(__rq_lockp(rq)));
+		donor->sched_class->task_tick(rq, donor, 1);
+	}
 	rq_unlock(rq, &rf);
 
 	return HRTIMER_NORESTART;
@@ -1111,7 +1117,9 @@ void wake_up_q(struct wake_q_head *head)
  */
 static void __resched_curr(struct rq *rq, int tif)
 {
-	struct task_struct *curr = rq->curr;
+	struct task_struct *curr =
+		rcu_dereference_protected(rq->curr,
+				lockdep_is_held(__rq_lockp(rq)));
 	struct thread_info *cti = task_thread_info(curr);
 	int cpu;
 
@@ -1218,7 +1226,8 @@ int get_nohz_timer_target(void)
 
 	guard(rcu)();
 
-	for_each_domain(cpu, sd) {
+	sd = rcu_dereference(cpu_rq(cpu)->sd);
+	for (; sd; sd = rcu_dereference(sd->parent)) {
 		for_each_cpu_and(i, sched_domain_span(sd), hk_mask) {
 			if (cpu == i)
 				continue;
@@ -2179,12 +2188,15 @@ static void block_task(struct rq *rq, struct task_struct *p, int flags)
  */
 inline int task_curr(const struct task_struct *p)
 {
-	return cpu_curr(task_cpu(p)) == p;
+	return rcu_access_pointer(cpu_curr(task_cpu(p))) == p;
 }
 
 void wakeup_preempt(struct rq *rq, struct task_struct *p, int flags)
 {
-	struct task_struct *donor = rq->donor;
+	struct task_struct *donor =
+		rcu_dereference_protected(rq->donor, lockdep_is_held(__rq_lockp(rq)));
+	struct task_struct *curr =
+		rcu_dereference_protected(rq->curr, lockdep_is_held(__rq_lockp(rq)));
 
 	if (p->sched_class == rq->next_class) {
 		rq->next_class->wakeup_preempt(rq, p, flags);
@@ -2199,7 +2211,7 @@ void wakeup_preempt(struct rq *rq, struct task_struct *p, int flags)
 	 * A queue event has occurred, and we're going to schedule.  In
 	 * this case, we can save a useless back to back clock update.
 	 */
-	if (task_on_rq_queued(donor) && test_tsk_need_resched(rq->curr))
+	if (task_on_rq_queued(donor) && test_tsk_need_resched(curr))
 		rq_clock_skip_update(rq);
 }
 
@@ -3604,7 +3616,9 @@ ttwu_stat(struct task_struct *p, int cpu, int wake_flags)
 		__schedstat_inc(p->stats.nr_wakeups_remote);
 
 		guard(rcu)();
-		for_each_domain(rq->cpu, sd) {
+
+		sd = rcu_dereference(rq->sd);
+		for (; sd; sd = rcu_dereference(sd->parent)) {
 			if (cpumask_test_cpu(cpu, sched_domain_span(sd))) {
 				__schedstat_inc(sd->ttwu_wake_remote);
 				break;
@@ -3809,7 +3823,8 @@ void wake_up_if_idle(int cpu)
 	guard(rcu)();
 	if (is_idle_task(rcu_dereference(rq->curr))) {
 		guard(rq_lock_irqsave)(rq);
-		if (is_idle_task(rq->curr))
+		if (is_idle_task(rcu_dereference_protected(rq->curr,
+			lockdep_is_held(__rq_lockp(rq)))))
 			resched_curr(rq);
 	}
 }
@@ -5556,7 +5571,8 @@ void sched_tick(void)
 	sched_clock_tick();
 
 	rq_lock(rq, &rf);
-	donor = rq->donor;
+	donor = rcu_dereference_protected(rq->donor,
+			lockdep_is_held(__rq_lockp(rq)));
 
 	psi_account_irqtime(rq, donor, NULL);
 
@@ -5644,7 +5660,10 @@ static void sched_tick_remote(struct work_struct *work)
 	 */
 	if (tick_nohz_tick_stopped_cpu(cpu)) {
 		guard(rq_lock_irq)(rq);
-		struct task_struct *curr = rq->curr;
+		struct task_struct *curr =
+			rcu_dereference_protected(rq->curr, lockdep_is_held(__rq_lockp(rq)));
+		struct task_struct *donor =
+			rcu_dereference_protected(rq->donor, lockdep_is_held(__rq_lockp(rq)));
 
 		if (cpu_online(cpu)) {
 			/*
@@ -5652,7 +5671,7 @@ static void sched_tick_remote(struct work_struct *work)
 			 * we are always sure that there is no proxy (only a
 			 * single task is running).
 			 */
-			WARN_ON_ONCE(rq->curr != rq->donor);
+			WARN_ON_ONCE(curr != donor);
 			update_rq_clock(rq);
 
 			if (!is_idle_task(curr)) {
@@ -6845,7 +6864,12 @@ static void __sched notrace __schedule(int sched_mode)
 	}
 
 pick_again:
-	next = pick_next_task(rq, rq->donor, &rf);
+	{
+		struct task_struct *donor =
+			rcu_dereference_protected(rq->donor,
+				lockdep_is_held(__rq_lockp(rq)));
+		next = pick_next_task(rq, donor, &rf);
+	}
 	rq_set_donor(rq, next);
 	rq->next_class = next->sched_class;
 	if (unlikely(task_is_blocked(next))) {
@@ -7352,7 +7376,7 @@ void rt_mutex_setprio(struct task_struct *p, struct task_struct *pi_task)
 	 * real need to boost.
 	 */
 	if (unlikely(p == rq->idle)) {
-		WARN_ON(p != rq->curr);
+		WARN_ON(p != rcu_access_pointer(rq->curr));
 		WARN_ON(p->pi_blocked_on);
 		goto out_unlock;
 	}
@@ -8116,7 +8140,9 @@ static DEFINE_PER_CPU(struct cpu_stop_work, push_work);
 static void balance_push(struct rq *rq)
 	__must_hold(__rq_lockp(rq))
 {
-	struct task_struct *push_task = rq->curr;
+	struct task_struct *push_task =
+		rcu_dereference_protected(rq->curr,
+			lockdep_is_held(__rq_lockp(rq)));
 
 	lockdep_assert_rq_held(rq);
 
@@ -10272,7 +10298,7 @@ void dump_cpu_task(int cpu)
 		return;
 
 	pr_info("Task dump for CPU %d:\n", cpu);
-	sched_show_task(cpu_curr(cpu));
+	sched_show_task(rcu_access_pointer(cpu_curr(cpu)));
 }
 
 /*
@@ -10583,24 +10609,27 @@ static void mm_cid_fixup_cpus_to_tasks(struct mm_struct *mm)
 
 		/* Remote access to mm::mm_cid::pcpu requires rq_lock */
 		guard(rq_lock_irq)(rq);
+
+		struct task_struct *curr =
+			rcu_dereference_protected(rq->curr, lockdep_is_held(__rq_lockp(rq)));
 		/* Is the CID still owned by the CPU? */
 		if (cid_on_cpu(pcp->cid)) {
 			/*
 			 * If rq->curr has @mm, transfer it with the
 			 * transition bit set. Otherwise drop it.
 			 */
-			if (rq->curr->mm == mm && rq->curr->mm_cid.active)
-				mm_cid_transit_to_task(rq->curr, pcp);
+			if (curr->mm == mm && curr->mm_cid.active)
+				mm_cid_transit_to_task(curr, pcp);
 			else
 				mm_drop_cid_on_cpu(mm, pcp);
 
-		} else if (rq->curr->mm == mm && rq->curr->mm_cid.active) {
-			unsigned int cid = rq->curr->mm_cid.cid;
+		} else if (curr->mm == mm && curr->mm_cid.active) {
+			unsigned int cid = curr->mm_cid.cid;
 
 			/* Ensure it has the transition bit set */
 			if (!cid_in_transit(cid)) {
 				cid = cid_to_transit_cid(cid);
-				rq->curr->mm_cid.cid = cid;
+				curr->mm_cid.cid = cid;
 				pcp->cid = cid;
 			}
 		}
@@ -10625,7 +10654,7 @@ static bool mm_cid_fixup_task_to_cpu(struct task_struct *t, struct mm_struct *mm
 		return false;
 	if (cid_on_task(t->mm_cid.cid)) {
 		/* If running on the CPU, put the CID in transit mode, otherwise drop it */
-		if (task_rq(t)->curr == t)
+		if (rcu_access_pointer(task_rq(t)->curr) == t)
 			mm_cid_transit_to_cpu(t, per_cpu_ptr(mm->mm_cid.pcpu, task_cpu(t)));
 		else
 			mm_unset_cid_on_task(t);
diff --git a/kernel/sched/pelt.h b/kernel/sched/pelt.h
index f921302dc40f..eb84e92d717c 100644
--- a/kernel/sched/pelt.h
+++ b/kernel/sched/pelt.h
@@ -99,7 +99,10 @@ static inline void _update_idle_rq_clock_pelt(struct rq *rq)
  */
 static inline void update_rq_clock_pelt(struct rq *rq, s64 delta)
 {
-	if (unlikely(is_idle_task(rq->curr))) {
+	struct task_struct *curr =
+		rcu_dereference_protected(rq->curr,
+			lockdep_is_held(__rq_lockp(rq)));
+	if (unlikely(is_idle_task(curr))) {
 		_update_idle_rq_clock_pelt(rq);
 		return;
 	}
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b82fb70a9d54..ed0134e2df55 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1387,12 +1387,13 @@ static __always_inline struct rq *__this_rq(void)
 #define cpu_rq(cpu)		(&per_cpu(runqueues, (cpu)))
 #define this_rq()		__this_rq()
 #define task_rq(p)		cpu_rq(task_cpu(p))
-#define cpu_curr(cpu)		(cpu_rq(cpu)->curr)
+#define cpu_curr(cpu)		((cpu_rq(cpu)->curr))
 #define raw_rq()		raw_cpu_ptr(&runqueues)
 
 static inline bool idle_rq(struct rq *rq)
 {
-	return rq->curr == rq->idle && !rq->nr_running && !rq->ttwu_pending;
+	return rcu_access_pointer(rq->curr) == rq->idle &&
+		!rq->nr_running && !rq->ttwu_pending;
 }
 
 /**
@@ -2360,7 +2361,7 @@ static inline u64 global_rt_runtime(void)
  */
 static inline int task_current(struct rq *rq, struct task_struct *p)
 {
-	return rq->curr == p;
+	return rcu_access_pointer(rq->curr) == p;
 }
 
 /*
@@ -2371,7 +2372,7 @@ static inline int task_current(struct rq *rq, struct task_struct *p)
  */
 static inline int task_current_donor(struct rq *rq, struct task_struct *p)
 {
-	return rq->donor == p;
+	return rcu_access_pointer(rq->donor) == p;
 }
 
 static inline bool task_is_blocked(struct task_struct *p)
@@ -2659,7 +2660,7 @@ struct sched_class {
 
 static inline void put_prev_task(struct rq *rq, struct task_struct *prev)
 {
-	WARN_ON_ONCE(rq->donor != prev);
+	WARN_ON_ONCE(rcu_access_pointer(rq->donor) != prev);
 	prev->sched_class->put_prev_task(rq, prev, NULL);
 }
 
@@ -2670,8 +2671,7 @@ static inline void set_next_task(struct rq *rq, struct task_struct *next)
 
 static inline void
 __put_prev_set_next_dl_server(struct rq *rq,
-			      struct task_struct *prev,
-			      struct task_struct *next)
+	struct task_struct *prev, struct task_struct *next)
 {
 	prev->dl_server = NULL;
 	next->dl_server = rq->dl_server;
@@ -2679,10 +2679,9 @@ __put_prev_set_next_dl_server(struct rq *rq,
 }
 
 static inline void put_prev_set_next_task(struct rq *rq,
-					  struct task_struct *prev,
-					  struct task_struct *next)
+	struct task_struct *prev, struct task_struct *next)
 {
-	WARN_ON_ONCE(rq->donor != prev);
+	WARN_ON_ONCE(rcu_access_pointer(rq->donor) != prev);
 
 	__put_prev_set_next_dl_server(rq, prev, next);
 
-- 
2.43.0

