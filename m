Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BBE168DC
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=4+/Q1nIn7pjeaoOkqiN8ZoN9dOzRXj0Qx8pmucBG9KU=; b=CGHl8Ke92uJbbyjxJGKK8koPvn
	7wHNWoLM/OkAmrZ4gFQeXc0QQYBrCLhXWZt2umEgQksz88cD9v5hn14i7kQSP4K9xSMDFQh7PWwsv
	vQ1SFBK+bYKYSFKj0XwP0Ih62MxyjrlkyHVnaSND5EqZmqUghHIM16cEmrRxwbC47HZ2K2goOhkXP
	7bLK4qmMqxam/hy7LL1/k9bAfAGqb3r2FCP5gi8DTPb2h4vhx5jv0YK9/YQ7I/abyHFJxNBAwqOtq
	5BakdSMaPpb64bGqaUJXeYcn8P33r4cdzpzV0yukOTXCzKuo49ETcvhq4nvaUPnPQLSdX4jXV6W/Q
	oznHsxwg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e0j-008kPs-37;
	Mon, 12 Jun 2023 09:38:54 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CCFC330316E;
	Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 3C3B930A70ADE; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093538.307089780@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:25 +0200
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
Subject: [PATCH v3 12/57] sched: Simplify try_steal_cookie()
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
@@ -6229,19 +6229,19 @@ static bool try_steal_cookie(int this, i
 	unsigned long cookie;
 	bool success = false;
 
-	local_irq_disable();
-	double_rq_lock(dst, src);
+	guard(irq)();
+	guard(double_rq_lock)(dst, src);
 
 	cookie = dst->core->core_cookie;
 	if (!cookie)
-		goto unlock;
+		return false;
 
 	if (dst->curr != dst->idle)
-		goto unlock;
+		return false;
 
 	p = sched_core_find(src, cookie);
 	if (!p)
-		goto unlock;
+		return false;
 
 	do {
 		if (p == src->core_pick || p == src->curr)
@@ -6253,9 +6253,10 @@ static bool try_steal_cookie(int this, i
 		if (p->core_occupation > dst->idle->core_occupation)
 			goto next;
 		/*
-		 * sched_core_find() and sched_core_next() will ensure that task @p
-		 * is not throttled now, we also need to check whether the runqueue
-		 * of the destination CPU is being throttled.
+		 * sched_core_find() and sched_core_next() will ensure
+		 * that task @p is not throttled now, we also need to
+		 * check whether the runqueue of the destination CPU is
+		 * being throttled.
 		 */
 		if (sched_task_is_throttled(p, this))
 			goto next;
@@ -6273,10 +6274,6 @@ static bool try_steal_cookie(int this, i
 		p = sched_core_next(p, cookie);
 	} while (p);
 
-unlock:
-	double_rq_unlock(dst, src);
-	local_irq_enable();
-
 	return success;
 }
 


