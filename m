Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6397018B01
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=Hyp83c4zEQiDnre/2FuPX5V+t4FAU+QqZYq6E3vAduE=; b=p1jHX4au92g/f0sAw+1FR6aavH
	p6QFQFHYIJrl+W9ByL1Afng798ynxuaS4e4ihnokXGnNrUt3nIdpMVDjSOhi0Ql0j1xokLGJYxBG+
	9iylbl53m+zCAkDpTavlz7GiprlXoq+XtDc0/a8gE2k+4bqYhWwQHwGwa4781UfgcpsIDoYgEPzhM
	3IDEmW13lBEm/A7BOPzimLDiYGh8HPVFHMFd/fv/SI6LS/MoIQhA5hc04LpIDA21+rJdmI686FK+U
	md0fsTle+4f0RcUKleHrpn4wUGI9WuCKY36o21KrSBZZpz3jHNQQ+qyaLwLl++ztGMq3H4j2jaPkE
	Ips14cnw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q8e0n-002NC4-CM; Mon, 12 Jun 2023 09:38:57 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 2DC3F30328C;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id AE93C30A77B6A; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093539.823493926@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:45 +0200
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
Subject: [PATCH v3 32/57] perf: Simplify perf_event_context_sched_in()
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
 kernel/events/core.c |   38 +++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -713,6 +713,9 @@ static void perf_ctx_enable(struct perf_
 		perf_pmu_enable(pmu_ctx->pmu);
 }
 
+DEFINE_GUARD(perf_ctx_disable, struct perf_event_context *,
+	     perf_ctx_disable(_T), perf_ctx_enable(_T))
+
 static void ctx_sched_out(struct perf_event_context *ctx, enum event_type_t event_type);
 static void ctx_sched_in(struct perf_event_context *ctx, enum event_type_t event_type);
 
@@ -3906,31 +3909,27 @@ static void perf_event_context_sched_in(
 	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
 	struct perf_event_context *ctx;
 
-	rcu_read_lock();
+	guard(rcu)();
+
 	ctx = rcu_dereference(task->perf_event_ctxp);
 	if (!ctx)
-		goto rcu_unlock;
-
-	if (cpuctx->task_ctx == ctx) {
-		perf_ctx_lock(cpuctx, ctx);
-		perf_ctx_disable(ctx);
-
-		perf_ctx_sched_task_cb(ctx, true);
-
-		perf_ctx_enable(ctx);
-		perf_ctx_unlock(cpuctx, ctx);
-		goto rcu_unlock;
-	}
+		return;
 
-	perf_ctx_lock(cpuctx, ctx);
+	guard(perf_ctx_lock)(cpuctx, ctx);
 	/*
 	 * We must check ctx->nr_events while holding ctx->lock, such
 	 * that we serialize against perf_install_in_context().
 	 */
 	if (!ctx->nr_events)
-		goto unlock;
+		return;
+
+	guard(perf_ctx_disable)(ctx);
+
+	if (cpuctx->task_ctx == ctx) {
+		perf_ctx_sched_task_cb(ctx, true);
+		return;
+	}
 
-	perf_ctx_disable(ctx);
 	/*
 	 * We want to keep the following priority order:
 	 * cpu pinned (that don't need to move), task pinned,
@@ -3950,13 +3949,6 @@ static void perf_event_context_sched_in(
 
 	if (!RB_EMPTY_ROOT(&ctx->pinned_groups.tree))
 		perf_ctx_enable(&cpuctx->ctx);
-
-	perf_ctx_enable(ctx);
-
-unlock:
-	perf_ctx_unlock(cpuctx, ctx);
-rcu_unlock:
-	rcu_read_unlock();
 }
 
 /*


