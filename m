Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A7F81727
	for <llvm@lists.linux.dev>; Fri, 25 Oct 2024 03:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729827244; cv=none; b=ZSnxn9qzoNKV4q924+akWSRztS+OiuokLQbsGI1gyel/3LeSoqZ3SPlybY3cwRYZkkgcR5SX+zHYVE0kgSpFUcZYh4HD31KMsLFxT1C99f85/1f7IIZSfQz5Bz6ijjdIqY6oM3cnBAOjBFh/ETq/lXSffTK7n+iYh/M77GdpCcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729827244; c=relaxed/simple;
	bh=osaZmL7c3w886roQtoHVPyCRI9X5Wu/zdoQpxSW6enw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9/ep9TPhUeDG6U0mvIMar61pyXtztGS2aZ9hJocTo5wCV8Xkecbdg7SQAeknqyn7fYvIGLhrImd754z9rgAp8f46RoMu5zf2gkhdlOQ946eEysDRwsSEIbg1pj8s1r+m4POXKULqbvvjh5DXmvHwyYJYLWWBonVo6zmjfdie0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 49P3N2ot016616;
	Thu, 24 Oct 2024 22:23:02 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 49P3Mr9D016605;
	Thu, 24 Oct 2024 22:22:53 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 24 Oct 2024 22:22:53 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linuxppc-dev@lists.ozlabs.org, Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Kent Overstreet <kent.overstreet@linux.dev>,
        Rick Edgecombe <rick.p.edgecombe@intel.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] sched/membarrier: Fix redundant load of membarrier_state
Message-ID: <20241025032253.GN29862@gate.crashing.org>
References: <20241007053936.833392-1-nysal@linux.ibm.com> <87frolja8d.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frolja8d.fsf@mail.lhotse>
User-Agent: Mutt/1.4.2.3i

Hi!

On Fri, Oct 25, 2024 at 11:29:38AM +1100, Michael Ellerman wrote:
> [To += Mathieu]
> 
> "Nysal Jan K.A." <nysal@linux.ibm.com> writes:
> > From: "Nysal Jan K.A" <nysal@linux.ibm.com>
> >
> > On architectures where ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
> > is not selected, sync_core_before_usermode() is a no-op.
> > In membarrier_mm_sync_core_before_usermode() the compiler does not
> > eliminate redundant branches and the load of mm->membarrier_state
> > for this case as the atomic_read() cannot be optimized away.
> 
> I was wondering if this was caused by powerpc's arch_atomic_read() which
> uses asm volatile.
> 
> But replacing arch_atomic_read() with READ_ONCE() makes no difference,
> presumably because the compiler still can't see that the READ_ONCE() is
> unnecessary (which is kind of by design).

Exactly.

> > GCC 12.2.1:
> > -----------
> > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-32 (-32)
> > Function                                     old     new   delta
> > finish_task_switch.isra                      852     820     -32
> 
> GCC 12 is a couple of years old, I assume GCC 14 behaves similarly?

GCC 12 is still being actively developed.  There will be a 12.5
probably halfway next year (and that will be the last 12.x release,
yes).  The GCC homepage (<https://gcc.gnu.org>) will tell you what
releases are still maintained/supported, and sometimes you can derive
our planned plans from there as well :-)

But yes, 14 is similar (I did not test, but I feel confident making that
assertion :-) )

> >  static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
> >  {
> > +	if (!IS_ENABLED(CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE))
> > +		return;
> >  	if (current->mm != mm)
> >  		return;
> >  	if (likely(!(atomic_read(&mm->membarrier_state) &
> 
> The other option would be to have a completely separate stub, eg:
> 
>   #ifdef CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
>   static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm)
>   {
>           if (current->mm != mm)
>                   return;
>           if (likely(!(atomic_read(&mm->membarrier_state) &
>                        MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE)))
>                   return;
>           sync_core_before_usermode();
>   }
>   #else
>   static inline void membarrier_mm_sync_core_before_usermode(struct mm_struct *mm) { }
>   #endif
> 
> Not sure what folks prefer.
> 
> In either case I think it's probably worth a short comment explaining
> why it's worth the trouble (ie. that the atomic_read() prevents the
> compiler from doing DCE).

Since you ask, I like the proposed change (the inline one) best.  But
yeah, comment please!

(And it is not about DCE -- just the definition of __READ_ONCE makes it
directly impossible to CSE any expressions with this, it (standards-
violatingly) casts the pointers to pointers to volatile, and you cannot
CSE any accesses to volatile objects!)

So what are the actual semantics the kernel wants from its READ_ONCE,
and from its atomics in general?  GCC has perfectly fine in-compiler
support for such things, there is no need for making a second rate
manual implementation of parts of this, when you can use a good
implementation of everything instead!


Segher
