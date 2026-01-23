Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FA52777E0;
	Fri, 23 Jan 2026 08:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769158562; cv=none; b=D3XKEwtRr7xTomP58LNFvik0W9imjLiocJbxRlp1PM3/lktNNgYbcP1BPWlq2wVPALM+hDlCLa+1I/duNGWjmUobbUvx4Pszneq6Mvlkfvptv04NG0jdq+AKgwt5HxSLfyB0Ndu092Ish0OP+La9zj0397zr5x0LXqZ9TsJfgVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769158562; c=relaxed/simple;
	bh=wFpsuxtuy6ajzGj33f3P0L8UMB8Lq8IO66NCGp0uN8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qaygdnbPbCDn2dcBBus1nq3kvwrsbfLLUO6JQlnohZo3XjMi8mVUDdHZ+50oNoPOGFfh2cvA/eI8QhMC/5C/3U1me5qwUE8F/nQXmLp8niGTuuHbNcArzJugzY9naGzT0CZ+/C9IXvMbtpjos+Obg/o3dPnBrrkqPQnKYZWgPjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Aj2eYDn2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Aj2eYDn2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=upb/Rffb/gFtNpDr6t8IyD47ZyaiKZruR4jCghyBReY=; b=Aj2eYDn2u8T1YjGyAPXliPUuVp
	qOHMuop/3f4M+0IhMlgRODP5XYti1qArQdk1MKh/YVsk3wSfWug5R8w23LlOwxgJYfeS0COD+/OTj
	4qpBAnEdWbROL+FMy1X6CDQoscKK1oWRq02TUAd1qJvHsSbdt6gc6mdoqIPezFcKhyIsOsBznndqO
	j6CJp9m2gJmLYyaBEpV5BdQqYsJucsRAwf/MF8dD3FSxRsdmpZioqyXG576ZumKpJdG0T7D3B4Bs+
	0S9dNYJ6db/6yPP36mD0ICacJ6kgUUwxKzscZl5+3f9TMKcRHgEQo6L3r9KXDGKXIlHXiRZtI9+aH
	bM23LQfw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjCxQ-00000001XCM-45DW;
	Fri, 23 Jan 2026 08:55:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B5E0D3007E1; Fri, 23 Jan 2026 09:55:55 +0100 (CET)
Date: Fri, 23 Jan 2026 09:55:55 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>
Subject: Re: [peterz-queue:locking/core 10/10] kernel/futex/core.c:982:1:
 warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the
 end of function
Message-ID: <20260123085555.GG171111@noisy.programming.kicks-ass.net>
References: <202601221040.TeM0ihff-lkp@intel.com>
 <20260122091600.GE171111@noisy.programming.kicks-ass.net>
 <aXJs7Hi90iOIoeMM@elver.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXJs7Hi90iOIoeMM@elver.google.com>

On Thu, Jan 22, 2026 at 07:31:08PM +0100, Marco Elver wrote:
> +Cc Will
> 
> On Thu, Jan 22, 2026 at 10:16AM +0100, Peter Zijlstra wrote:
> > On Thu, Jan 22, 2026 at 10:30:28AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
> > > head:   33d9e7fdf9c17417347d1f06ddebaf25f21ab62a
> > > commit: 33d9e7fdf9c17417347d1f06ddebaf25f21ab62a [10/10] futex: Convert to compiler context analysis
> > > config: arm64-randconfig-001-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221040.TeM0ihff-lkp@intel.com/config)
> > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221040.TeM0ihff-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > > >> kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> > >      982 | }
> > >          | ^
> > >    kernel/futex/core.c:976:2: note: spinlock acquired here
> > >      976 |         spin_lock(lock_ptr);
> > >          |         ^
> > > >> kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> > >      982 | }
> > >          | ^
> > >    kernel/futex/core.c:966:6: note: spinlock acquired here
> > >      966 | void futex_q_lockptr_lock(struct futex_q *q)
> > >          |      ^
> > >    2 warnings generated.
> > 
> > Urgh, this is the arm64 READ_ONCE() confusing the thing. It can't see
> > through that mess and realize: lockptr == q->lock_ptr.
> > 
> > Marco, any suggestion how to best fix that?
> 
> I have a tentative solution:
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 78beceec10cd..75265012ff2d 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -31,9 +31,8 @@
>   */
>  #define __READ_ONCE(x)							\
>  ({									\
> -	typeof(&(x)) __x = &(x);					\
> -	int atomic = 1;							\
> -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> +	typeof(&(x)) __x = &(x), *__xp = &__x;				\
> +	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> @@ -56,9 +55,10 @@
>  			: "Q" (*__x) : "memory");			\
>  		break;							\
>  	default:							\
> -		atomic = 0;						\
> +		__u.__val = (*(volatile typeof(__x))__x);		\
>  	}								\
> -	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
> +	*__xp = &__u.__val;						\
> +	*__x;								\
>  })
>  
>  #endif	/* !BUILD_VDSO */
> 
> This works because the compiler doesn't analyze alias reassignment
> through pointer-to-alias within the same function. An alternative is to
> do the alias reassignment via an __always_inline function that takes the
> alias as a const pointer, and then cast the const away and do the
> assignment. But I think the above is cleaner. Only compile-tested.

Oh clever! I suppose it does help if you know how the compiler works :-)

I was thinking that perhaps it makes sense to invest in a 'directive'
where we can explicitly hand alias information to the compiler.

Consider:

  https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/tree/kernel/locking/rtmutex.c?h=locking/core&id=a31a1351e9ec9df7a72ea4877a8e53a9c02e8641#n1259

		rtm = container_of(lock, struct rt_mutex, rtmutex);
		__assume_ctx_lock(&rtm->rtmutex.wait_lock);
		res = __ww_mutex_add_waiter(waiter, rtm, ww_ctx, wake_q);

Here there is a similar issue, where container_of() wrecks things. It
cannot tell that rtm->rtmutex == lock and hence its idea of
lock->wait_lock gets 'confused'.

I hack around it with that __assume_ctx_lock() and I suppose that works,
but perhaps it makes sense to be able to tell the compiler that yes,
these things are the actual same thing. Perhaps it will even improve
code-gen, like in your example.
