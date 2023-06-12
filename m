Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3AA18AF0
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=LlQbmNANbazrx11NDWgZGA+KsXoINGT+PoaKYdOA2yY=; b=FAhhJcL5wzXpd6/fePyByMHlGt
	fkY+cHPA6B6pRWa2NAXR0yXWtu23wEpGEkpHmsxg7Y7bmjTCycz3uD4SRu3giSJxsLax8ExHTqJMo
	Fz1W4BW9ceAlCjfjf5iVusL/5gEkawP+3GN9Ff6xAxCcRGnC1vLTdTw4wd6ZXL8IpF1kM6Dpc03SL
	UdM9gMNV/IP1lr81r5RrkycCUd+hpHWPmzNYJ44TYZEAsY5+rqsBe+NiSCpDjijseaGTSWZjR5iYi
	9rhl+YpYvMKWtQXK3DRaHpkJQYxBNriEkyQ39xhPuoEDc+OeEH5pE3OpTYpp5HvZot7wCaROGgEVL
	aryp95oQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q8e12-002NTc-6H; Mon, 12 Jun 2023 09:39:12 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7840030615C;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 3CAAD30A7A29D; Mon, 12 Jun 2023 11:38:49 +0200 (CEST)
Message-ID: <20230612093541.598260416@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:08:09 +0200
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
Subject: [PATCH v3 56/57] perf: Simplify perf_pmu_output_stop()
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
 kernel/events/core.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7977,7 +7977,8 @@ static void perf_pmu_output_stop(struct
 	int err, cpu;
 
 restart:
-	rcu_read_lock();
+	/* cannot have a label in front of a decl */;
+	guard(rcu)();
 	list_for_each_entry_rcu(iter, &event->rb->event_list, rb_entry) {
 		/*
 		 * For per-CPU events, we need to make sure that neither they
@@ -7993,12 +7994,9 @@ static void perf_pmu_output_stop(struct
 			continue;
 
 		err = cpu_function_call(cpu, __perf_pmu_output_stop, event);
-		if (err == -EAGAIN) {
-			rcu_read_unlock();
+		if (err == -EAGAIN)
 			goto restart;
-		}
 	}
-	rcu_read_unlock();
 }
 
 /*


