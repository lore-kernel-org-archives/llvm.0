Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A0818AF0
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 09:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=QOVoxBXTqeJRoOWdQft4bGcKCTL4UyZrQG32knsR3k0=; b=c+D11F7FSqbBnyBLSSfE5UYd1l
	IvFPRzJeGLbLE977YxYQAS4g0jVtxP4+qS7e9sAEyGnpnM0/g6folbG9eSZv5iyY/d24GmbN9NGRN
	/+RkwB8o1SLLroMJqf+HzAXEkGvwurDfZKEjFEq3/dV71E5Xp3YhCsfoKdyKyuyYpRdWWU4rMR6bN
	7KySp2Drh9CXlO7audT1YOfwwh4FrL2zBrKIN+tMW03xlMnBm4G7PO6JWp8epOgTbND+XuyDvWtfY
	wxdQXZn9Web1FeOuzgWYGEmPyXwuR9f6T2BwQc4dFBBrjDcoPkjo6/3va7mxH8xuCy9vdUYE8+v0P
	IpzOAsYg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q8e0k-002NAo-Tq; Mon, 12 Jun 2023 09:38:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8EC34302F74;
	Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 14D9A30A70220; Mon, 12 Jun 2023 11:38:48 +0200 (CEST)
Message-ID: <20230612093537.833273038@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 12 Jun 2023 11:07:19 +0200
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
Subject: [PATCH v3 06/57] sched: Simplify sysctl_sched_uclamp_handler()
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
 kernel/sched/core.c |   11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -1801,7 +1801,8 @@ static int sysctl_sched_uclamp_handler(s
 	int old_min, old_max, old_min_rt;
 	int result;
 
-	mutex_lock(&uclamp_mutex);
+	guard(mutex)(&uclamp_mutex);
+
 	old_min = sysctl_sched_uclamp_util_min;
 	old_max = sysctl_sched_uclamp_util_max;
 	old_min_rt = sysctl_sched_uclamp_util_min_rt_default;
@@ -1810,7 +1811,7 @@ static int sysctl_sched_uclamp_handler(s
 	if (result)
 		goto undo;
 	if (!write)
-		goto done;
+		return result;
 
 	if (sysctl_sched_uclamp_util_min > sysctl_sched_uclamp_util_max ||
 	    sysctl_sched_uclamp_util_max > SCHED_CAPACITY_SCALE	||
@@ -1846,16 +1847,12 @@ static int sysctl_sched_uclamp_handler(s
 	 * Otherwise, keep it simple and do just a lazy update at each next
 	 * task enqueue time.
 	 */
-
-	goto done;
+	return result;
 
 undo:
 	sysctl_sched_uclamp_util_min = old_min;
 	sysctl_sched_uclamp_util_max = old_max;
 	sysctl_sched_uclamp_util_min_rt_default = old_min_rt;
-done:
-	mutex_unlock(&uclamp_mutex);
-
 	return result;
 }
 #endif


