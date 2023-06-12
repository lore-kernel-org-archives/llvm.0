Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F4119BA6
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 14:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0DnAgGwTA4yK+fgbpuGtXRFHoSZ33hlP/4ZXBRVYp+o=; b=E8ljFpn9WgTPZ/ghUHFMuqyFju
	18HzrWeqfun7OJcAh9UGudekKNjDoGcljRZKBpo0giB5F3stC6nIUGSCxUkXXwyWbupj7TMNNuKil
	C0qZaWmsOGRDfcykSbtXyDsqwC53N/ffa90WzdfiGbg2Nf9pQCUWBGvK3g5jRwQH2YMDU8gyWl9pL
	ged32jUjfI4udvDbsKDUyg//e/7+o+wfbYlxZvJs2kevDwGt6B+NSKX3E7HM+/0Qg5oPE8qUAXM2V
	UaedKnuMQ1UooxP67PAFhoTXHLFIQzhWzWL98n3HOLUYZnu4gcQCoT2BpnYrDpylDyx4RZbFXxW4d
	S3FiX6nA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8iE0-008t8o-2m;
	Mon, 12 Jun 2023 14:08:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 186E9300188;
	Mon, 12 Jun 2023 16:08:44 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id F09712BFD8191; Mon, 12 Jun 2023 16:08:43 +0200 (CEST)
Date: Mon, 12 Jun 2023 16:08:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: torvalds@linux-foundation.org, keescook@chromium.org,
	gregkh@linuxfoundation.org, pbonzini@redhat.com,
	masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	nicolas@fjasle.eu, catalin.marinas@arm.com, will@kernel.org,
	vkoul@kernel.org, trix@redhat.com, ojeda@kernel.org,
	mingo@redhat.com, longman@redhat.com, boqun.feng@gmail.com,
	dennis@kernel.org, tj@kernel.org, cl@linux.com, acme@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, namhyung@kernel.org, irogers@google.com,
	adrian.hunter@intel.com, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, paulmck@kernel.org,
	frederic@kernel.org, quic_neeraju@quicinc.com,
	joel@joelfernandes.org, josh@joshtriplett.org,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev,
	42.hyeyoo@gmail.com, apw@canonical.com, joe@perches.com,
	dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
	serge@hallyn.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	rcu@vger.kernel.org, linux-security-module@vger.kernel.org,
	tglx@linutronix.de, ravi.bangoria@amd.com, error27@gmail.com,
	luc.vanoostenryck@gmail.com
Subject: Re: [PATCH v3 09/57] sched: Simplify ttwu()
Message-ID: <20230612140843.GZ83892@hirez.programming.kicks-ass.net>
References: <20230612090713.652690195@infradead.org>
 <20230612093538.076428270@infradead.org>
 <0012d943-6fd0-4b8d-9ec6-3d02aba75dcc@kadam.mountain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0012d943-6fd0-4b8d-9ec6-3d02aba75dcc@kadam.mountain>

On Mon, Jun 12, 2023 at 04:51:17PM +0300, Dan Carpenter wrote:
> On Mon, Jun 12, 2023 at 11:07:22AM +0200, Peter Zijlstra wrote:
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -3664,16 +3664,15 @@ ttwu_stat(struct task_struct *p, int cpu
> >  		__schedstat_inc(p->stats.nr_wakeups_local);
> >  	} else {
> >  		struct sched_domain *sd;
> > +		guard(rcu)();
> >  
> >  		__schedstat_inc(p->stats.nr_wakeups_remote);
> > -		rcu_read_lock();
> 
> We can't put the guard(rcu)(); here?  I have unpublished static analysis
> which assumes that the first and last statements guarded by a lock are
> important.  But if we always put it at the top of the scope then we
> lose that information.

we can definitely put it there. that one schedstat doesn't matter either
way around.

> >  		for_each_domain(rq->cpu, sd) {
> >  			if (cpumask_test_cpu(cpu, sched_domain_span(sd))) {
> >  				__schedstat_inc(sd->ttwu_wake_remote);
> >  				break;
> >  			}
> >  		}
> > -		rcu_read_unlock();
> >  	}
