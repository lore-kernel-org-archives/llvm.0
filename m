Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683FF17AA3
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=RF7AlZRmRPruwiE6WSJ8fgsVWKVvpbmYdppCd/KBEkQ=; b=RnySH+cxU2P4SRyBNjFB/FhqFH
	0/24hRC8l1Y+RzqS9t+LLJgYTbpemr3uJbKUzAhz4nDyzkTPxi01OU3HfrP75fxls9S78Wd7ksLPt
	/IGrVYxHpIECVcQ0BB0l79olUuLK3KmcgCUPsADYEITDkzUhiby4ZeFVXhVHF+xfIHbIUmN1Lzu8A
	4hXtsrfh7u8Q7WjPFmeWG58TDtMn+x8XnoBzWdX7mctC0o//NiJ96Wm8JS4EP+QDO3AE+Uq8F1iAp
	E1B5jo2/jWWweXA0Icm938LOtGEZZ3OkgMyx6u7AwZEvVq/NZqo4EN5kDmmfwdXP6QQ4WokIoemI6
	Sv19YETA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e0m-008kQs-39;
	Mon, 12 Jun 2023 09:39:01 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 280E63031E0;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id A1B8930A77B67; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093539.682563843@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:43 +0200
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
Subject: [PATCH v3 30/57] perf: Simplify: *perf_event_{dis,en}able*()
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
 kernel/events/core.c |   51 ++++++++++++++++++++++-----------------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -2415,7 +2415,7 @@ static void __perf_event_disable(struct
 		update_cgrp_time_from_event(event);
 	}
 
-	perf_pmu_disable(event->pmu_ctx->pmu);
+	guard(perf_pmu_disable)(event->pmu_ctx->pmu);
 
 	if (event == event->group_leader)
 		group_sched_out(event, ctx);
@@ -2424,8 +2424,6 @@ static void __perf_event_disable(struct
 
 	perf_event_set_state(event, PERF_EVENT_STATE_OFF);
 	perf_cgroup_event_disable(event, ctx);
-
-	perf_pmu_enable(event->pmu_ctx->pmu);
 }
 
 /*
@@ -2446,12 +2444,10 @@ static void _perf_event_disable(struct p
 {
 	struct perf_event_context *ctx = event->ctx;
 
-	raw_spin_lock_irq(&ctx->lock);
-	if (event->state <= PERF_EVENT_STATE_OFF) {
-		raw_spin_unlock_irq(&ctx->lock);
-		return;
+	scoped_guard (raw_spinlock_irq, &ctx->lock) {
+		if (event->state <= PERF_EVENT_STATE_OFF)
+			return;
 	}
-	raw_spin_unlock_irq(&ctx->lock);
 
 	event_function_call(event, __perf_event_disable, NULL);
 }
@@ -2955,32 +2951,29 @@ static void _perf_event_enable(struct pe
 {
 	struct perf_event_context *ctx = event->ctx;
 
-	raw_spin_lock_irq(&ctx->lock);
-	if (event->state >= PERF_EVENT_STATE_INACTIVE ||
-	    event->state <  PERF_EVENT_STATE_ERROR) {
-out:
-		raw_spin_unlock_irq(&ctx->lock);
-		return;
-	}
+	scoped_guard (raw_spinlock_irq, &ctx->lock) {
+		if (event->state >= PERF_EVENT_STATE_INACTIVE ||
+		    event->state <  PERF_EVENT_STATE_ERROR)
+			return;
 
-	/*
-	 * If the event is in error state, clear that first.
-	 *
-	 * That way, if we see the event in error state below, we know that it
-	 * has gone back into error state, as distinct from the task having
-	 * been scheduled away before the cross-call arrived.
-	 */
-	if (event->state == PERF_EVENT_STATE_ERROR) {
 		/*
-		 * Detached SIBLING events cannot leave ERROR state.
+		 * If the event is in error state, clear that first.
+		 *
+		 * That way, if we see the event in error state below, we know that it
+		 * has gone back into error state, as distinct from the task having
+		 * been scheduled away before the cross-call arrived.
 		 */
-		if (event->event_caps & PERF_EV_CAP_SIBLING &&
-		    event->group_leader == event)
-			goto out;
+		if (event->state == PERF_EVENT_STATE_ERROR) {
+			/*
+			 * Detached SIBLING events cannot leave ERROR state.
+			 */
+			if (event->event_caps & PERF_EV_CAP_SIBLING &&
+			    event->group_leader == event)
+				return;
 
-		event->state = PERF_EVENT_STATE_OFF;
+			event->state = PERF_EVENT_STATE_OFF;
+		}
 	}
-	raw_spin_unlock_irq(&ctx->lock);
 
 	event_function_call(event, __perf_event_enable, NULL);
 }


