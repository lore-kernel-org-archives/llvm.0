Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B8DDF6C;
	Tue,  3 Feb 2026 11:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770119228; cv=none; b=s90FdDAqtzlbZoQSugFGa6HR6gkf7DBCXMb4j10YWKejlFs/GUwtyzOVOWvFEq6eQGVtY3Jjeip6UhFjTLwpmQWM8+iaIHIvUf3EW43RHVNaJHpCZIcIS9XHrUliHO3vADWXEoS7P5SIaJK4w9xlEcPYlZzJXOPtjsTF5U9US5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770119228; c=relaxed/simple;
	bh=ekFdSEhH50PU5wS7nUQFWI9pnatXudGXJZ1S7B3/w0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWORlorXFpvEK5D9RVN3oW4hqodr7apwWOYEi//ida4LDipB7FQ/UvrazjvaJV8Z0X+6F6+DeTc3CvzoNpq7Yf+krzZYllQ3Fm5IMqNrtbbx/sAKhWEF8SRsgnRUYKPsMavr9tntI0CsmASX4NHV5Gl3NbC/+rBRsugGmbn2gAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlcEnHTz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlcEnHTz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4823C2BCAF;
	Tue,  3 Feb 2026 11:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770119228;
	bh=ekFdSEhH50PU5wS7nUQFWI9pnatXudGXJZ1S7B3/w0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlcEnHTzUfAtUvimkcZEXChZN4VWQ57oWH1OVySQzk35pmR0hEk+psTq2Z4MRsXfX
	 prgWTBqYh2pe+/pmT8j8zIEdWk0AiM1+Kv6UYiM3mrGFtDDjRXIONbH9yreNp9EMOm
	 A+T51hZXIBs5nFLdIeHBzRGMnodPiC3udI/PsXw2LIJjnIV6BIgZQAoini76m6qkIZ
	 5f8Xq0HGKrSAX1xaYpvUpUF3/9E7Jk+eZTXTD/QcaxJzxSxsa1tdqtElaHXWgdDYMO
	 wnQ8MRjFHB5aIar5Ov3apPqP9zFphmqHk6LFXA6fW4wWGGScwiteefdX4T91skEUwj
	 BT7zBR5Prd/DQ==
Date: Tue, 3 Feb 2026 11:47:01 +0000
From: Will Deacon <will@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Boqun Feng <boqun@kernel.org>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aYHgNSF5a3F7UGU_@willie-the-truck>
References: <20260130132951.2714396-1-elver@google.com>
 <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck>
 <20260202192923.0707e463@pumpkin>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202192923.0707e463@pumpkin>

On Mon, Feb 02, 2026 at 07:29:23PM +0000, David Laight wrote:
> On Mon, 2 Feb 2026 15:39:36 +0000
> Will Deacon <will@kernel.org> wrote:
> 
> > On Fri, Jan 30, 2026 at 02:28:26PM +0100, Marco Elver wrote:
> > > When enabling Clang's Context Analysis (aka. Thread Safety Analysis) on
> > > kernel/futex/core.o (see Peter's changes at [1]), in arm64 LTO builds we
> > > could see:
> > > 
> > > | kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> > > |      982 | }
> > > |          | ^
> > > |    kernel/futex/core.c:976:2: note: spinlock acquired here
> > > |      976 |         spin_lock(lock_ptr);
> > > |          |         ^
> > > | kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> > > |      982 | }
> > > |          | ^
> > > |    kernel/futex/core.c:966:6: note: spinlock acquired here
> > > |      966 | void futex_q_lockptr_lock(struct futex_q *q)
> > > |          |      ^
> > > |    2 warnings generated.
> > > 
> > > Where we have:
> > > 
> > > 	extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
> > > 	..
> > > 	void futex_q_lockptr_lock(struct futex_q *q)
> > > 	{
> > > 		spinlock_t *lock_ptr;
> > > 
> > > 		/*
> > > 		 * See futex_unqueue() why lock_ptr can change.
> > > 		 */
> > > 		guard(rcu)();
> > > 	retry:  
> > > >>		lock_ptr = READ_ONCE(q->lock_ptr);  
> > > 		spin_lock(lock_ptr);
> > > 	...
> > > 	}
> > > 
> > > At the time of the above report (prior to removal of the 'atomic' flag),
> > > Clang Thread Safety Analysis's alias analysis resolved 'lock_ptr' to
> > > 'atomic ?  __u.__val : q->lock_ptr' (now just '__u.__val'), and used
> > > this as the identity of the context lock given it cannot "see through"
> > > the inline assembly; however, we want 'q->lock_ptr' as the canonical
> > > context lock.
> > > 
> > > While for code generation the compiler simplified to '__u.__val' for
> > > pointers (8 byte case -> 'atomic' was set), TSA's analysis (a) happens
> > > much earlier on the AST, and (b) would be the wrong deduction.
> > > 
> > > Now that we've gotten rid of the 'atomic' ternary comparison, we can
> > > return '__u.__val' through a pointer that we initialize with '&x', but
> > > then update via a pointer-to-pointer. When READ_ONCE()'ing a context
> > > lock pointer, TSA's alias analysis does not invalidate the initial alias
> > > when updated through the pointer-to-pointer, and we make it effectively
> > > "see through" the __READ_ONCE().
> > > 
> > > Code generation is unchanged.
> > > 
> > > Link: https://lkml.kernel.org/r/20260121110704.221498346@infradead.org [1]
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
> > > Cc: Peter Zijlstra <peterz@infradead.org>
> > > Tested-by: Boqun Feng <boqun@kernel.org>
> > > Signed-off-by: Marco Elver <elver@google.com>
> > > ---
> > > v3:
> > > * Use 'typeof(*__ret)'.
> > > * Commit message.
> > > 
> > > v2:
> > > * Rebase.
> > > ---
> > >  arch/arm64/include/asm/rwonce.h | 10 +++++++---
> > >  1 file changed, 7 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > > index 42c9e8429274..b7de74d4bf07 100644
> > > --- a/arch/arm64/include/asm/rwonce.h
> > > +++ b/arch/arm64/include/asm/rwonce.h
> > > @@ -45,8 +45,12 @@
> > >   */
> > >  #define __READ_ONCE(x)							\
> > >  ({									\
> > > -	typeof(&(x)) __x = &(x);					\
> > > -	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
> > > +	auto __x = &(x);						\
> > > +	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
> > > +	/* Hides alias reassignment from Clang's -Wthread-safety. */	\
> > > +	auto __retp = &__ret;						\
> > > +	union { typeof(*__ret) __val; char __c[1]; } __u;		\
> > > +	*__retp = &__u.__val;						\
> > >  	switch (sizeof(x)) {						\
> > >  	case 1:								\
> > >  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> > > @@ -71,7 +75,7 @@
> > >  	default:							\
> > >  		__u.__val = *(volatile typeof(*__x) *)__x;		\
> > >  	}								\
> > > -	__u.__val;							\
> > > +	*__ret;								\
> > >  })  
> > 
> > What does GCC do with this? :/
> 
> GCC currently doesn't see it, LTO is clang only.

LTO is just one way that a compiler could end up breaking dependency
chains, so I really want to maintain the option to enable this path for
GCC in case we run into problems caused by other optimisations in future.

Will
