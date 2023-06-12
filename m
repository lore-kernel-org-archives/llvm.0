Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209C4182B3
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=TyEqnNyUrGcTyQQqxTQ7FjrgTS2UCJUv6R0g2vbKlfY=; b=W3vYREkn6nmwiT+ntOqAYxzt6I
	UW2S2qrdXPfb14Rbz7wHf2bg/IoTSx5lfGRX090LasJz4rWdsKfAVa/7leavmIr5opuFsnNkEMGRE
	Jq0yYQL2oqD2gkmdoVpyklQu1gQPZDAp4DVKmlNqxex5A9h5ODPAeOyOySjuKTNq2fgWkPF6oj+Nh
	jTNZK/f0LzpA/BcuzFvbCoEQJHlrgqK8dPSHc8iHLLV/k48DWj8eSmcHghW0npAlGA6xG4XcJpDTK
	IRqoCkBrBlXXMgWKBciZm520MT70bbMRJwql9ZadgSAP9ZfIX6UGVYD8VPVyOzry9z3sCF8wRvbnN
	3C0Xe6ZQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e0n-008kRA-1M;
	Mon, 12 Jun 2023 09:39:03 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 35B003032CB;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id C402E30A77B6D; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093540.108251860@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:49 +0200
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
Subject: [PATCH v3 36/57] perf: Simplify find_get_pmu_context()
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
 kernel/events/core.c |   19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -4757,11 +4757,14 @@ find_get_context(struct task_struct *tas
 	return ERR_PTR(err);
 }
 
+/*
+ * Returns a matching perf_event_pmu_context with elevated refcount or NULL.
+ */
 static struct perf_event_pmu_context *
 find_get_pmu_context(struct pmu *pmu, struct perf_event_context *ctx,
 		     struct perf_event *event)
 {
-	struct perf_event_pmu_context *new = NULL, *epc;
+	struct perf_event_pmu_context *epc;
 	void *task_ctx_data = NULL;
 
 	if (!ctx->task) {
@@ -4788,16 +4791,14 @@ find_get_pmu_context(struct pmu *pmu, st
 		return epc;
 	}
 
-	new = kzalloc(sizeof(*epc), GFP_KERNEL);
+	void *new __free(kfree) = kzalloc(sizeof(*epc), GFP_KERNEL);
 	if (!new)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	if (event->attach_state & PERF_ATTACH_TASK_DATA) {
 		task_ctx_data = alloc_task_ctx_data(pmu);
-		if (!task_ctx_data) {
-			kfree(new);
-			return ERR_PTR(-ENOMEM);
-		}
+		if (!task_ctx_data)
+			return NULL;
 	}
 
 	__perf_init_event_pmu_context(new, pmu);
@@ -4820,8 +4821,7 @@ find_get_pmu_context(struct pmu *pmu, st
 		}
 	}
 
-	epc = new;
-	new = NULL;
+	epc = no_free_ptr(new);
 
 	list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
 	epc->ctx = ctx;
@@ -4835,7 +4835,6 @@ find_get_pmu_context(struct pmu *pmu, st
 	raw_spin_unlock_irq(&ctx->lock);
 
 	free_task_ctx_data(pmu, task_ctx_data);
-	kfree(new);
 
 	return epc;
 }


