Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B7D18AF0
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=+L1iRMB4nmmwqwHgVqKFu6YfCZFh/nRXnBwlrRSlD8U=; b=l5xj7YGzJ9MdhjON14EglYylfb
	EUJR7pTy41tsIuQd/y8kaQMmrJ9fElXhiqo9DWPGQdbTysXorMONJYbUV32badyMRfJ6FtwpAqm8q
	MrRCCUwayKttRKiybuscWI0p2QeD1tB1bFl2j3WWcLoF0X3lf3CXo5QJNxmDbKinDGBeOyfmOnCmE
	/X8HQXxGnjIJh6P2iSVevWCVPQOR2KEMRITnwTM+axmnZ04Qca94zWTCsbQuzm8vouhn1vucYwRPz
	ikxH7Y5hIrYuhlASOvPFvUPLPcwK+A7TojGeBVZRwTm0dLa6sZ1kwP6vqSDQ3x01lzmRoAfM1wG2Q
	uh+mWrGQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q8e0l-002NBG-Hh; Mon, 12 Jun 2023 09:38:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 184DF303189;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 7AB6530A77B60; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093539.228708854@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:37 +0200
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
Subject: [PATCH v3 24/57] perf: Simplify perf_pmu_register() error path
References: <20230612090713.652690195@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

The error path of perf_pmu_register() is of course very similar to a
subset of perf_pmu_unregister(). Extract this common part in
__perf_pmu_unregister() and simplify things.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/events/core.c |   51 ++++++++++++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 27 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -11426,20 +11426,35 @@ static int pmu_dev_alloc(struct pmu *pmu
 static struct lock_class_key cpuctx_mutex;
 static struct lock_class_key cpuctx_lock;
 
+static void __perf_pmu_unregister(struct pmu *pmu)
+{
+	free_percpu(pmu->pmu_disable_count);
+	if (pmu->type >= 0)
+		idr_remove(&pmu_idr, pmu->type);
+	if (pmu_bus_running && pmu->dev && pmu->dev != PMU_NULL_DEV) {
+		if (pmu->nr_addr_filters)
+			device_remove_file(pmu->dev, &dev_attr_nr_addr_filters);
+		device_del(pmu->dev);
+		put_device(pmu->dev);
+	}
+	free_pmu_context(pmu);
+}
+
 int perf_pmu_register(struct pmu *pmu, const char *name, int type)
 {
 	int cpu, ret, max = PERF_TYPE_MAX;
 
+	pmu->type = -1;
+
 	mutex_lock(&pmus_lock);
 	ret = -ENOMEM;
 	pmu->pmu_disable_count = alloc_percpu(int);
 	if (!pmu->pmu_disable_count)
 		goto unlock;
 
-	pmu->type = -1;
 	if (WARN_ONCE(!name, "Can not register anonymous pmu.\n")) {
 		ret = -EINVAL;
-		goto free_pdc;
+		goto free;
 	}
 
 	pmu->name = name;
@@ -11449,23 +11464,22 @@ int perf_pmu_register(struct pmu *pmu, c
 
 	ret = idr_alloc(&pmu_idr, pmu, max, 0, GFP_KERNEL);
 	if (ret < 0)
-		goto free_pdc;
+		goto free;
 
 	WARN_ON(type >= 0 && ret != type);
 
-	type = ret;
-	pmu->type = type;
+	pmu->type = ret;
 
 	if (pmu_bus_running && !pmu->dev) {
 		ret = pmu_dev_alloc(pmu);
 		if (ret)
-			goto free_idr;
+			goto free;
 	}
 
 	ret = -ENOMEM;
 	pmu->cpu_pmu_context = alloc_percpu(struct perf_cpu_pmu_context);
 	if (!pmu->cpu_pmu_context)
-		goto free_dev;
+		goto free;
 
 	for_each_possible_cpu(cpu) {
 		struct perf_cpu_pmu_context *cpc;
@@ -11511,17 +11525,8 @@ int perf_pmu_register(struct pmu *pmu, c
 
 	return ret;
 
-free_dev:
-	if (pmu->dev && pmu->dev != PMU_NULL_DEV) {
-		device_del(pmu->dev);
-		put_device(pmu->dev);
-	}
-
-free_idr:
-	idr_remove(&pmu_idr, pmu->type);
-
-free_pdc:
-	free_percpu(pmu->pmu_disable_count);
+free:
+	__perf_pmu_unregister(pmu);
 	goto unlock;
 }
 EXPORT_SYMBOL_GPL(perf_pmu_register);
@@ -11538,15 +11543,7 @@ void perf_pmu_unregister(struct pmu *pmu
 	synchronize_srcu(&pmus_srcu);
 	synchronize_rcu();
 
-	free_percpu(pmu->pmu_disable_count);
-	idr_remove(&pmu_idr, pmu->type);
-	if (pmu_bus_running && pmu->dev && pmu->dev != PMU_NULL_DEV) {
-		if (pmu->nr_addr_filters)
-			device_remove_file(pmu->dev, &dev_attr_nr_addr_filters);
-		device_del(pmu->dev);
-		put_device(pmu->dev);
-	}
-	free_pmu_context(pmu);
+	__perf_pmu_unregister(pmu);
 	mutex_unlock(&pmus_lock);
 }
 EXPORT_SYMBOL_GPL(perf_pmu_unregister);


