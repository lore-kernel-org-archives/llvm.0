Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC61B330B12;
	Wed, 21 Jan 2026 19:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769022114; cv=none; b=uB88TjT3NRKISwZRKFHUIcOujkghA69o5hR/yQIsuBsHwX6QK60i8LpbkNtv/u6hSTvYaowDo7o7DTYu53XlkFly6qAT7baXGzzk5ARaIjgPejHZb0Eb9JLagPypDVXNLFlFuLS6YUAAC1GImHWmuUWkwfm/nL9cyxfoq9pnKCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769022114; c=relaxed/simple;
	bh=AZFbLi9MTpVqcK2b6gAR0wnBdlNoR7Atrsb7nbWrkdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6nn8pX9TtGs0SEpbHOmLvA5K61gNAxp2VvZWTGOq3KsDwMzcGplmZBABzMvKZ2AEfgE2LupD8+Niyxbn9oz/BpQcXce4NffyhhiZMM3X8/qhB5iftAS+Sm6IGg98WPJCh+JIGimgKC6sWmsr6lch+vkmsCxy6CQ8nDBr7WGEqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=na6ayLZe; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="na6ayLZe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O7oFgSetwXro6TPA5B8tsIbGjo3KvpfyWn/Ng7ufAjg=; b=na6ayLZetbkx1QQaC8iSbLH+IH
	O+vwBkkbZnr/IESylt9fj+i6pyb6XQ18vVcdDaGKcJzTAQ+jlzkO3uCktGmThdbaAVH/eXbXwfKE6
	Xo4k0NPD5+5LrS5Vz2qdRZ9YwoYx0V6cs5vr+y9xXjXJbZSrVgKUC1x5PGairuQXMUF5p2NlK5zvM
	E9qhGJDOImAaxlVCPFnAcM+OAJWnDOyoEef1GvkgM/R5uqXRXyMdzum+OBhtqBQWV/smS6u7WbRpM
	kJxz3DgjizMucr/bIAwCAafPPrinb6Ay/ZyWPt8oDybqsWL9MI1Fv3pbW3iOID5yGL8QMvHfWXujk
	bcsEkryA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidSb-0000000GeQr-0K6W;
	Wed, 21 Jan 2026 19:01:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 31ECD300328; Wed, 21 Jan 2026 20:01:44 +0100 (CET)
Date: Wed, 21 Jan 2026 20:01:44 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: elver@google.com, linux-kernel@vger.kernel.org, bigeasy@linutronix.de,
	mingo@kernel.org, tglx@linutronix.de, will@kernel.org,
	boqun.feng@gmail.com, longman@redhat.com, hch@lst.de,
	rostedt@goodmis.org, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 3/4] locking/rtmutex: Add context analysis
Message-ID: <20260121190144.GK166857@noisy.programming.kicks-ass.net>
References: <20260121110704.221498346@infradead.org>
 <20260121111213.851599178@infradead.org>
 <377d5833-6876-4fea-b17f-19d4b03d8583@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <377d5833-6876-4fea-b17f-19d4b03d8583@acm.org>

On Wed, Jan 21, 2026 at 09:15:53AM -0800, Bart Van Assche wrote:
> On 1/21/26 3:07 AM, Peter Zijlstra wrote:
> > Add compiler context analysis annotations.
> > 
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > ---
> >   include/linux/mutex.h           |    2 +-
> >   include/linux/rtmutex.h         |    4 ++--
> >   kernel/locking/Makefile         |    2 ++
> >   kernel/locking/mutex.c          |    2 --
> >   kernel/locking/rtmutex.c        |   18 +++++++++++++++++-
> >   kernel/locking/rtmutex_api.c    |    3 +++
> >   kernel/locking/rtmutex_common.h |   22 ++++++++++++++++------
> >   kernel/locking/ww_mutex.h       |   18 +++++++++++++-----
> >   kernel/locking/ww_rt_mutex.c    |    1 +
> >   9 files changed, 55 insertions(+), 17 deletions(-)
> 
> The patch subject says "rtmutex" but this patch includes a change for
> the header file include/linux/mutex.h. Shouldn't that change be moved
> into the mutex patch?

Clearly I suffered from wandering hunks syndrome while doing these :/

> > --- a/kernel/locking/mutex.c
> > +++ b/kernel/locking/mutex.c
> > @@ -848,7 +848,6 @@ EXPORT_SYMBOL_GPL(mutex_lock_nested);
> >   void __sched
> >   _mutex_lock_nest_lock(struct mutex *lock, struct lockdep_map *nest)
> > -	__acquires(lock)
> >   {
> >   	__mutex_lock(lock, TASK_UNINTERRUPTIBLE, 0, nest, _RET_IP_);
> >   	__acquire(lock);
> 
> Shouldn't the "__acquires()" annotation be moved to the declaration in
> <linux/mutex.h>?

It is, but yeah, this should be in the previous patch.

> >   #define MUTEX		mutex
> >   #define MUTEX_WAITER	mutex_waiter
> > +#define MUST_HOLD_WAIT_LOCK	__must_hold(&lock->wait_lock)
> >   static inline struct mutex_waiter *
> >   __ww_waiter_first(struct mutex *lock)
> > @@ -97,9 +98,11 @@ static inline void lockdep_assert_wait_l
> >   #define MUTEX		rt_mutex
> >   #define MUTEX_WAITER	rt_mutex_waiter
> > +#define MUST_HOLD_WAIT_LOCK	__must_hold(&lock->rtmutex.wait_lock)
> 
> Is it really necessary to introduce these two macros? I prefer to see
> the __must_hold() annotations instead of the macro names.

You'd rather see something like:

	__must_hold(&lock->WAIT_LOCK)

? Can do I suppose.
