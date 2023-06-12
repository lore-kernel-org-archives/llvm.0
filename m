Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7887918AF0
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=7465s/BLfgTETUEeYyMSYNRfYMViPKbFZJuWYGxIsWk=; b=QrymH738S6BUWgGevujYrQ8VaB
	PH+wkAUdCcq+ZLI/VVa9WjXC5jZpY+ZtjcTeVaVSgBK/rrtFX4JipIkEotQDIo42uymhGb+OTP5PP
	av0vR0d50Sub11D0y+JHydz6x+S3PfCD62KHQJdThRZlMRhjOTK6mtfoAqx5xK47SDM9nJjq4RHSW
	a8TjpFD0LPYr8sp7k4DeKSUT4JSgkTAb4WkfQ+qo4yx3kuwHXxYGmJgnDJcnK6v3WoeLNwuoJMiNd
	UKngBMPfhPm8JbrLbn5yick33k3nsGcjbOuquk6ZnmIewchgWER3XiRFCR+KtYCJksfjzFMm8xey/
	JeBHTfJA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q8e0n-002NC5-Dd; Mon, 12 Jun 2023 09:38:57 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 349893032C8;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id C0F5430A77B6E; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093540.037803940@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:48 +0200
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
Subject: [PATCH v3 35/57] perf: Simplify *perf_event_read*()
References: <20230612090713.652690195@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8


Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   54 ++++++++++++++++-----------------------------------
 1 file changed, 17 insertions(+), 37 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4435,7 +4435,8 @@ static void __perf_event_read(void *info
 	if (ctx->task && cpuctx->task_ctx != ctx)
 		return;
 
-	raw_spin_lock(&ctx->lock);
+	guard(raw_spinlock)(&ctx->lock);
+
 	if (ctx->is_active & EVENT_TIME) {
 		update_context_time(ctx);
 		update_cgrp_time_from_event(event);
@@ -4446,12 +4447,12 @@ static void __perf_event_read(void *info
 		perf_event_update_sibling_time(event);
 
 	if (event->state != PERF_EVENT_STATE_ACTIVE)
-		goto unlock;
+		return;
 
 	if (!data->group) {
 		pmu->read(event);
 		data->ret = 0;
-		goto unlock;
+		return;
 	}
 
 	pmu->start_txn(pmu, PERF_PMU_TXN_READ);
@@ -4469,9 +4470,6 @@ static void __perf_event_read(void *info
 	}
 
 	data->ret = pmu->commit_txn(pmu);
-
-unlock:
-	raw_spin_unlock(&ctx->lock);
 }
 
 static inline u64 perf_event_count(struct perf_event *event)
@@ -4502,43 +4500,32 @@ static void calc_timer_values(struct per
 int perf_event_read_local(struct perf_event *event, u64 *value,
 			  u64 *enabled, u64 *running)
 {
-	unsigned long flags;
-	int ret = 0;
-
 	/*
 	 * Disabling interrupts avoids all counter scheduling (context
 	 * switches, timer based rotation and IPIs).
 	 */
-	local_irq_save(flags);
+	guard(irqsave)();
 
 	/*
 	 * It must not be an event with inherit set, we cannot read
 	 * all child counters from atomic context.
 	 */
-	if (event->attr.inherit) {
-		ret = -EOPNOTSUPP;
-		goto out;
-	}
+	if (event->attr.inherit)
+		return -EOPNOTSUPP;
 
 	/* If this is a per-task event, it must be for current */
 	if ((event->attach_state & PERF_ATTACH_TASK) &&
-	    event->hw.target != current) {
-		ret = -EINVAL;
-		goto out;
-	}
+	    event->hw.target != current)
+		return -EINVAL;
 
 	/* If this is a per-CPU event, it must be for this CPU */
 	if (!(event->attach_state & PERF_ATTACH_TASK) &&
-	    event->cpu != smp_processor_id()) {
-		ret = -EINVAL;
-		goto out;
-	}
+	    event->cpu != smp_processor_id())
+		return -EINVAL;
 
 	/* If this is a pinned event it must be running on this CPU */
-	if (event->attr.pinned && event->oncpu != smp_processor_id()) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (event->attr.pinned && event->oncpu != smp_processor_id())
+		return -EBUSY;
 
 	/*
 	 * If the event is currently on this CPU, its either a per-task event,
@@ -4558,10 +4545,8 @@ int perf_event_read_local(struct perf_ev
 		if (running)
 			*running = __running;
 	}
-out:
-	local_irq_restore(flags);
 
-	return ret;
+	return 0;
 }
 
 static int perf_event_read(struct perf_event *event, bool group)
@@ -4595,7 +4580,7 @@ static int perf_event_read(struct perf_e
 			.ret = 0,
 		};
 
-		preempt_disable();
+		guard(preempt)();
 		event_cpu = __perf_event_read_cpu(event, event_cpu);
 
 		/*
@@ -4609,19 +4594,15 @@ static int perf_event_read(struct perf_e
 		 * after this.
 		 */
 		(void)smp_call_function_single(event_cpu, __perf_event_read, &data, 1);
-		preempt_enable();
 		ret = data.ret;
 
 	} else if (state == PERF_EVENT_STATE_INACTIVE) {
 		struct perf_event_context *ctx = event->ctx;
-		unsigned long flags;
 
-		raw_spin_lock_irqsave(&ctx->lock, flags);
+		guard(raw_spinlock_irqsave)(&ctx->lock);
 		state = event->state;
-		if (state != PERF_EVENT_STATE_INACTIVE) {
-			raw_spin_unlock_irqrestore(&ctx->lock, flags);
+		if (state != PERF_EVENT_STATE_INACTIVE)
 			goto again;
-		}
 
 		/*
 		 * May read while context is not active (e.g., thread is
@@ -4635,7 +4616,6 @@ static int perf_event_read(struct perf_e
 		perf_event_update_time(event);
 		if (group)
 			perf_event_update_sibling_time(event);
-		raw_spin_unlock_irqrestore(&ctx->lock, flags);
 	}
 
 	return ret;


