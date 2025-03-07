Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E4B21ADD3;
	Fri,  7 Mar 2025 14:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741356795; cv=none; b=C3eZJ1Trt5e7q6ip+qtV8B17ibDyNGaqKmuwKVF7N+hJOcQJR3bclscFdLtYonWGEzxRpsKTMqVwC+lV6+Mo4aGtS+8QOf4muPluWUyIjikHjAc7V2aE6QVIff1u+geD1zE2RthTvSmTZjIRdbnvHWqvdbgO8yqy6HNepsMewRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741356795; c=relaxed/simple;
	bh=0OfolKhnQ9CGbM1ZKOrJbufnAPUvYxn/8AH/mQnhjbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOVbpGR6o9o7wn6u+YohmS7b4cM4BVLOXNldAVYHvlqyCMcCrt4G1WoYpIIDZdWmO0qu0+A65+MhVB8HP4E7UrDawkkIX58TDwzmKWRqYxSw2ZGT1m0IuLhGVBHr1vWPg9M0sknm51u6jehP2sxmu2iOvDj2XHn9K8dxcsUOYlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=HakAKQKN; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="HakAKQKN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JJBOeBuNXZqNZlmT/Xatt0OEQuX2yWSve8v1RoTr0Rw=; b=HakAKQKNSqlCktBAlshZ8eiSx2
	BNura5PUG0bIaomzpw8Wn4JdY+EOVxkNF1gCqkBLZL6xRUuEEqDjTRN8ooQ375amlZGwYosLjzPAJ
	4jjn3ZhuEulF6A+aVq2zIpc4tHSOD6hqoeKEOHK1QgZI0itTlimgR69bZI3bVPIHe7I4TdhWmX6BV
	GWRx9t1Fx+5qu6c+L/WNgjaZ0H8+Q2I3SKtLaJRyYy2tVsmsBdQBldD1f09HE2A/1gBAwlAZxZ4wW
	Gk/q9yrDNsaaEydM65u94XVjmigW4Hxhe3iQliHVspjj5ZnCh1EFpNPpTR6DSyoxSAXBoQ8z7jI2x
	JL2qRJUw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tqYRq-00000001MI7-26Uc;
	Fri, 07 Mar 2025 14:13:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A238830031C; Fri,  7 Mar 2025 15:13:09 +0100 (CET)
Date: Fri, 7 Mar 2025 15:13:09 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Puchert, Aaron" <aaron.puchert@sap.com>
Cc: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Bart Van Assche <bvanassche@acm.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <20250307141309.GM16878@noisy.programming.kicks-ass.net>
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306100828.GD16878@noisy.programming.kicks-ass.net>
 <DB7PR02MB36269DCE8C78D8E5DB7C7AC6E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250307075950.GH16878@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307075950.GH16878@noisy.programming.kicks-ass.net>

On Fri, Mar 07, 2025 at 08:59:50AM +0100, Peter Zijlstra wrote:
> On Thu, Mar 06, 2025 at 10:18:32PM +0000, Puchert, Aaron wrote:
> 
> > > Users would typically look like:
> > > 
> > > try_to_wake_up(p, state)
> > > {
> > >         struct rq *rq;
> > > 
> > >         scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
> > >                 if (!ttwu_state_match(p, state))
> > >                         break;
> > > 
> > >                 rq = __task_rq_lock(p);
> > >                 // go enqueue task
> > >                 raw_spin_rq_unlock(rq);
> > >         }
> > > }
> > 
> > Can the return value be used as an initializer by moving the
> > declaration into the scoped_guard block? Or do you have a style guide
> > that wants all declarations at the beginning of a block?
> 
> Yeah, we have a style guide that strongly suggests variables are
> declared at the start. In fact, we used to have
> -Wdeclaration-after-statement and only (finally) got rid of it in order
> to allow for these scope guards.
> 
> > We track capabilities as symbolic expressions, so something like
> > "rq->__lock" in this case. If there is an assignment to "rq", that
> > changes the meaning of the symbolic expression. The object referred to
> > by the expression is then no longer reachable. Currently we don't look
> > at assignments at all when it comes to tracking capabilities. We don't
> > even warn, it's simply documented as not being supported. We only look
> > at initializers, as in alias analysis. Having a separate variable
> > being initialized with the return value gives us a unique name for the
> > return value, which is good when we're working with symbolic
> > expressions.
> > 
> > If there are cases where assignment is really needed, we can also
> > check to which extent we can rewrite expressions or warn when the
> > objects they point to become unreachable. (In the example that would
> > be the case if someone assigned to "rq" again after the call to
> > "__task_rq_lock ".)
> 
> Right. I suspect we might need this if we want to minimize code churn.

There is also a case where a guard wraps the pointer in a struct;
because we need to carry extra state, like IRQ flags and the like, or
because the lock doesn't have a native type (RCU).

In this case the constructor things will return this structure and we'll
get a local copy on stack, a pointer to which will then be handed to the
destructor thing.

It would be very nice if it could understand that pattern too.
