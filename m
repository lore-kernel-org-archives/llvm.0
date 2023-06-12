Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A522881F
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 20:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pxkiBpX/jKL5fDu+bPABhlXr0//9Lho2ZyF5gMf+wnU=; b=YE5cJbLdVZV9PIHrx4tBv08lZx
	QSYHEJWO1MpAuhw42QCCjHt/VjPVWsDm9s+u55fqbBeABzUnQBVsSlh2L+ituWNyN3T46KWVD9vks
	bbI8vIOnRcUIpyT/SDszF/Mi6utLS00YvmEtBFHbi+Lo2tFu+6BrCewpdECrJeO6RJwJiBZkWLNZl
	OvgWWjDTIsQqesRzGliidqy3dPAYen6WPMvkkSyTqGz+/O3tItjrXDxIUUXuSbtg7lF6hfVS+TZQR
	fdR4gQ2kcnekYTWSfwfK8uM/4Y+aX96zevoGSsdTz+GXLJ0gUd+CIgGmkrp59j/83fmqMK2G5dQBw
	8Otb00PQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q8nkK-008zpU-0Q;
	Mon, 12 Jun 2023 20:02:36 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 74E923002A9;
	Mon, 12 Jun 2023 22:02:30 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id ED3042460EAE4; Mon, 12 Jun 2023 22:02:29 +0200 (CEST)
Date: Mon, 12 Jun 2023 22:02:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: torvalds@linux-foundation.org, keescook@chromium.org,
	gregkh@linuxfoundation.org, pbonzini@redhat.com,
	masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
	nicolas@fjasle.eu, catalin.marinas@arm.com, will@kernel.org,
	vkoul@kernel.org, trix@redhat.com, ojeda@kernel.org,
	mingo@redhat.com, longman@redhat.com, dennis@kernel.org,
	tj@kernel.org, cl@linux.com, acme@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	paulmck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com,
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
Subject: Re: [PATCH v3 08/57] sched: Simplify wake_up_if_idle()
Message-ID: <20230612200229.GN4253@hirez.programming.kicks-ass.net>
References: <20230612090713.652690195@infradead.org>
 <20230612093537.977924652@infradead.org>
 <ZIddtMiTj8Kktq1z@boqun-archlinux>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIddtMiTj8Kktq1z@boqun-archlinux>

On Mon, Jun 12, 2023 at 11:02:28AM -0700, Boqun Feng wrote:
> On Mon, Jun 12, 2023 at 11:07:21AM +0200, Peter Zijlstra wrote:
> > Use guards to reduce gotos and simplify control flow.
> > 
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >  kernel/sched/core.c  |   20 ++++++--------------
> >  kernel/sched/sched.h |   15 +++++++++++++++
> >  2 files changed, 21 insertions(+), 14 deletions(-)
> > 
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -3872,21 +3872,13 @@ static void __ttwu_queue_wakelist(struct
> >  void wake_up_if_idle(int cpu)
> >  {
> >  	struct rq *rq = cpu_rq(cpu);
> > -	struct rq_flags rf;
> >  
> > -	rcu_read_lock();
> > -
> > -	if (!is_idle_task(rcu_dereference(rq->curr)))
> > -		goto out;
> > -
> > -	rq_lock_irqsave(rq, &rf);
> > -	if (is_idle_task(rq->curr))
> > -		resched_curr(rq);
> > -	/* Else CPU is not idle, do nothing here: */
> > -	rq_unlock_irqrestore(rq, &rf);
> > -
> > -out:
> > -	rcu_read_unlock();
> > +	guard(rcu)();
> > +	if (is_idle_task(rcu_dereference(rq->curr))) {
> > +		guard(rq_lock)(rq);
> 
> We assume that irq must be disabled when this function called?
> Otherwise, I don't understand why this is not
> 
> 	guard(rq_lock_irqsave)(rq);
> 

You're quite right, I messed that up.

