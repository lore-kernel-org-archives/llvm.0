Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43BEB667;
	Thu,  6 Mar 2025 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741255714; cv=none; b=Iztbkfz2bnwl4sH0tFaGicqZV5JE1nK+oJHx38i8mDMiucD6N1zssONqYykTfr+N+kD3RD93nryRy6ML/TiBiw2oGjUbr+VD/1NE2Z/4sCLJruUs5UzSzgo7Q0wnYmXNUHMpLIOZXAsRUv7f8L9s9Wp4sJikc/j3IOCijIDZCws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741255714; c=relaxed/simple;
	bh=IxCkkAjvG+R053X4H0uqNcfJERF8MJqKIwDQ1PiJznM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l0oDGZvN3svXsr4gkxjh/mz/2fG4zaOTemSSN+MYERzUykjZnmDsMtJEaCE+yWoovElbW0ojw8mPFHpJOS61YsQYYn2JIpRVf8sv37DFSSchwwaIn/dvRL+oYOL6Mv9wesJpGAsnZ6p3QQ9+S+bxV/AVHxN29cga8yZAoEvU/GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lEXbRA8g; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lEXbRA8g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TscUL2Nql+qiB27iCQtG1yDloUJogcmqg4VqOIdop4I=; b=lEXbRA8gk11tv6vmt5+okwastS
	nEx0sY13rBNl6e0cws2+ca/PxI1eESe4rNFPgUwFqcg86LECtXoOBc9eRt6WYCS5kkOGBgpX2XFFM
	UGC+x5ifF3w8COcudGyk73YTe9KmpXGHiMNhBkpLec+gpn+JlEvs5jZlMFxsaYTeSc7uV7dPggnKl
	0jEm6OTWC4heYlYGfbog4tNCO6RMFtZVFs4ifT0DSVF0uN8UFAcz0xob87NpvaBIsF4LWOBHdywrG
	jW4CZ3kwuXd7jQrSF+h/XKyn6vTpDq0XETWeW5AC5E+DlHvmRDuc3Ykd1oa0YOERLXeZzEYKD3l4+
	3JVt2VOw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tq89V-00000007DOT-1BQQ;
	Thu, 06 Mar 2025 10:08:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 818EE30049D; Thu,  6 Mar 2025 11:08:28 +0100 (CET)
Date: Thu, 6 Mar 2025 11:08:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Puchert, Aaron" <aaron.puchert@sap.com>
Cc: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Bart Van Assche <bvanassche@acm.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <20250306100828.GD16878@noisy.programming.kicks-ass.net>
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>

On Wed, Mar 05, 2025 at 11:54:14PM +0000, Puchert, Aaron wrote:

> > Peter Zijlstra's feedback:
> > https://lore.kernel.org/all/20250305112041.GA16878@noisy.programming.kicks-ass.net/
> > -- much of which led to the below requests. Peter also managed to
> > crash Clang, but that's probably unrelated to -Wthread-safety
> > directly: https://github.com/llvm/llvm-project/issues/129873
> 
> Technically a parser issue and not in the analysis itself. But to my
> knowledge expressions in attributes were originally introduced for the
> analysis, so in some sense it is related.

Right, so that construct came about trying to work around not being able
to reference the return value.

> > 3. Ability to refer to locks in returned reference/pointer. For example:
> >     struct foo *ret_lock_struct(void) ACQUIRE(return->somelock);
> >     struct foo *try_ret_lock_struct(void) TRY_ACQUIRE(1,
> > return->somelock); // locked if non-NULL
> > I expect this also requires basic alias analysis to work so that
> > assigning the returned pointer to a function-local variable and then
> > later use in an unlock function works as expected.
> 
> We had a discussion about this, maybe I can find it later. The idea
> was to introduce a builtin for the return value. A rough outline:
> * Introduce the builtin to the parser, say __builtin_return_value().
> This shouldn't be hard.
> * Add handling to Sema: we can only accept the builtin in attributes
> on functions. The return type is the return type of the function.
> * In the caller we might not need alias analysis: there are no
> variables that alias. We already produce S-expressions for some return
> values from functions, and then handle a DeclStmt with initializer. (I
> introduced that for some C++ patterns in
> https://reviews.llvm.org/D129755.)
> * In the function itself we need to substitute the return expression
> for the builtin before checking the exit set. (I assume this restricts
> the possible attributes to acquire-type attributes.)
> 
> We can also discuss this in more detail if you want to pick it up. It
> might be quite a bit of work, but it should fit nicely into the
> existing framework.

Yes, as far as I can follow, that should work nicely.

The thing I tried to work around yesterday, making clang ICE, was
something like this function:

struct rq *__task_rq_lock(struct task_struct *p)
	__must_hold(p->pi_lock)
	__acquires(_Return->__lock)
{
	struct rq *rq;

	lockdep_assert_held(&p->pi_lock);

	for (;;) {
		rq = task_rq(p);
		raw_spin_rq_lock(rq);
		if (likely(rq == task_rq(p) && !task_on_rq_migrating(p)))
			return rq;

		raw_spin_rq_unlock(rq);

		while (unlikely(task_on_rq_migrating(p)))
			cpu_relax();
	}
}

Except for not having that _Return / __builtin_return_value() thing, I
tried __acquires(task_rq(p)->__lock), and task_rq() expands into a pile
of gunk that made it go *boom*.

Users would typically look like:

try_to_wake_up(p, state)
{
	struct rq *rq;

	scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
		if (!ttwu_state_match(p, state))
			break;

		rq = __task_rq_lock(p);
		// go enqueue task
		raw_spin_rq_unlock(rq);
	}
}

Anyway, the whole 'find-and-lock' pattern is widely used.
