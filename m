Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB1818AF9
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=UxgZ8gBb/X/LH3e6EzhOyo9roeaslQ6np5gS0C0ZzJo=; b=Ku/t+uwBxcqEV4o8+xZ+jpXBBt
	FWrdQHAgk/+eAox1Yy+gfbVADpk/LbCphZgsxdUlobKu4+TaYfqV9KxLiuLGWQd9GNW+WuVAzfxiF
	dJWeGD6CwmQK05LoRE6BdXJfHnUbooKiSjkY8hx0yVmWbhbvE/3eESTNuU47tNoA+PujXrr4ImhHY
	MjUH8zDthMar/X1SGJ+REjWeg4WZQuw7ZK157DBPaBMQ3SHNY2+9JiWw4s5+qY9wtno0nOszWVFPI
	9n0qmTh63fK6roRgD8IfwefdUUqtIEBiPp48mJShCtT+omUi7MWUoaxm2w+oKxK8nIm3bgKuUxtat
	UH/09s6A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e0w-008kSz-2Z;
	Mon, 12 Jun 2023 09:39:14 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5D89D3060F1;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 08B3F30A77B7C; Mon, 12 Jun 2023 11:38:49 +0200 (CEST)
Message-ID: <20230612093540.850386350@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:59 +0200
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
Subject: [PATCH v3 46/57] perf: Simplify pmu_dev_alloc()
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
 kernel/events/core.c |   65 ++++++++++++++++++++++++---------------------------
 1 file changed, 31 insertions(+), 34 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -11285,49 +11285,46 @@ static void pmu_dev_release(struct devic
 
 static int pmu_dev_alloc(struct pmu *pmu)
 {
-	int ret = -ENOMEM;
+	int ret;
 
-	pmu->dev = kzalloc(sizeof(struct device), GFP_KERNEL);
-	if (!pmu->dev)
-		goto out;
+	struct device *dev __free(put_device) =
+		kzalloc(sizeof(struct device), GFP_KERNEL);
+	if (!dev)
+		return -ENOMEM;
 
-	pmu->dev->groups = pmu->attr_groups;
-	device_initialize(pmu->dev);
+	dev->groups = pmu->attr_groups;
+	device_initialize(dev);
 
-	dev_set_drvdata(pmu->dev, pmu);
-	pmu->dev->bus = &pmu_bus;
-	pmu->dev->release = pmu_dev_release;
+	dev_set_drvdata(dev, pmu);
+	dev->bus = &pmu_bus;
+	dev->release = pmu_dev_release;
 
-	ret = dev_set_name(pmu->dev, "%s", pmu->name);
+	ret = dev_set_name(dev, "%s", pmu->name);
 	if (ret)
-		goto free_dev;
+		return ret;
 
-	ret = device_add(pmu->dev);
+	ret = device_add(dev);
 	if (ret)
-		goto free_dev;
+		return ret;
 
-	/* For PMUs with address filters, throw in an extra attribute: */
-	if (pmu->nr_addr_filters)
-		ret = device_create_file(pmu->dev, &dev_attr_nr_addr_filters);
-
-	if (ret)
-		goto del_dev;
+	struct device *del __free(device_del) = dev;
 
-	if (pmu->attr_update)
-		ret = sysfs_update_groups(&pmu->dev->kobj, pmu->attr_update);
-
-	if (ret)
-		goto del_dev;
-
-out:
-	return ret;
-
-del_dev:
-	device_del(pmu->dev);
-
-free_dev:
-	put_device(pmu->dev);
-	goto out;
+	/* For PMUs with address filters, throw in an extra attribute: */
+	if (pmu->nr_addr_filters) {
+		ret = device_create_file(dev, &dev_attr_nr_addr_filters);
+		if (ret)
+			return ret;
+	}
+
+	if (pmu->attr_update) {
+		ret = sysfs_update_groups(&dev->kobj, pmu->attr_update);
+		if (ret)
+			return ret;
+	}
+
+	no_free_ptr(del);
+	pmu->dev = no_free_ptr(dev);
+	return 0;
 }
 
 static struct lock_class_key cpuctx_mutex;


