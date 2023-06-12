Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C179182DD
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=i7e4Ed2VApizqqMeLDQrTIcscOdlMDKi2d1+AvdLSfc=; b=TLH0h/m4GoAk2wL3yh55l4IzRI
	jY9uOtCPaEekSHLEHO8dDm8WEVzCjRv1x76mT4+w1m038KSAfu8dqm5waSVM52O+uEiDXRHj/jCgu
	3DWmoUeWCVAOAuw2WN+lfGOVAExS++x0sVfkBCBE3yIsAN9sXvVqSjnvZRHqXwA5S+fjYQ5uqOUPg
	0le2x7tEhFXGMyx0cXp7Nb7aE39s4gkVOuB7q76B1xrcm5cJoBCfcYfpoaz9BXhdEJ6sMWOpWd3CX
	MxsZp6OHCLa+XGQ39oxUnzAB8YNwtKxDXcEb/izP3qhSFz+f2JtTW5ORQ4UhQcKzxHWZwbIwAMMDK
	7jLMY3/w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e0j-008kPm-11;
	Mon, 12 Jun 2023 09:38:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A5223302F8F;
	Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 22F9530A70248; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093537.977924652@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:21 +0200
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
Subject: [PATCH v3 08/57] sched: Simplify wake_up_if_idle()
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
 kernel/sched/core.c  |   20 ++++++--------------
 kernel/sched/sched.h |   15 +++++++++++++++
 2 files changed, 21 insertions(+), 14 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3872,21 +3872,13 @@ static void __ttwu_queue_wakelist(struct
 void wake_up_if_idle(int cpu)
 {
 	struct rq *rq = cpu_rq(cpu);
-	struct rq_flags rf;
 
-	rcu_read_lock();
-
-	if (!is_idle_task(rcu_dereference(rq->curr)))
-		goto out;
-
-	rq_lock_irqsave(rq, &rf);
-	if (is_idle_task(rq->curr))
-		resched_curr(rq);
-	/* Else CPU is not idle, do nothing here: */
-	rq_unlock_irqrestore(rq, &rf);
-
-out:
-	rcu_read_unlock();
+	guard(rcu)();
+	if (is_idle_task(rcu_dereference(rq->curr))) {
+		guard(rq_lock)(rq);
+		if (is_idle_task(rq->curr))
+			resched_curr(rq);
+	}
 }
 
 bool cpus_share_cache(int this_cpu, int that_cpu)
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1678,6 +1678,21 @@ rq_unlock(struct rq *rq, struct rq_flags
 	raw_spin_rq_unlock(rq);
 }
 
+DEFINE_LOCK_GUARD_1(rq_lock, struct rq,
+		    rq_lock(_T->lock, &_T->rf),
+		    rq_unlock(_T->lock, &_T->rf),
+		    struct rq_flags rf)
+
+DEFINE_LOCK_GUARD_1(rq_lock_irq, struct rq,
+		    rq_lock_irq(_T->lock, &_T->rf),
+		    rq_unlock_irq(_T->lock, &_T->rf),
+		    struct rq_flags rf)
+
+DEFINE_LOCK_GUARD_1(rq_lock_irqsave, struct rq,
+		    rq_lock_irqsave(_T->lock, &_T->rf),
+		    rq_unlock_irqrestore(_T->lock, &_T->rf),
+		    struct rq_flags rf)
+
 static inline struct rq *
 this_rq_lock_irq(struct rq_flags *rf)
 	__acquires(rq->lock)


