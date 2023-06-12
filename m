Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E816182BD
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=MG7QpnmCwLygWJ81Mn2iabAPA0zngwNBxpS2UJOPCco=; b=aXuukbWfDT3crpdpELnmpXOIr1
	rmi7tOYHchwZ0ZWw12XRPDCQqRwMiqZMiABYBZi2O+0tfNVzQRKi9P8ydd//mWeA7oQObClsjTE7E
	LHFghoj5tdofv/RNddLTT0JWVj87F1f4zRP5QUXDwod/ck/TDyMXZ81p3o1Z6UVNSI9dRWMzyaW7W
	AD+qE0/n4a7Qe6Z1Xg8QD2b21dyEkZzvC33hTI2lYy5oByr7zAHpxalio1Yq2xpIfpyfIQyhGsstj
	/SW7fmJDwrmmYyPiT1S62tcE02v5eg0/HjDJXCTz1h+1fcNR5efvE/6XROFvb22ZtQgISEaHBYV0v
	ZehA35sA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e0j-008kPt-35;
	Mon, 12 Jun 2023 09:38:54 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E089A303191;
	Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 46BE630A77B54; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093538.465891562@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:27 +0200
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
Subject: [PATCH v3 14/57] sched: Simplify set_user_nice()
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
 kernel/sched/core.c  |   13 ++++++-------
 kernel/sched/sched.h |    5 +++++
 2 files changed, 11 insertions(+), 7 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -7119,9 +7119,8 @@ static inline int rt_effective_prio(stru
 void set_user_nice(struct task_struct *p, long nice)
 {
 	bool queued, running;
-	int old_prio;
-	struct rq_flags rf;
 	struct rq *rq;
+	int old_prio;
 
 	if (task_nice(p) == nice || nice < MIN_NICE || nice > MAX_NICE)
 		return;
@@ -7129,7 +7128,9 @@ void set_user_nice(struct task_struct *p
 	 * We have to be careful, if called from sys_setpriority(),
 	 * the task might be in the middle of scheduling on another CPU.
 	 */
-	rq = task_rq_lock(p, &rf);
+	CLASS(task_rq_lock, rq_guard)(p);
+	rq = rq_guard.rq;
+
 	update_rq_clock(rq);
 
 	/*
@@ -7140,8 +7141,9 @@ void set_user_nice(struct task_struct *p
 	 */
 	if (task_has_dl_policy(p) || task_has_rt_policy(p)) {
 		p->static_prio = NICE_TO_PRIO(nice);
-		goto out_unlock;
+		return;
 	}
+
 	queued = task_on_rq_queued(p);
 	running = task_current(rq, p);
 	if (queued)
@@ -7164,9 +7166,6 @@ void set_user_nice(struct task_struct *p
 	 * lowered its priority, then reschedule its CPU:
 	 */
 	p->sched_class->prio_changed(rq, p, old_prio);
-
-out_unlock:
-	task_rq_unlock(rq, p, &rf);
 }
 EXPORT_SYMBOL(set_user_nice);
 
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1630,6 +1630,11 @@ task_rq_unlock(struct rq *rq, struct tas
 	raw_spin_unlock_irqrestore(&p->pi_lock, rf->flags);
 }
 
+DEFINE_LOCK_GUARD_1(task_rq_lock, struct task_struct,
+		    _T->rq = task_rq_lock(_T->lock, &_T->rf),
+		    task_rq_unlock(_T->rq, _T->lock, &_T->rf),
+		    struct rq *rq; struct rq_flags rf)
+
 static inline void
 rq_lock_irqsave(struct rq *rq, struct rq_flags *rf)
 	__acquires(rq->lock)


