Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F70201034;
	Thu,  6 Mar 2025 10:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741257478; cv=none; b=IGSeCr/QR6MsOzgAMT7eJZsbRb1KsV2I3pA3o6ErgyEcJorI1vEJT8/7zofhSMPI4/JKJlumO+nWi4+SdZ5Qg3KjrpSURwKm8xqzO8297ZZTjhtQTLZdOoHkFyqjrl/ww6DtJc+5hPP1flaFA+fZCZvpoPyXLagN3/rKjH0O74U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741257478; c=relaxed/simple;
	bh=7HIs4qjivpKE7vMlWjjHFOX3pC/n+eLe8Vipbfz9yv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9Taji2546ahgzDB8h7n/NxzwWVEYOMddAup3ZswsUd6JRlm0dYs9BNmIhATG2/aOCCGExpPtJPafSLrjwtg9m11YOfaW/8bPmU1Qq7K694jW9AjzfpmNxJVMKgpnzlzrrdKFccCdkNo+3cdYI6F22LsMbDLH+IWwzlAnMfLPH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dIPgR1Eq; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dIPgR1Eq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+rM8Fc/SdPdxcqF0tewAZd1YPOdv2scNXe9FInCG27o=; b=dIPgR1Eq8DxaRo+9sAu0Wcn2QR
	bA052HAplreTpOFECjegrdeVirhIu+pmmZR3pEt27XUvTIqh1qjrBDN/a6gG2n+RBuIJC6iK1fmhh
	7Bdua5/EaVxaePQZNUXW/rWH5pXR7j1oMKfOCbYm+uWyaGdmvCn5OohOZdpT3rrrOrZAS7IQEo6eu
	sHOF1NfpBm6LxHtO40+xvrOEbHcOByeCEMgy1soWrZO5Db4cbYzSBUm85+SyQmnDjpnUpz/fensdm
	gQO0srhDCx+ODlog83W/5uWKEgEqaERgsEs89t3QheKoIXXSOQ/f6Rl9S4A/xJBABUdVKc6jDbl/x
	YZ+k0Bvw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8bw-000000011Pp-3ODa;
	Thu, 06 Mar 2025 10:37:53 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3A04230049D; Thu,  6 Mar 2025 11:37:52 +0100 (CET)
Date: Thu, 6 Mar 2025 11:37:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Puchert, Aaron" <aaron.puchert@sap.com>
Cc: Marco Elver <elver@google.com>, Aaron Ballman <aaron@aaronballman.com>,
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	Bart Van Assche <bvanassche@acm.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
Message-ID: <20250306103752.GE16878@noisy.programming.kicks-ass.net>
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

> > 5. Better control-flow handling. Basic understanding of conditional
> > locking, which is explicitly ruled out in:
> > https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#conditional-locks
> > - however, if there's some way to even get basic support, would vastly
> > improve things for the kernel.
> 
> The paper goes into some detail why this is tricky with the current
> design. We don't want to explore execution paths, because that
> obviously results in a combinatorial explosion. The Clang static
> analyzer deals with that by limiting exploration, but that makes it
> fuzzy and of course slow. As a warning flag we're part of the compiler
> itself, and the recommended practice is -Werror=thread-safety, so both
> of these are highly problematic. We want the analysis to be
> predictable and fast.
> 
> It would be interesting to see some patterns. One "trick" that I have
> played with is to move the conditional locking into the capability
> itself: it is then unconditionally acquired or released, but the
> underlying mutex is only acquired or released based on some global
> state or member. Something like this:
> 
> struct __attribute__((capability("mutex"))) conditional_mutex
> {
> 	struct mutex mu;
> 	bool active;
> }
> 
> void acquire_conditional_mutex(struct conditional_mutex* cmu)
> 	__attribute__((acquire_capability(cmu)))
> {
> 	if (cmu->active)
> 		acquire_mutex(&cmu->mu);
> }
> 
> However, I realize that might be a difficult proposal for the kernel community.

Version of this that came up were:

static __always_inline u32
bpf_prog_run_array_uprobe(const struct bpf_prog_array *array,
                          const void *ctx, bpf_prog_run_fn run_prog)
{
        const struct bpf_prog_array_item *item;
        const struct bpf_prog *prog;
        struct bpf_run_ctx *old_run_ctx;
        struct bpf_trace_run_ctx run_ctx;
        u32 ret = 1;

        might_fault();
        RCU_LOCKDEP_WARN(!rcu_read_lock_trace_held(), "no rcu lock held");

        if (unlikely(!array))
                return ret;

        migrate_disable();

        run_ctx.is_uprobe = true;

        old_run_ctx = bpf_set_run_ctx(&run_ctx.run_ctx);
        item = &array->items[0];
        while ((prog = READ_ONCE(item->prog))) {
                if (!prog->sleepable)
                        rcu_read_lock();

                run_ctx.bpf_cookie = item->bpf_cookie;
                ret &= run_prog(prog, ctx);
                item++;

                if (!prog->sleepable)
                        rcu_read_unlock();
        }
        bpf_reset_run_ctx(old_run_ctx);
        migrate_enable();
        return ret;
}

and

static void ath9k_hif_usb_firmware_fail(struct hif_device_usb *hif_dev)
{
        struct device *dev = &hif_dev->udev->dev;
        struct device *parent = dev->parent;

        complete_all(&hif_dev->fw_done);

        if (parent)
                device_lock(parent);

        device_release_driver(dev);

        if (parent)
                device_unlock(parent);
}

And I think we can expect a fair amount of resistance from maintainers
if we're going to go around rewriting their -- perfectly fine code,
thank you very much -- to please a static analyzer :/

> > Some of these are more complex than others, and any hints how we might
> > go about this are appreciated. I'm happy to try and implement some of
> > them, but if you find that you already know exactly how you'd like an
> > implementation to look like, rough drafts that we can take over and
> > polish would be very very helpful, too!
> > 
> > In general, the Linux kernel has some of the most complex
> > synchronization patterns with numerous synchronization primitives.
> > Getting this to work for a good chunk of the more complex
> > synchronization code in the kernel will be quite the achievement if we
> > get there. :-)
> 
> Examples are always welcome!

One of the more common patterns that I've talked about with Marco is
where modification requires two locks, while access requires either
lock.

The current __guarded_by() annotation cannot express this.

One possible way would be to construct a fake / 0-size capability
structure and have each of these locks acquire it in 'shared' mode (but
then you run into the recursion thing) and have a special annotation
that upgrades it to exclusive.

struct phoney __attribute__((capability(phoney))) { } phoney;

struct task_struct {
	raw_spinlock_t	pi_lock;

	cpumask_t	cpus_allowed __guarded_by(phoney);
};

void raw_spin_pi_lock(struct task_struct *p)
	__acquires(p->pi_lock)
	__acquires_shared(phoney);

void raw_spin_rq_lock(struct rq *rq)
	__acquires(rq->__lock)
	__acquires_shared(phoney);

static inline void upgrade_phoney(struct task_struct *p, struct rq *rq)
	__must_hold(p->pi_lock)
	__must_hold(rq->__lock)
	__releases_shared(phoney)
	__releases_shared(phoney)
	__acquires(phoney)
{ }

So this doesn't work because the recursion thing, but it is also just
plain horrible to have to do.

I would much rather write something like:

struct task_struct {
	raw_spinlock_t pi_lock;

	cpumask_t	cpus_allowed __guarded_by(pi_lock, rq->__lock);
}

And now I realize this case is doubly annoying because (rq) isn't
something that is in lexical scope at this point :-( These are the
locking rules though, and it is vexing not being able to express things
like this.


I should've taken another example; same thing, simpler setup:

struct perf_event_context {
	struct mutex		mutex;
	raw_spinlock_t		lock;

	struct list_head	event_list __guarded_by(mutex, lock);
	int			nr_events  __guarded_by(mutex, lock);
};

This would allow me to iterate the list holding either lock, but only
modify the list while holding both.

