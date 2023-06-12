Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4660418AF0
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=drbNuL55DYuL5wiscrlTnGAb/cO6SeGIhgtGTiA6PhQ=; b=bH0e8qVinII05JSphlSBy4C2Ad
	1lLJE0ZJ9ixmQHGKghR8/wH1Xn8Q3Vt1qAgL1hX89iIb9ADEykpg7vPePBT42Tafwlmwzj+QKR+vc
	YnjEu71MDvHvugm9gFlQvY8XOfsawOd5HbxRAxhPGIynJqZ05eVY3CmKBMjq2+PfNOFu7F9+Hk9+4
	02knBha22VA+1B2wJHHu2IizPO7D2l9K+h23m+s7dqVu7dBxdGjVD0lbwL2QtBSPvKRafFoKeuN8O
	/GeFM4wF9fTP7EEEC3wVGPg4481lAeW6eoPGVnh7qvDj1FaomSX67P5Y+3neHYc592A6GI9hIn0Cc
	m+oK+l2w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q8e0l-002NAp-1K; Mon, 12 Jun 2023 09:38:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BB8B73030F9;
	Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 3207B30A70AC5; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093538.154498590@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:23 +0200
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
Subject: [PATCH v3 10/57] sched: Simplify sched_exec()
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
 kernel/sched/core.c |   21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5431,23 +5431,20 @@ unsigned int nr_iowait(void)
 void sched_exec(void)
 {
 	struct task_struct *p = current;
-	unsigned long flags;
+	struct migration_arg arg;
 	int dest_cpu;
 
-	raw_spin_lock_irqsave(&p->pi_lock, flags);
-	dest_cpu = p->sched_class->select_task_rq(p, task_cpu(p), WF_EXEC);
-	if (dest_cpu == smp_processor_id())
-		goto unlock;
+	scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
+		dest_cpu = p->sched_class->select_task_rq(p, task_cpu(p), WF_EXEC);
+		if (dest_cpu == smp_processor_id())
+			return;
 
-	if (likely(cpu_active(dest_cpu))) {
-		struct migration_arg arg = { p, dest_cpu };
+		if (unlikely(!cpu_active(dest_cpu)))
+			return;
 
-		raw_spin_unlock_irqrestore(&p->pi_lock, flags);
-		stop_one_cpu(task_cpu(p), migration_cpu_stop, &arg);
-		return;
+		arg = (struct migration_arg){ p, dest_cpu };
 	}
-unlock:
-	raw_spin_unlock_irqrestore(&p->pi_lock, flags);
+	stop_one_cpu(task_cpu(p), migration_cpu_stop, &arg);
 }
 
 #endif


