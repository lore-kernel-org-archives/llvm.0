Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472CF182C4
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=q92jsVFPZSP8G7FOeDp8TiMSNcZFRY9w1smIqAIutpc=; b=cC3P05pE1HH/s/tUR84v5mVIAO
	kPGxqIz/FKjqtp+XWrF/jcaJBTTdb46IPie32qxZbfjlzy/0boCc4eL/PNs9nOrnR/JIYKgJ2hPBE
	30WlTKP2Xn4GIseF5sfJN6BUqdSfvcIqMDrCRGs7WaVlcgSi6IAfn0dQDvvdQgKCg8ll0HLzOe0yi
	HfpPhPlF4UX3STerOIzqwzzinQ28XHstWcQuhaPRyfeoqSRSeCy+uNg25cZvGOChp4XMZR1B9/Cik
	kZ/MkwuVPscwEUL3+6RCvT6Km37MHjOnTk9FOuBRgxmqVRXPo0OCW52lQsNInBJ0V/fuO59PYN/hJ
	32gsL4KQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q8e0k-002NAl-K1; Mon, 12 Jun 2023 09:38:54 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C3A90303162;
	Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 3619930A70ADD; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093538.225353309@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:24 +0200
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
Subject: [PATCH v3 11/57] sched: Simplify sched_tick_remote()
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
 kernel/sched/core.c |   43 ++++++++++++++++++-------------------------
 1 file changed, 18 insertions(+), 25 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5651,9 +5651,6 @@ static void sched_tick_remote(struct wor
 	struct tick_work *twork = container_of(dwork, struct tick_work, work);
 	int cpu = twork->cpu;
 	struct rq *rq = cpu_rq(cpu);
-	struct task_struct *curr;
-	struct rq_flags rf;
-	u64 delta;
 	int os;
 
 	/*
@@ -5663,30 +5660,26 @@ static void sched_tick_remote(struct wor
 	 * statistics and checks timeslices in a time-independent way, regardless
 	 * of when exactly it is running.
 	 */
-	if (!tick_nohz_tick_stopped_cpu(cpu))
-		goto out_requeue;
+	if (tick_nohz_tick_stopped_cpu(cpu)) {
+		guard(rq_lock_irq)(rq);
+		struct task_struct *curr = rq->curr;
+
+		if (cpu_online(cpu)) {
+			update_rq_clock(rq);
+
+			if (!is_idle_task(curr)) {
+				/*
+				 * Make sure the next tick runs within a
+				 * reasonable amount of time.
+				 */
+				u64 delta = rq_clock_task(rq) - curr->se.exec_start;
+				WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 3);
+			}
+			curr->sched_class->task_tick(rq, curr, 0);
 
-	rq_lock_irq(rq, &rf);
-	curr = rq->curr;
-	if (cpu_is_offline(cpu))
-		goto out_unlock;
-
-	update_rq_clock(rq);
-
-	if (!is_idle_task(curr)) {
-		/*
-		 * Make sure the next tick runs within a reasonable
-		 * amount of time.
-		 */
-		delta = rq_clock_task(rq) - curr->se.exec_start;
-		WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 3);
+			calc_load_nohz_remote(rq);
+		}
 	}
-	curr->sched_class->task_tick(rq, curr, 0);
-
-	calc_load_nohz_remote(rq);
-out_unlock:
-	rq_unlock_irq(rq, &rf);
-out_requeue:
 
 	/*
 	 * Run the remote tick once per second (1Hz). This arbitrary


