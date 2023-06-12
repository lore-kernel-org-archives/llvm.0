Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ACE18C00
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=uQ/8+qtEwxL57I4UlVvTVvhZ1JibWBOVMl2SE33h5lQ=; b=ZOiq1ke3pot53kQunNRUtXsq1d
	V5y/hgJbdq0ZCpi19CP5k0s9TVugeElYoMtBjNQiMfKhriDdOViXz13z+mXjhQs1lh5Add+N5EsA+
	97Ytp162GD8DmEyvlIAZDmbyvOg0B9z6LUmK67yAvvHZt5LgJpEb+JZMCr+61gpJu+KOVFSzfR36F
	3tqTV1asHS3VYK51N36Uh7QTWlIeQvJ59dJfAYcdLbTUgO2wX/hJw43LbU5N+I998tv53aUMKO5L4
	LpWRzwVaRTJBUgMK657xFiLyq8TevHcFHer9zZyt+HcUX4ZJRPRohzv80h606NIyeSXIMh+J++VC2
	8w01ss2A==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q8e0t-002NH2-HK; Mon, 12 Jun 2023 09:39:03 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 52E42303406;
	Mon, 12 Jun 2023 11:38:53 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id F2AAD30A77B78; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093540.708955479@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:57 +0200
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
Subject: [PATCH v3 44/57] perf: Simplify bpf_overflow_handler()
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
 kernel/events/core.c |   16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -10288,16 +10288,14 @@ static void bpf_overflow_handler(struct
 	int ret = 0;
 
 	ctx.regs = perf_arch_bpf_user_pt_regs(regs);
-	if (unlikely(__this_cpu_inc_return(bpf_prog_active) != 1))
-		goto out;
-	rcu_read_lock();
-	prog = READ_ONCE(event->prog);
-	if (prog) {
-		perf_prepare_sample(data, event, regs);
-		ret = bpf_prog_run(prog, &ctx);
+	if (likely(__this_cpu_inc_return(bpf_prog_active) == 1)) {
+		guard(rcu)();
+		prog = READ_ONCE(event->prog);
+		if (prog) {
+			perf_prepare_sample(data, event, regs);
+			ret = bpf_prog_run(prog, &ctx);
+		}
 	}
-	rcu_read_unlock();
-out:
 	__this_cpu_dec(bpf_prog_active);
 	if (!ret)
 		return;


