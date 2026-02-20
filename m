Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2168C23C4FD
	for <llvm@lists.linux.dev>; Fri, 20 Feb 2026 19:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771616050; cv=none; b=XUc+CwX8FMPb9t9m26uEtEDudHM6+9YqThEshriLMF4OzCb/808dJ1smji+NciH+VXGH5rkeTbxlru6uGry84G08Z+w474F665b2CkOBTGodCCh/U696qsOzO77Ap1CzYkLQZwvq9aBhtUc+m886V0BfRmeob5+q9h4ut2h9srM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771616050; c=relaxed/simple;
	bh=lJOOGAEXEhBn8rJrqS6BAcEUf2ZARDX94hkzztX4oqQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DxupSpGUR1loisyY7c7JatQjWs9+ia2I2zF4fHtQ+iKuFsLRci4nrMSN8fLXdG+f3uEvvScBKh4kvxF38BvSIAgW886c8lB/GC7C0pkr2q/k6lJBXllA8Jn1RKlMqRfZNjVj7b94kAIUzxR61fsU9ZdosdZ70W36gY0ZzQ4iyRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jco9kDdM; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jco9kDdM"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b6b0500e06so3046111eec.1
        for <llvm@lists.linux.dev>; Fri, 20 Feb 2026 11:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771616048; x=1772220848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx93PpuFiEeaFiteIYnDUfB/w8Xje7553VWswRzg3Tk=;
        b=jco9kDdMWk9G0h77ipxxPIrbCCIhmkDvoDggaj6XVSZ2v67qzGHtb+1heG0E1Tm/rA
         ha3+sbWzi+3RvRSibpHd5yL8fzQcS58v0pgAEZW+vOGCvJSn5uwri+k4jJebbXHq8F5A
         WTFJQ7Dttp87NF7ZKM0i1M5E5GUWMdGF8m+b/LwGaGaOrzZ67MUj9/l0tX9MPDu6yGYP
         QjSV+CCW1EITIFeK73rZINW6ra6JDe6lP7jaKlGzTTVjZeR8BwUjS2BCu0zueqKBdbjR
         c8Y5+eJ5/+lDWLdS6zZcKcDvkQoHa27OapKQv/3/rXqm3ve6SgVwix6nnorubPELA8R1
         so9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771616048; x=1772220848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fx93PpuFiEeaFiteIYnDUfB/w8Xje7553VWswRzg3Tk=;
        b=Sl08z24kgQjLIcC4rcIs/Rs1OqPQ6eUg1wZXu/imV6NxBBu+TyI4RFjmpdtypzH+51
         wwdMKBmwrbu/0xDqZC3Nr/zJxIndiFS82t2J/dyYqZZ+dLPOZnN7pMUXMvCndtQ4Vxxs
         TFIITZlVaUfl0gUvwdOo2oCeepUJdnzpCdFBAy26FU/CkrqBA//TpmfWuz3IlaZDD8Dv
         YADODsh6z8rsXNhKrqvsHD9Sjxs/f5jGorqwCEIIuJ9ZpYeSdm0mY4pzepzAfOdUfnuA
         4qKBNGqEvmz/+nkkQqAlyMLbj8zZzpCmqyFZgb33GDtOz3Vfxw65gupQ4O27kMZTkfVS
         R7Ag==
X-Forwarded-Encrypted: i=1; AJvYcCU9pfTyf8UWtvpc30QFhi5OahKjR1qaoNgmUGQidR1v8knnRvg+VoHEfiVfry08QMmvrAV5@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq3KyqQN5v6LUfRXlnMBLvU5xdk2lAlmWCrtE7HaepVE626LuS
	rcxT+2AvxoOubCOOASu+PKvG05geWIrbpGjMzEvap+9k8b8VN07+X5SG
X-Gm-Gg: AZuq6aK3tkHBxwsw4SNkwDmB2N+Nyw/SrbjAI3oTZ3++qGp8ZmQkog0xXTVWEpIiV+Q
	Id1vkbop9bvxZpKX+eOhxyqmAZiM5iF2b6hjpcdxvPzueWrGdWJaWrAyf9pYCeQmeszxFdP/8an
	RPMk2NTkvPdHcir4Wf+Qk14NDgjzI16ibiOlliYuXgMA+W68x9j3GwkA6/tCz/junC6XMHguauT
	+b3oj+48GLN9Qd6hc5aOwG2uD8EtzaDGSUqTf8RaEc4l9lpebXoH/41S1KKbOReA0YgT+EB0sid
	nDETk9fRt9SgADSsz466BWnVEt0dV0huShfMOxs4xdNbZRv/gA+di7qiZxwBLpkzSD+g5sWAD18
	rPc2JGhCztY6nu6jBx3PW5JbU8BzJRD6Gl6P5mPifKlbEsNF4MzO9lkljBN1SLLOk2EJ0EblKvF
	9S7EMWzhMl/Uo044rICoCvTNOnaF8atMKeifxygn4/X4G9fiTUXYfb8QbdjzSioMTtYZx7zlZR4
	GOuoxqRQV+PlT5LNq8QOe4=
