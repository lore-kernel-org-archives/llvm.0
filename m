Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B6018AF0
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=vBUL+P10jAOvg5j6kSlF2qo+oprvGK1yGYCCYSiAqlM=; b=NFuacbXRk1gej6UwVgLc5tNbL/
	Rg3HhKBUmBwl5eLO+25JusMfSuIbyFVR/iUbv784FGfrgacXrn7NqDLzDE0FRvICex1OyPQ1v6sir
	2XfS9G9NRaxckYmtb2iC8wKstPTcK7x76yeCDSmRMdFkjrgTu/V1PBFcOb8PR+SJS4k4G3LaUbuug
	aLZU4s0ZG5xxXzMb3tMoJAIyEzjBHzcirZvJrDNWxTDRGx2uI+jItcz4dFj/bh+yWpfl6YNw2dwMf
	dkRpxXp9x4mnWBxHUfuIuRlkVIDAL6TszLM10QD9hqFaG724GHiWCbVaBNkbUXvGCxbDmMTuu5725
	3aUtil+g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q8e0m-002NBt-Dt; Mon, 12 Jun 2023 09:38:56 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 27D323031CC;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 9C85030A77B66; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093539.611540686@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:42 +0200
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
Subject: [PATCH v3 29/57] perf: Simplify: __perf_install_in_context()
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
 kernel/events/core.c |   21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -2732,13 +2732,13 @@ static int  __perf_install_in_context(vo
 	struct perf_cpu_context *cpuctx = this_cpu_ptr(&perf_cpu_context);
 	struct perf_event_context *task_ctx = cpuctx->task_ctx;
 	bool reprogram = true;
-	int ret = 0;
 
-	raw_spin_lock(&cpuctx->ctx.lock);
-	if (ctx->task) {
-		raw_spin_lock(&ctx->lock);
+	if (ctx->task)
 		task_ctx = ctx;
 
+	guard(perf_ctx_lock)(cpuctx, task_ctx);
+
+	if (ctx->task) {
 		reprogram = (ctx->task == current);
 
 		/*
@@ -2748,14 +2748,10 @@ static int  __perf_install_in_context(vo
 		 * If its not running, we don't care, ctx->lock will
 		 * serialize against it becoming runnable.
 		 */
-		if (task_curr(ctx->task) && !reprogram) {
-			ret = -ESRCH;
-			goto unlock;
-		}
+		if (task_curr(ctx->task) && !reprogram)
+			return -ESRCH;
 
 		WARN_ON_ONCE(reprogram && cpuctx->task_ctx && cpuctx->task_ctx != ctx);
-	} else if (task_ctx) {
-		raw_spin_lock(&task_ctx->lock);
 	}
 
 #ifdef CONFIG_CGROUP_PERF
@@ -2778,10 +2774,7 @@ static int  __perf_install_in_context(vo
 		add_event_to_ctx(event, ctx);
 	}
 
-unlock:
-	perf_ctx_unlock(cpuctx, task_ctx);
-
-	return ret;
+	return 0;
 }
 
 static bool exclusive_event_installable(struct perf_event *event,


