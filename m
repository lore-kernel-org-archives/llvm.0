Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B541E1DFD;
	Fri,  7 Mar 2025 08:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741337535; cv=none; b=P7gwbdeE5tTb2Vc8mUysN0j21fK39etb1XGzJ/v36IWIyfZKfSx/QTXjZ58tiOKwNerzlwP/lepsvMg5dz0vTWz0/OKh3sZsAOJIxe9+s/6Q4worLPp/gwu7A31lb89oA/gwKzpm0R11V5RyUZ+xDVSe2/p+vNqMwQ/P9g/Fl0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741337535; c=relaxed/simple;
	bh=/hu7q7b3xzF3CxVtiEno+oo3b5gRpHK9bF375yEHPPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lc5Kv1EttCWXpbe3Qz5myvxjw+IvJfg38r0EOVnPO606/AndKzxeb8wsqeSgv5Pem/Ovq2La4m23D/rbluP/yMawqMUe+DWHEmcSjvO9SketOTyk/cmJGFmj0CnDf4C9DF0WXGWxSdl96KarKyOB8nUqVJyinV5D7mdSU27PDTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=c0/cv4k+; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="c0/cv4k+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZztQYtoQyFQBxjcLn07eINw1je2fKj5ZbN3QGRa2N7A=; b=c0/cv4k+wJPheLkhp9QNciGa2U
	NZvJ0ACC8KtB5bEpMwT3Ywb9zrG534esigwjJF9/NghVojKHNj/oCjotB5J2aCKgxcVSrGAIRjeLz
	sgOD30axRuIXLl6fnlen1sj5QUX4WLwy/9bD3HHS4dUBa2G/TdryHtwOxEHyjPf/jOtM0yf4l/r6F
	XEM7muA9z2pYJ2AcQV9WrVXEEso9J6KRZFPLuzHoDgc1pqGbRdPEJJTdwR0vYwkg3NjHHou4lRgWJ
	Ac/T22AB9m45dpPie5Xyz0PKqY5mdeeI2+tybbhQmVUlhIqR+Wseqj7K7LxvsqQSEZ+jw/1by8GJo
	CDkf139Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTR6-0000000C7ul-3oeF;
	Fri, 07 Mar 2025 08:52:04 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4AEF1300269; Fri,  7 Mar 2025 09:52:04 +0100 (CET)
Date: Fri, 7 Mar 2025 09:52:04 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Puchert, Aaron" <aaron.puchert@sap.com>
Cc: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Bart Van Assche <bvanassche@acm.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <20250307085204.GJ16878@noisy.programming.kicks-ass.net>
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
 <20250306103752.GE16878@noisy.programming.kicks-ass.net>
 <DB7PR02MB3626056525E95B643D87CBC4E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR02MB3626056525E95B643D87CBC4E7CA2@DB7PR02MB3626.eurprd02.prod.outlook.com>

On Thu, Mar 06, 2025 at 11:14:21PM +0000, Puchert, Aaron wrote:

