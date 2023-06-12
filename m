Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2577518AF0
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=9sqy4wj1SuZG+E1ZOkNDiw8zR5F8T4bHRpYkByM8S6o=; b=UhQupRCCFcRTcJ52xSokO+BN+/
	kY/7gwhYYUJuWiDkepIOXaTfsN9oUJbZyPz4MGALg25P7b34n6+Ok2hbsZlYT7UksaAbwFk+F5Un8
	jbd0MhYNazKforhuRdwoa9pzipclcVjCfcGu7ssHvdaMAJrvZmonDjlAA82HDpnBgtYzV2d8s8b8t
	qHBYO/MZaSs22phHQ0cwMSR1JVJ0EDMmO+hUawjvBK3rJ7dTYlYL9gVmi9JmzTZgb8zcO18rNbEE9
	xqdqtcflTFMJKPjso5gcIRtT3JFqm+sPu9caS+aUoSXbgNJHfAmzzmVGM2xLIewVD7QxJWS3gnuG1
	XlreM76Q==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q8e0k-002NAm-K5; Mon, 12 Jun 2023 09:38:54 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0B8033031BC;
	Mon, 12 Jun 2023 11:38:49 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 5832930A77B57; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093538.712217968@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:30 +0200
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
Subject: [PATCH v3 17/57] sched: Simplify yield_to()
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
 kernel/sched/core.c |   73 ++++++++++++++++++++++------------------------------
 1 file changed, 32 insertions(+), 41 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8799,55 +8799,46 @@ int __sched yield_to(struct task_struct
 {
 	struct task_struct *curr = current;
 	struct rq *rq, *p_rq;
-	unsigned long flags;
 	int yielded = 0;
 
-	local_irq_save(flags);
-	rq = this_rq();
+	scoped_guard (irqsave) {
+		rq = this_rq();
 
 again:
-	p_rq = task_rq(p);
-	/*
-	 * If we're the only runnable task on the rq and target rq also
-	 * has only one task, there's absolutely no point in yielding.
-	 */
-	if (rq->nr_running == 1 && p_rq->nr_running == 1) {
-		yielded = -ESRCH;
-		goto out_irq;
-	}
-
-	double_rq_lock(rq, p_rq);
-	if (task_rq(p) != p_rq) {
-		double_rq_unlock(rq, p_rq);
-		goto again;
-	}
-
-	if (!curr->sched_class->yield_to_task)
-		goto out_unlock;
-
-	if (curr->sched_class != p->sched_class)
-		goto out_unlock;
-
-	if (task_on_cpu(p_rq, p) || !task_is_running(p))
-		goto out_unlock;
-
-	yielded = curr->sched_class->yield_to_task(rq, p);
-	if (yielded) {
-		schedstat_inc(rq->yld_count);
+		p_rq = task_rq(p);
 		/*
-		 * Make p's CPU reschedule; pick_next_entity takes care of
-		 * fairness.
+		 * If we're the only runnable task on the rq and target rq also
+		 * has only one task, there's absolutely no point in yielding.
 		 */
-		if (preempt && rq != p_rq)
-			resched_curr(p_rq);
-	}
+		if (rq->nr_running == 1 && p_rq->nr_running == 1)
+			return -ESRCH;
 
-out_unlock:
-	double_rq_unlock(rq, p_rq);
-out_irq:
-	local_irq_restore(flags);
+		guard(double_rq_lock)(rq, p_rq);
+		if (task_rq(p) != p_rq)
+			goto again;
+
+		if (!curr->sched_class->yield_to_task)
+			return 0;
+
+		if (curr->sched_class != p->sched_class)
+			return 0;
+
+		if (task_on_cpu(p_rq, p) || !task_is_running(p))
+			return 0;
+
+		yielded = curr->sched_class->yield_to_task(rq, p);
+		if (yielded) {
+			schedstat_inc(rq->yld_count);
+			/*
+			 * Make p's CPU reschedule; pick_next_entity
+			 * takes care of fairness.
+			 */
+			if (preempt && rq != p_rq)
+				resched_curr(p_rq);
+		}
+	}
 
-	if (yielded > 0)
+	if (yielded)
 		schedule();
 
 	return yielded;