X-Received: by 2002:a05:693c:2288:b0:2ba:9cfb:2744 with SMTP id 5a478bee46e88-2bd7bd3a027mr382025eec.30.1771616048066;
        Fri, 20 Feb 2026 11:34:08 -0800 (PST)
Received: from localhost.localdomain (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc167c8sm45956eec.26.2026.02.20.11.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 11:34:07 -0800 (PST)
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
Subject: [PATCH v2] sched: rcu: fix rq->{curr,donor} address space annotations
Date: Sat, 21 Feb 2026 03:33:53 +0800
Message-ID: <20260220193353.21870-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260214102005.1398306-1-sun.jian.kdev@gmail.com>
References: <20260214102005.1398306-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_SCHED_PROXY_EXEC enabled, struct rq::curr and rq::donor are
annotated as __rcu. Several call sites access these pointers as plain
struct task_struct * while holding rq locks, which triggers address
space warnings from sparse.

Fix these sites by dereferencing rq->{curr,donor} with
rcu_dereference_protected() under rq locks and reusing local pointers,
and by using rcu_access_pointer() for address-only comparisons.

No functional change intended.

Build/verify:
  make -j$(nproc) O=../out/full-clang-x86_64 LLVM=1 kernel/sched/core.o
  make -j$(nproc) O=../out/full-clang-x86_64 LLVM=1 C=2 CHECK=sparse \
    kernel/sched/{core,pelt,build_policy}.o

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>

---
v2:
  - Fix sparse address space warning in core.c: __schedule() prev assignment
  - Fix sparse noderef dereferences in pelt.c: update_other_load_avgs()
  - Fix sparse noderef dereference in deadline.c: dl_server_timer()
  - Use rcu_dereference_protected() in sched.h: get_push_task()
---
 kernel/sched/core.c     | 78 +++++++++++++++++++++++++++++------------
 kernel/sched/deadline.c |  7 +++-
 kernel/sched/pelt.c     |  7 +++-
 kernel/sched/pelt.h     |  5 ++-
 kernel/sched/sched.h    | 23 ++++++------
 5 files changed, 83 insertions(+), 37 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 759777694c78..1dd13dd5be5f 100644
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
+		bool locked = lockdep_is_held(__rq_lockp(rq));
+		struct task_struct *donor =
+			rcu_dereference_protected(rq->donor, locked);
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
+					  lockdep_is_held(__rq_lockp(rq)));
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
@@ -3809,7 +3823,9 @@ void wake_up_if_idle(int cpu)
 	guard(rcu)();
 	if (is_idle_task(rcu_dereference(rq->curr))) {
 		guard(rq_lock_irqsave)(rq);
-		if (is_idle_task(rq->curr))
+		bool locked = lockdep_is_held(__rq_lockp(rq));
+
+		if (is_idle_task(rcu_dereference_protected(rq->curr, locked)))
 			resched_curr(rq);
 	}
 }
@@ -5556,7 +5572,8 @@ void sched_tick(void)
 	sched_clock_tick();
 
 	rq_lock(rq, &rf);
-	donor = rq->donor;
+	donor = rcu_dereference_protected(rq->donor,
+					  lockdep_is_held(__rq_lockp(rq)));
 
 	psi_account_irqtime(rq, donor, NULL);
 
@@ -5644,7 +5661,10 @@ static void sched_tick_remote(struct work_struct *work)
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
@@ -5652,7 +5672,7 @@ static void sched_tick_remote(struct work_struct *work)
 			 * we are always sure that there is no proxy (only a
 			 * single task is running).
 			 */
-			WARN_ON_ONCE(rq->curr != rq->donor);
+			WARN_ON_ONCE(curr != donor);
 			update_rq_clock(rq);
 
 			if (!is_idle_task(curr)) {
@@ -6778,7 +6798,9 @@ static void __sched notrace __schedule(int sched_mode)
 
 	cpu = smp_processor_id();
 	rq = cpu_rq(cpu);
-	prev = rq->curr;
+	bool locked = lockdep_is_held(__rq_lockp(rq));
+
+	prev = rcu_dereference_protected(rq->curr, locked);
 
 	schedule_debug(prev, preempt);
 
@@ -6845,7 +6867,12 @@ static void __sched notrace __schedule(int sched_mode)
 	}
 
 pick_again:
-	next = pick_next_task(rq, rq->donor, &rf);
+	{
+		bool locked = lockdep_is_held(__rq_lockp(rq));
+		struct task_struct *donor =
+			rcu_dereference_protected(rq->donor, locked);
+		next = pick_next_task(rq, donor, &rf);
+	}
 	rq_set_donor(rq, next);
 	rq->next_class = next->sched_class;
 	if (unlikely(task_is_blocked(next))) {
@@ -7352,7 +7379,7 @@ void rt_mutex_setprio(struct task_struct *p, struct task_struct *pi_task)
 	 * real need to boost.
 	 */
 	if (unlikely(p == rq->idle)) {
-		WARN_ON(p != rq->curr);
+		WARN_ON(p != rcu_access_pointer(rq->curr));
 		WARN_ON(p->pi_blocked_on);
 		goto out_unlock;
 	}
@@ -8116,7 +8143,9 @@ static DEFINE_PER_CPU(struct cpu_stop_work, push_work);
 static void balance_push(struct rq *rq)
 	__must_hold(__rq_lockp(rq))
 {
-	struct task_struct *push_task = rq->curr;
+	struct task_struct *push_task =
+		rcu_dereference_protected(rq->curr,
+					  lockdep_is_held(__rq_lockp(rq)));
 
 	lockdep_assert_rq_held(rq);
 
@@ -10272,7 +10301,7 @@ void dump_cpu_task(int cpu)
 		return;
 
 	pr_info("Task dump for CPU %d:\n", cpu);
-	sched_show_task(cpu_curr(cpu));
+	sched_show_task(rcu_access_pointer(cpu_curr(cpu)));
 }
 
 /*
@@ -10583,24 +10612,27 @@ static void mm_cid_fixup_cpus_to_tasks(struct mm_struct *mm)
 
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
@@ -10625,7 +10657,7 @@ static bool mm_cid_fixup_task_to_cpu(struct task_struct *t, struct mm_struct *mm
 		return false;
 	if (cid_on_task(t->mm_cid.cid)) {
 		/* If running on the CPU, put the CID in transit mode, otherwise drop it */
-		if (task_rq(t)->curr == t)
+		if (rcu_access_pointer(task_rq(t)->curr) == t)
 			mm_cid_transit_to_cpu(t, per_cpu_ptr(mm->mm_cid.pcpu, task_cpu(t)));
 		else
 			mm_unset_cid_on_task(t);
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index d08b00429323..1376474774c3 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1166,7 +1166,12 @@ static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_
 		 * any relevant server through calling dl_server_update() and
 		 * friends.
 		 */
-		rq->donor->sched_class->update_curr(rq);
+		{
+			struct task_struct *donor =
+			rcu_dereference_protected(rq->donor,
+						  lockdep_is_held(__rq_lockp(rq)));
+			donor->sched_class->update_curr(rq);
+		}
 
 		if (dl_se->dl_defer_idle) {
 			dl_server_stop(dl_se);
diff --git a/kernel/sched/pelt.c b/kernel/sched/pelt.c
index 897790889ba3..b0ad86e8ba8b 100644
--- a/kernel/sched/pelt.c
+++ b/kernel/sched/pelt.c
@@ -477,11 +477,16 @@ int update_irq_load_avg(struct rq *rq, u64 running)
 bool update_other_load_avgs(struct rq *rq)
 {
 	u64 now = rq_clock_pelt(rq);
-	const struct sched_class *curr_class = rq->donor->sched_class;
+	struct task_struct *donor;
+	const struct sched_class *curr_class;
 	unsigned long hw_pressure = arch_scale_hw_pressure(cpu_of(rq));
 
 	lockdep_assert_rq_held(rq);
 
+	donor = rcu_dereference_protected(rq->donor,
+					  lockdep_is_held(__rq_lockp(rq)));
+	curr_class = donor->sched_class;
+
 	/* hw_pressure doesn't care about invariance */
 	return update_rt_rq_load_avg(now, rq, curr_class == &rt_sched_class) |
 		update_dl_rq_load_avg(now, rq, curr_class == &dl_sched_class) |
diff --git a/kernel/sched/pelt.h b/kernel/sched/pelt.h
index f921302dc40f..2498616fa1a9 100644
--- a/kernel/sched/pelt.h
+++ b/kernel/sched/pelt.h
@@ -99,7 +99,10 @@ static inline void _update_idle_rq_clock_pelt(struct rq *rq)
  */
 static inline void update_rq_clock_pelt(struct rq *rq, s64 delta)
 {
-	if (unlikely(is_idle_task(rq->curr))) {
+	struct task_struct *curr =
+		rcu_dereference_protected(rq->curr,
+					  lockdep_is_held(__rq_lockp(rq)));
+	if (unlikely(is_idle_task(curr))) {
 		_update_idle_rq_clock_pelt(rq);
 		return;
 	}
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b82fb70a9d54..c1673f2baaea 100644
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
 
@@ -2809,9 +2808,11 @@ static inline cpumask_t *alloc_user_cpus_ptr(int node)
 
 static inline struct task_struct *get_push_task(struct rq *rq)
 {
-	struct task_struct *p = rq->donor;
+	struct task_struct *p;
 
 	lockdep_assert_rq_held(rq);
+	p = rcu_dereference_protected(rq->donor,
+				      lockdep_is_held(__rq_lockp(rq)));
 
 	if (rq->push_busy)
 		return NULL;

base-commit: 770aaedb461a055f79b971d538678942b6607894
-- 
2.43.0

