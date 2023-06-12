Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D799182C6
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=oJyDWnF7S8lcaog4Xmhyr6vhDojPiq7m8dz3r+ZsZG4=; b=rdH9P5/MC3KcY+M1BubJnq2SDA
	VDGeL/wvRJ516ylJciShUfk/lLKhhrHMf84ST4NUiKTy2ExpNVzaIsxOt0cQrm7+eX/8udNe5etuq
	a8fdjA1aakVHh17wbvSw2yH8JlQoRaJkmSyuc03oqmoc7UOXpLHURSRxkh0dVmI/veHKlufAu0gpY
	Ns3St7yJnjxp7C9LWCYQAjUcurSze2tx9FwQXkuQqZEP3Medv20JQgxJrWc9w8JIbLUqKZH2b4jfd
	jiWzkPTbr4fSMmiKp/dav0iBFlH+nbdDr15ksYyL2JPyPxZmPbWGcP2XPV4+cHOFrrcX0V4f4DCw+
	S6QpV56A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e0l-008kQR-0k;
	Mon, 12 Jun 2023 09:38:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0E5AD302680;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 67EF730A77B58; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093538.942686455@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:33 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: torvalds@linux-foundation.org,
 keescook@chromium.org,
 gregkh@linuxfoundation.org,
 pbonzini@redhat.com
Cc: masahiroy@kernel.org,
 nathan@kernel.org,
 ndesaulniers@google.com,
 nicolas@fjasle.eu,
 catalin.marinas@arm.com,
 will@kernel.org,
 vkoul@kernel.org,
 trix@redhat.com,
 ojeda@kernel.org,
 peterz@infradead.org,
 mingo@redhat.com,
 longman@redhat.com,
 boqun.feng@gmail.com,
 dennis@kernel.org,
 tj@kernel.org,
 cl@linux.com,
 acme@kernel.org,
 mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com,
 jolsa@kernel.org,
 namhyung@kernel.org,
 irogers@google.com,
 adrian.hunter@intel.com,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 rostedt@goodmis.org,
 bsegall@google.com,
 mgorman@suse.de,
 bristot@redhat.com,
 vschneid@redhat.com,
 paulmck@kernel.org,
 frederic@kernel.org,
 quic_neeraju@quicinc.com,
 joel@joelfernandes.org,
 josh@joshtriplett.org,
 mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com,
 rientjes@google.com,
 vbabka@suse.cz,
 roman.gushchin@linux.dev,
 42.hyeyoo@gmail.com,
 apw@canonical.com,
 joe@perches.com,
 dwaipayanray1@gmail.com,
 lukas.bulwahn@gmail.com,
 john.johansen@canonical.com,
 paul@paul-moore.com,
 jmorris@namei.org,
 serge@hallyn.com,
 linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org,
 llvm@lists.linux.dev,
 linux-perf-users@vger.kernel.org,
 rcu@vger.kernel.org,
 linux-security-module@vger.kernel.org,
 tglx@linutronix.de,
 ravi.bangoria@amd.com,
 error27@gmail.com,
 luc.vanoostenryck@gmail.com
Subject: [PATCH v3 20/57] sched: Simplify tg_set_cfs_bandwidth()
References: <20230612090713.652690195@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Use guards to reduce gotos and simplify control flow.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/cpu.h |    2 ++
 kernel/sched/core.c |   42 +++++++++++++++++++++---------------------
 2 files changed, 23 insertions(+), 21 deletions(-)

--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -148,6 +148,8 @@ static inline int remove_cpu(unsigned in
 static inline void smp_shutdown_nonboot_cpus(unsigned int primary_cpu) { }
 #endif	/* !CONFIG_HOTPLUG_CPU */
 
+DEFINE_LOCK_GUARD_0(cpus_read_lock, cpus_read_lock(), cpus_read_unlock())
+
 #ifdef CONFIG_PM_SLEEP_SMP
 extern int freeze_secondary_cpus(int primary);
 extern void thaw_secondary_cpus(void);
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10726,11 +10726,12 @@ static int tg_set_cfs_bandwidth(struct t
 	 * Prevent race between setting of cfs_rq->runtime_enabled and
 	 * unthrottle_offline_cfs_rqs().
 	 */
-	cpus_read_lock();
-	mutex_lock(&cfs_constraints_mutex);
+	guard(cpus_read_lock)();
+	guard(mutex)(&cfs_constraints_mutex);
+
 	ret = __cfs_schedulable(tg, period, quota);
 	if (ret)
-		goto out_unlock;
+		return ret;
 
 	runtime_enabled = quota != RUNTIME_INF;
 	runtime_was_enabled = cfs_b->quota != RUNTIME_INF;
@@ -10740,39 +10741,38 @@ static int tg_set_cfs_bandwidth(struct t
 	 */
 	if (runtime_enabled && !runtime_was_enabled)
 		cfs_bandwidth_usage_inc();
-	raw_spin_lock_irq(&cfs_b->lock);
-	cfs_b->period = ns_to_ktime(period);
-	cfs_b->quota = quota;
-	cfs_b->burst = burst;
-
-	__refill_cfs_bandwidth_runtime(cfs_b);
-
-	/* Restart the period timer (if active) to handle new period expiry: */
-	if (runtime_enabled)
-		start_cfs_bandwidth(cfs_b);
 
-	raw_spin_unlock_irq(&cfs_b->lock);
+	scoped_guard (raw_spinlock_irq, &cfs_b->lock) {
+		cfs_b->period = ns_to_ktime(period);
+		cfs_b->quota = quota;
+		cfs_b->burst = burst;
+
+		__refill_cfs_bandwidth_runtime(cfs_b);
+
+		/*
+		 * Restart the period timer (if active) to handle new
+		 * period expiry:
+		 */
+		if (runtime_enabled)
+			start_cfs_bandwidth(cfs_b);
+	}
 
 	for_each_online_cpu(i) {
 		struct cfs_rq *cfs_rq = tg->cfs_rq[i];
 		struct rq *rq = cfs_rq->rq;
-		struct rq_flags rf;
 
-		rq_lock_irq(rq, &rf);
+		guard(rq_lock_irq)(rq);
 		cfs_rq->runtime_enabled = runtime_enabled;
 		cfs_rq->runtime_remaining = 0;
 
 		if (cfs_rq->throttled)
 			unthrottle_cfs_rq(cfs_rq);
-		rq_unlock_irq(rq, &rf);
 	}
+
 	if (runtime_was_enabled && !runtime_enabled)
 		cfs_bandwidth_usage_dec();
-out_unlock:
-	mutex_unlock(&cfs_constraints_mutex);
-	cpus_read_unlock();
 
-	return ret;
+	return 0;
 }
 
 static int tg_set_cfs_quota(struct task_group *tg, long cfs_quota_us)


