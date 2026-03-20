Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3377732C923;
	Fri, 20 Mar 2026 22:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774044659; cv=none; b=Ni/KN7EbxfwWcq+YzXco8481KWjbfXRvhzIxoNbGbRCXJZMBoGK4ZzP5hCw1N+0kPLORrCofAUHe97RV8cixy2VIZkWGq2zUqT4V1nIvx4dQraBd9tKJb8JoDEElaPBoNurWyM8i4Y4jBz1A4F14oyt64X4Y+mHoBe6AOYDxA1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774044659; c=relaxed/simple;
	bh=J+8zKVAP9JlQtzGNnlqNZHx/03ppdb6SVg986gQB8H8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnTz//wIltDlQQvfRJy3LnmAEy0mV6w1We6Faqqf9GO7/i8Tr+6AhcY4OG/0dXCcZ22jKF6CKdjpd5mLmS8mbhl4/qFKvD3dFHWk6QEIKONZAdU01oCi8yXsveRSo4WEV1r5x44eH+TEGVN748m78oe9U1qWj6AQVyX4kG/Sdbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MGcIsm66; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MGcIsm66"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ymBi0o5H4WjeXAhMvQJfYlPhxbSAi7Mfyz34a+CjDvk=; b=MGcIsm662ntnuk5epJHc9NV7pX
	CgNxYMQgrw/EkAOoLxOjZQjg5Y6uJo6Wpgb81XVmKNLEZvKtAlW1FcfODOMIZ/k65Vzth0jagIgYt
	DKMhorsLo0qTdszsLnXBUwYufSYWpSYY4RV5QNa7LyGsztBWlhuqPqxRaqgFIVD9ysS9NRzlW/6Rg
	LRwzTu9io3h47Eg3MxyLHyc/yPPR8F74qpEWLw87yMesClM6fIiRBUnW4biW1mKVMFiZ7pY4dn7J7
	iCucSLUlcyncGL3sUvnDWpKRx2/2aXdNxoZCOnCL8gLTATBmS0ah9Sbs41CQ3bmh1RtJdi5Jvm+h7
	RMB2JnYw==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3i3Q-00000008RaC-1bMg;
	Fri, 20 Mar 2026 22:10:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 29A58301185; Fri, 20 Mar 2026 23:10:51 +0100 (CET)
Date: Fri, 20 Mar 2026 23:10:51 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Jann Horn <jannh@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, llvm@lists.linux.dev,
	Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH v2 1/4] sched: Ensure matching stack state for kcov
 disable/enable on switch
Message-ID: <20260320221051.GX3738010@noisy.programming.kicks-ass.net>
References: <20260318-kcov-extrecord-v2-0-2522da6fcd3f@google.com>
 <20260318-kcov-extrecord-v2-1-2522da6fcd3f@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-kcov-extrecord-v2-1-2522da6fcd3f@google.com>

On Wed, Mar 18, 2026 at 05:26:58PM +0100, Jann Horn wrote:
> Ensure that kcov is disabled and enabled with the same call stack.
> This will be relied on by subsequent patches for recording function
> entry/exit records via kcov.
> 
> This patch should not affect compilation of normal kernels without KCOV
> (though it changes "inline" to "__always_inline").
> 
> To: Ingo Molnar <mingo@redhat.com>
> To: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  kernel/sched/core.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index b7f77c165a6e..c470f0a669ec 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5072,8 +5072,10 @@ static inline void kmap_local_sched_in(void)
>   *
>   * prepare_task_switch sets up locking and calls architecture specific
>   * hooks.
> + *
> + * Must be inlined for kcov_prepare_switch().
>   */
> -static inline void
> +static __always_inline void
>  prepare_task_switch(struct rq *rq, struct task_struct *prev,
>  		    struct task_struct *next)
>  	__must_hold(__rq_lockp(rq))
> @@ -5149,7 +5151,6 @@ static struct rq *finish_task_switch(struct task_struct *prev)
>  	tick_nohz_task_switch();
>  	finish_lock_switch(rq);
>  	finish_arch_post_lock_switch();
> -	kcov_finish_switch(current);
>  	/*
>  	 * kmap_local_sched_out() is invoked with rq::lock held and
>  	 * interrupts disabled. There is no requirement for that, but the
> @@ -5295,7 +5296,13 @@ context_switch(struct rq *rq, struct task_struct *prev,
>  	switch_to(prev, next, prev);
>  	barrier();
>  
> -	return finish_task_switch(prev);
> +	rq = finish_task_switch(prev);
> +	/*
> +	 * This has to happen outside finish_task_switch() to ensure that
> +	 * entry/exit records are balanced.
> +	 */

That's not exactly right; the requirement is that kcov_prepare_switch()
and kcov_finish_switch() are called from the exact same frame.

The wording above "outside finish_task_switch" could be anywhere and
doesn't cover the relation to prepare_switch().

> +	kcov_finish_switch(current);
> +	return rq;
>  }

That said; there was a patch that marked finish_task_switch() as
__always_inline too:

  https://lkml.kernel.org/r/20260301083520.110969-4-qq570070308@gmail.com

Except I think that does a little too much for one patch.

Anyway, I'm a little divided on this. Perhaps the simplest and most
obvious way is something like so.

But what about compiler funnies like the various IPA optimizations that
can do partial clones and whatnot? That could result in violating this
constraint, no?

---
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 6e509e292f99..d9925220d51b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5135,7 +5135,6 @@ prepare_task_switch(struct rq *rq, struct task_struct *prev,
 		    struct task_struct *next)
 	__must_hold(__rq_lockp(rq))
 {
-	kcov_prepare_switch(prev);
 	sched_info_switch(rq, prev, next);
 	perf_event_task_sched_out(prev, next);
 	fire_sched_out_preempt_notifiers(prev, next);
@@ -5206,7 +5205,6 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	tick_nohz_task_switch();
 	finish_lock_switch(rq);
 	finish_arch_post_lock_switch();
-	kcov_finish_switch(current);
 	/*
 	 * kmap_local_sched_out() is invoked with rq::lock held and
 	 * interrupts disabled. There is no requirement for that, but the
@@ -5294,6 +5292,7 @@ context_switch(struct rq *rq, struct task_struct *prev,
 	       struct task_struct *next, struct rq_flags *rf)
 	__releases(__rq_lockp(rq))
 {
+	kcov_prepare_switch(prev);
 	prepare_task_switch(rq, prev, next);
 
 	/*
@@ -5352,7 +5351,13 @@ context_switch(struct rq *rq, struct task_struct *prev,
 	switch_to(prev, next, prev);
 	barrier();
 
-	return finish_task_switch(prev);
+	rq = finish_task_switch(prev);
+	/*
+	 * kcov_prepare_switch() above, and kcov_finish_switch() must be
+	 * called from the same stack frame.
+	 */
+	kcov_finish_switch(current);
+	return rq;
 }
 
 /*