> So it boils down to
> 
> if (expr)
> 	acquire(mutex);
> do_something();
> if (expr)
> 	release(mutex);
> 
> If the "do_something()" block is rather short, as in the second example, it might also be an alternative to write:
> 
>          if (parent) {
>                  device_lock(parent);
>                  device_release_driver(dev);
>                  device_unlock(parent);
>          } else {
>                  device_release_driver(dev);
>          }
> 
> In any event, since the lock is only conditionally held, the block
> cannot require the mutex. So we can't be trying to satisfy
> "guarded_by" or "requires" attributes. We're just trying to avoid
> warnings about conditionally held capabilities. So at this point you
> might also be using "no_thread_safety_analysis". That's what we have
> typically done when we had this pattern.
> 
> > And I think we can expect a fair amount of resistance from maintainers
> > if we're going to go around rewriting their -- perfectly fine code,
> > thank you very much -- to please a static analyzer :/
> 
> I think there are some good arguments outside of the static analyzer.
> The pattern repeats the "if (expr)", and especially if "expr" is a bit
> more complex, this can be a source of errors:
> 
>                  if (!prog->sleepable)
>                          rcu_read_lock();
>  
>                  // ...
>  
>                  if (prog->sleepable)
>                          rcu_read_unlock();
> 
> This might slip through in a review, and could easily happen by
> copy-and-paste. (Of course you'll notice when testing this.) If you
> build some kind of conditional scope, it might look like this:
> 
>         scoped_conditional_guard (<rcu lock>, !prog->sleepable) {
>                 // ...
>         }
> 
> Another aspect is that even if the condition is symbolically the same,
> its value might change between locking and unlocking. If you write the
> condition once and evaluate it once, you can exclude both sources of
> errors.

Yeah, so IIRC I once proposed a guard that takes a NULL pointer to mean
not take the lock, but people had a bit of a fit.

It would've allowed writing the thing like:

	{
		guard(device)(parent);
		device_release_driver(dev);
	}

Anyway, yes I mostly agree, but this isn't necessarily code I have much
to say over. And while I can argue with the relevant maintainers, at
some point its their call if they are willing to accept a code change.

> > One of the more common patterns that I've talked about with Marco is
> > where modification requires two locks, while access requires either
> > lock.
> > 
> > The current __guarded_by() annotation cannot express this.
> > 
> > One possible way would be to construct a fake / 0-size capability
> > structure and have each of these locks acquire it in 'shared' mode (but
> > then you run into the recursion thing) and have a special annotation
> > that upgrades it to exclusive.
> > 
> > [...]
> > 
> > I would much rather write something like:
> > 
> > struct task_struct {
> >         raw_spinlock_t pi_lock;
> > 
> >         cpumask_t       cpus_allowed __guarded_by(pi_lock, rq->__lock);
> > }
> 
> There were ideas to support arbitrary Boolean expressions, but they
> wouldn't have allowed different expressions for read and write. So
> this would have been both too broad and not broad enough for your use
> case.

Right, that would work if you then also introduce __guarded_shared_by()
to express the requirements for access, it then becomes:

	cpumask_t	cpus_allowed __guarded_by(pi_lock && rq->__lock)
				     __guarded_shared_by(pi_lock || rq->__lock);

Which is a little more verbose over all, but entirely more flexible.

+- naming, I'm occasionally rubbish at naming :-)

> Your idea on the other hand sounds pretty reasonable to me. We already
> support multiple arguments in many other attributes, so it seems like
> a consistent extension. And semantically it makes sense to me as well:
> if a writer is required to hold all capabilities, then a reader should
> be fine if they hold any one. I'll have to think a bit more about
> whether this is always the right thing to do, but if it is, we have an
> easy way out.

If not all required locks are exclusive it comes apart.

Say, it needs a shared capability to satisfy existence (refcount, rcu,
whatever) and an object internal lock to serialize state.

But for exclusive locks, yes, holding all for modification implies
stability while holding any (except the empty) subset.

> > And now I realize this case is doubly annoying because (rq) isn't
> > something that is in lexical scope at this point :-( These are the
> > locking rules though, and it is vexing not being able to express things
> > like this.
> 
> If it's not in scope, how do we know we have the right thing? Is
> task_struct always contained in some larger object that also has "rq",
> and never outside of that?

See that __task_rq_lock() example I used for the return value. A task is
always on _a_ runqueue, but unless we hold that rq's lock, the relation
is not stable.

> The language doesn't really prevent you from having a lonely
> task_struct, and then it wouldn't be clear what we're referring to.

Yeah, this isn't something that can be expressed.

> A way out might be to consider the task_struct field in the larger
> object as guarded_by, and find a way to exclude the contained mutex.

> We could also introduce some kind of guarded_by_member(lock, member)
> to be added in the larger object. This would say that "lock" guards
> only the "member" subfield of the field. However, both would only
> apply if we're accessing the member through the parent. If you hand
> the task_struct by itself to some function and let that access
> cpus_allowed, we don't know what you're talking about.
> 
> But maybe you can explain a bit how the objects are coupled before I
> speculate too much into this.

:-)

Right, so we have a per-cpu struct rq, and a task has a member
indicating which cpu it currently belongs to.

struct rq {
	raw_spinlock_t __lock;
};

DEFINE_PER_CPU(struct rq, runqueues);

#define cpu_rq(cpu)	(&per_cpu(runqueues, (cpu)))

/*
 * And I suppose we can imagine runqueues to simply be an array
 * and per_cpu() to index into said array. Although the reality is that
 * it is much more like thread-local-storage in userspace.
 */

struct task_struct {
	raw_spinlock_t pi_lock;
	int cpu;
}

int task_cpu(struct task_struct *p)
{
	return p->cpu;
}

#define task_rq(p) cpu_rq(task_cpu(p))

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

		while (unlikelt(task_on_rq_migrating(p)))
			cpu_relax();
	}
}

And then we have a pile of variables, like the allowed CPU mask, that
are only to be modified while holding both pi_lock and the correct
rq->lock.

And yes, this is all somewhat of a pain :-)

Now, luck will have it that I am in fact one of the scheduler
maintainers, so I can muck about with this a bit -- within reason.

One thing we could do is add a struct rq pointer -- duplicating the cpu
member state, like:

struct task_struct {
	raw_spinlock_t pikk
	int cpu;
	struct rq *rq;
};

Possibly just for verification builds, but migrations are expensive
enough that I don't think tracking this one extra variable is going to
be noticed much.

This would give us means of writing what we want:

	cpumask	cpus_allowed __guarded_by(pi_lock, rq->__lock);

