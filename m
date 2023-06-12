Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E1B18AE4
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=VwLJzq4wQCJ4xfIoCm0MOddWikggSaLNbFpG3XgsB1U=; b=dDnxyA36tfL2pJa+fjQ2VTeARz
	uh5lFYPphgrzEScOZBiNSB/l0JET6lz9vuFxdA8IjoxWv//Mx3BL1bDtn1P4YIMrpV/FRB35iPjRQ
	S/2hc5m9oTCtV65ICDia0XlNp2GJ0x2OKDtdrc7GG+LtRuBqj2191E0uWBwd1NiC6XGa9rjhVrcph
	ZKoLG6i5q8+lBORMXKkBhDQwET2tp7pp2axVFoU3Tu0b7dxGOs6WD1mFYQPYjDOIn9x8uoZZFJBye
	DG5AK1uryNKX7xiUVquINqYQD8O0H4yN8nueL4W+D6yuGI4G4JIeE0rBu/zP8xN1C128nOvfhbHfZ
	MmQ71Gaw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8e0u-008kRz-1Q;
	Mon, 12 Jun 2023 09:39:09 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4DE533033EF;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id E135130A77B73; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093540.493651920@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:54 +0200
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
Subject: [PATCH v3 41/57] perf: Simplify __perf_event_output()
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
 kernel/events/core.c |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -7739,22 +7739,17 @@ __perf_event_output(struct perf_event *e
 	int err;
 
 	/* protect the callchain buffers */
-	rcu_read_lock();
+	guard(rcu)();
 
 	perf_prepare_sample(data, event, regs);
 	perf_prepare_header(&header, data, event, regs);
-
 	err = output_begin(&handle, data, event, header.size);
 	if (err)
-		goto exit;
-
+		return err;
 	perf_output_sample(&handle, &header, data, event);
-
 	perf_output_end(&handle);
 
-exit:
-	rcu_read_unlock();
-	return err;
+	return 0;
 }
 
 void


