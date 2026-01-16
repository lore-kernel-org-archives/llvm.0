Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C536B1E0E08;
	Fri, 16 Jan 2026 15:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576079; cv=none; b=f4TIou24EvdrV5q8c6cHr77kcvSd2TlL1SH97pV+Js0vuAd0SnO4JxmaO9KMaEu3NsYZrHHJqBoEXnLMfelngH5gPAW38vtMppgl5sQgUbJV5Xr8oznnAi4OYOyPCGbIH7Jv/M0IkO97WikOS6zB0hSb1HmdkyO5t0CzIIFgUzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576079; c=relaxed/simple;
	bh=HAal2ZQOmqynkufG8wvq7DnHoGGN2f5x/XReVlt4y4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROwsTWNu25nToVVhdksnlrQlVRCbfn8j3U4eP43qMR7c8XIuwSh8/9hpo3baLNuBjq05glix8CYAuMcVaZI1wlITWRKYk5Nz4nMbBKuvzdlC0J5lywr3juzAjjAUzZCgPOYNoUrQe9K2nMPAGycKLYLD+3/yIHooERZ7/+KOj5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=B0+otu6j; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B0+otu6j"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yl0yZgO9itm/HXrDNLJwL6YQRKy62RuLyTmin2h2tqE=; b=B0+otu6jouDpzMdcY2LdXhvc29
	oW6eVsrn3oF1jWn1irXLtj9bcAy0znED1eMNKxodnucBexWx+tzjxWUUSRqX9s/+Py+i9tiQNmPc3
	QWtqJv1t16heUk7C6UHjhA+GkRyJGnQkjKqyhfycus1QtsB5X9AGYTqebRW/eKXuNpV3QwPyaGfsv
	cBd/Q4E9sZ8LFFQgw+EUt9liKPkUikjnpCkGvZf9lC3WDlc04hMrGySnsG6BaEzJPxBugVwawgiwQ
	qUjkh997RSBR5Lup5NU6NyHqyW4JCtWl59AHc3YLuuEu2taZL+m3iUsKJ6Bf6rv1jCYJzNFzQkLq8
	SJQp2JlQ==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglQU-00000009Vga-3XRT;
	Fri, 16 Jan 2026 15:07:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 440613005E5; Fri, 16 Jan 2026 16:07:50 +0100 (CET)
Date: Fri, 16 Jan 2026 16:07:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Christoph Hellwig <hch@lst.de>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
Message-ID: <20260116150750.GG831050@noisy.programming.kicks-ass.net>
References: <20260115005231.1211866-1-elver@google.com>
 <20260115213311.GG830755@noisy.programming.kicks-ass.net>
 <aWmRlXZaOOUvU_Nv@elver.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWmRlXZaOOUvU_Nv@elver.google.com>

+Steve +Christoph

On Fri, Jan 16, 2026 at 02:17:09AM +0100, Marco Elver wrote:
> On Thu, Jan 15, 2026 at 10:33PM +0100, Peter Zijlstra wrote:
> > On Thu, Jan 15, 2026 at 01:51:25AM +0100, Marco Elver wrote:
> > 
> > > Longer-term, Peter suggested to create scoped init-guards [1], which
> > > will both fix the issue in a more robust way and also denote clearly
> > > where initialization starts and ends. However, that requires new APIs,
> > > and won't help bridge the gap for code that just wants to opt into the
> > > analysis with as little other changes as possible (as suggested in [2]).
> > 
> > OTOH, switching to that *now*, while we have minimal files with
> > CONTEXT_ANALYSIS enabled, is the easiest it will ever get.
> > 
> > The more files get enabled, the harder it gets to switch, no?
> 
> Fair point; meaning, we should improve it sooner than later. :-)
> 
> In my sleep-deprived state, I came up with the below. I'd split it up
> into maybe 3 patches (add guards; use guards where needed; remove
> assume).
> 
> Thoughts?

LGTM; Steve, Christoph, does this work for you guys? Init and then lock
would look something like:

	scoped_guard (spinlock_init, &obj->lock) {
		// init obj
		refcount_init(&obj->ref);
		...
	}

	guard(spinlock)(&obj->lock);
	// obj is locked.

> ------ >8 ------
> 
> diff --git a/Documentation/dev-tools/context-analysis.rst b/Documentation/dev-tools/context-analysis.rst
> index e69896e597b6..0afe29398e26 100644
> --- a/Documentation/dev-tools/context-analysis.rst
> +++ b/Documentation/dev-tools/context-analysis.rst
> @@ -83,9 +83,11 @@ Currently the following synchronization primitives are supported:
>  `bit_spinlock`, RCU, SRCU (`srcu_struct`), `rw_semaphore`, `local_lock_t`,
>  `ww_mutex`.
>  
> -For context locks with an initialization function (e.g., `spin_lock_init()`),
> -calling this function before initializing any guarded members or globals
> -prevents the compiler from issuing warnings about unguarded initialization.
> +For context locks with an initialization function (e.g., ``spin_lock_init()``),
> +use ``guard(foo_init)(&lock)`` or ``scoped_guard(foo_init, &lock) { ...  }``
> +pattern to initialize guarded members or globals. This initializes the context
> +lock, but also treats the context as active within the initialization scope
> +(initialization implies exclusive access to the underlying object).
>  
>  Lockdep assertions, such as `lockdep_assert_held()`, inform the compiler's
>  context analysis that the associated synchronization primitive is held after
> diff --git a/include/linux/local_lock.h b/include/linux/local_lock.h
> index 99c06e499375..0f971fd6d02a 100644
> --- a/include/linux/local_lock.h
> +++ b/include/linux/local_lock.h
> @@ -104,6 +104,8 @@ DEFINE_LOCK_GUARD_1(local_lock_nested_bh, local_lock_t __percpu,
>  		    local_lock_nested_bh(_T->lock),
>  		    local_unlock_nested_bh(_T->lock))
>  
> +DEFINE_LOCK_GUARD_1(local_lock_init, local_lock_t __percpu, local_lock_init(_T->lock), /* */)
> +
>  DECLARE_LOCK_GUARD_1_ATTRS(local_lock, __acquires(_T), __releases(*(local_lock_t __percpu **)_T))
>  #define class_local_lock_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_lock, _T)
>  DECLARE_LOCK_GUARD_1_ATTRS(local_lock_irq, __acquires(_T), __releases(*(local_lock_t __percpu **)_T))
> @@ -112,5 +114,11 @@ DECLARE_LOCK_GUARD_1_ATTRS(local_lock_irqsave, __acquires(_T), __releases(*(loca
>  #define class_local_lock_irqsave_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_lock_irqsave, _T)
>  DECLARE_LOCK_GUARD_1_ATTRS(local_lock_nested_bh, __acquires(_T), __releases(*(local_lock_t __percpu **)_T))
>  #define class_local_lock_nested_bh_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_lock_nested_bh, _T)
> +DECLARE_LOCK_GUARD_1_ATTRS(local_lock_init, __acquires(_T), __releases(*(local_lock_t __percpu **)_T))
> +#define class_local_lock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_lock_init, _T)
> +
> +DEFINE_LOCK_GUARD_1(local_trylock_init, local_trylock_t __percpu, local_trylock_init(_T->lock), /* */)
> +DECLARE_LOCK_GUARD_1_ATTRS(local_trylock_init, __acquires(_T), __releases(*(local_trylock_t __percpu **)_T))
> +#define class_local_trylock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_trylock_init, _T)
>  
>  #endif
> diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock_internal.h
> index e8c4803d8db4..66d4984eea62 100644
> --- a/include/linux/local_lock_internal.h
> +++ b/include/linux/local_lock_internal.h
> @@ -86,13 +86,11 @@ do {								\
>  			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
>  			      LD_LOCK_PERCPU);			\
>  	local_lock_debug_init(lock);				\
> -	__assume_ctx_lock(lock);				\
>  } while (0)
>  
>  #define __local_trylock_init(lock)				\
>  do {								\
>  	__local_lock_init((local_lock_t *)lock);		\
> -	__assume_ctx_lock(lock);				\
>  } while (0)
>  
>  #define __spinlock_nested_bh_init(lock)				\
> @@ -104,7 +102,6 @@ do {								\
>  			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
>  			      LD_LOCK_NORMAL);			\
>  	local_lock_debug_init(lock);				\
> -	__assume_ctx_lock(lock);				\
>  } while (0)
>  
>  #define __local_lock_acquire(lock)					\
> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index 89977c215cbd..ecaa0440f6ec 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -62,7 +62,6 @@ do {									\
>  	static struct lock_class_key __key;				\
>  									\
>  	__mutex_init((mutex), #mutex, &__key);				\
> -	__assume_ctx_lock(mutex);					\
>  } while (0)
>  
>  /**
> @@ -254,6 +253,7 @@ extern int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock) __cond_a
>  DEFINE_LOCK_GUARD_1(mutex, struct mutex, mutex_lock(_T->lock), mutex_unlock(_T->lock))
>  DEFINE_LOCK_GUARD_1_COND(mutex, _try, mutex_trylock(_T->lock))
>  DEFINE_LOCK_GUARD_1_COND(mutex, _intr, mutex_lock_interruptible(_T->lock), _RET == 0)
> +DEFINE_LOCK_GUARD_1(mutex_init, struct mutex, mutex_init(_T->lock), /* */)
>  
>  DECLARE_LOCK_GUARD_1_ATTRS(mutex,	__acquires(_T), __releases(*(struct mutex **)_T))
>  #define class_mutex_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex, _T)
> @@ -261,6 +261,8 @@ DECLARE_LOCK_GUARD_1_ATTRS(mutex_try,	__acquires(_T), __releases(*(struct mutex
>  #define class_mutex_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex_try, _T)
>  DECLARE_LOCK_GUARD_1_ATTRS(mutex_intr,	__acquires(_T), __releases(*(struct mutex **)_T))
>  #define class_mutex_intr_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex_intr, _T)
> +DECLARE_LOCK_GUARD_1_ATTRS(mutex_init,	__acquires(_T), __releases(*(struct mutex **)_T))
> +#define class_mutex_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex_init, _T)
>  
>  extern unsigned long mutex_get_owner(struct mutex *lock);
>  
> diff --git a/include/linux/rwlock.h b/include/linux/rwlock.h
> index 65a5b55e1bcd..3390d21c95dd 100644
> --- a/include/linux/rwlock.h
> +++ b/include/linux/rwlock.h
> @@ -22,11 +22,10 @@ do {								\
>  	static struct lock_class_key __key;			\
>  								\
>  	__rwlock_init((lock), #lock, &__key);			\
> -	__assume_ctx_lock(lock);				\
>  } while (0)
>  #else
>  # define rwlock_init(lock)					\
> -	do { *(lock) = __RW_LOCK_UNLOCKED(lock); __assume_ctx_lock(lock); } while (0)
> +	do { *(lock) = __RW_LOCK_UNLOCKED(lock); } while (0)
>  #endif
>  
>  #ifdef CONFIG_DEBUG_SPINLOCK
> diff --git a/include/linux/rwlock_rt.h b/include/linux/rwlock_rt.h
> index 37b387dcab21..5353abbfdc0b 100644
> --- a/include/linux/rwlock_rt.h
> +++ b/include/linux/rwlock_rt.h
> @@ -22,7 +22,6 @@ do {							\
>  							\
>  	init_rwbase_rt(&(rwl)->rwbase);			\
>  	__rt_rwlock_init(rwl, #rwl, &__key);		\
> -	__assume_ctx_lock(rwl);				\
>  } while (0)
>  
>  extern void rt_read_lock(rwlock_t *rwlock)	__acquires_shared(rwlock);
> diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
> index 8da14a08a4e1..9bf1d93d3d7b 100644
> --- a/include/linux/rwsem.h
> +++ b/include/linux/rwsem.h
> @@ -121,7 +121,6 @@ do {								\
>  	static struct lock_class_key __key;			\
>  								\
>  	__init_rwsem((sem), #sem, &__key);			\
> -	__assume_ctx_lock(sem);					\
>  } while (0)
>  
>  /*
> @@ -175,7 +174,6 @@ do {								\
>  	static struct lock_class_key __key;			\
>  								\
>  	__init_rwsem((sem), #sem, &__key);			\
> -	__assume_ctx_lock(sem);					\
>  } while (0)
>  
>  static __always_inline int rwsem_is_locked(const struct rw_semaphore *sem)
> @@ -280,6 +278,10 @@ DECLARE_LOCK_GUARD_1_ATTRS(rwsem_write_try, __acquires(_T), __releases(*(struct
>  DECLARE_LOCK_GUARD_1_ATTRS(rwsem_write_kill, __acquires(_T), __releases(*(struct rw_semaphore **)_T))
>  #define class_rwsem_write_kill_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(rwsem_write_kill, _T)
>  
> +DEFINE_LOCK_GUARD_1(rwsem_init, struct rw_semaphore, init_rwsem(_T->lock), /* */)
> +DECLARE_LOCK_GUARD_1_ATTRS(rwsem_init, __acquires(_T), __releases(*(struct rw_semaphore **)_T))
> +#define class_rwsem_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(rwsem_init, _T)
> +
>  /*
>   * downgrade write lock to read lock
>   */
> diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
> index 113320911a09..c0c6235dff59 100644
> --- a/include/linux/seqlock.h
> +++ b/include/linux/seqlock.h
> @@ -14,6 +14,7 @@
>   */
>  
>  #include <linux/compiler.h>
> +#include <linux/cleanup.h>
>  #include <linux/kcsan-checks.h>
>  #include <linux/lockdep.h>
>  #include <linux/mutex.h>
> @@ -816,7 +817,6 @@ static __always_inline void write_seqcount_latch_end(seqcount_latch_t *s)
>  	do {								\
>  		spin_lock_init(&(sl)->lock);				\
>  		seqcount_spinlock_init(&(sl)->seqcount, &(sl)->lock);	\
> -		__assume_ctx_lock(sl);					\
>  	} while (0)
>  
>  /**
> @@ -1359,4 +1359,8 @@ static __always_inline void __scoped_seqlock_cleanup_ctx(struct ss_tmp **s)
>  #define scoped_seqlock_read(_seqlock, _target)				\
>  	__scoped_seqlock_read(_seqlock, _target, __UNIQUE_ID(seqlock))
>  
> +DEFINE_LOCK_GUARD_1(seqlock_init, seqlock_t, seqlock_init(_T->lock), /* */)
> +DECLARE_LOCK_GUARD_1_ATTRS(seqlock_init, __acquires(_T), __releases(*(seqlock_t **)_T))
> +#define class_seqlock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(seqlock_init, _T)
> +
>  #endif /* __LINUX_SEQLOCK_H */
> diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
> index 396b8c5d6c1b..e1e2f144af9b 100644
> --- a/include/linux/spinlock.h
> +++ b/include/linux/spinlock.h
> @@ -106,12 +106,11 @@ do {									\
>  	static struct lock_class_key __key;				\
>  									\
>  	__raw_spin_lock_init((lock), #lock, &__key, LD_WAIT_SPIN);	\
> -	__assume_ctx_lock(lock);					\
>  } while (0)
>  
>  #else
>  # define raw_spin_lock_init(lock)				\
> -	do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); __assume_ctx_lock(lock); } while (0)
> +	do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
>  #endif
>  
>  #define raw_spin_is_locked(lock)	arch_spin_is_locked(&(lock)->raw_lock)
> @@ -324,7 +323,6 @@ do {								\
>  								\
>  	__raw_spin_lock_init(spinlock_check(lock),		\
>  			     #lock, &__key, LD_WAIT_CONFIG);	\
> -	__assume_ctx_lock(lock);				\
>  } while (0)
>  
>  #else
> @@ -333,7 +331,6 @@ do {								\
>  do {						\
>  	spinlock_check(_lock);			\
>  	*(_lock) = __SPIN_LOCK_UNLOCKED(_lock);	\
> -	__assume_ctx_lock(_lock);		\
>  } while (0)
>  
>  #endif
> @@ -582,6 +579,10 @@ DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irqsave, _try,
>  DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_irqsave_try, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
>  #define class_raw_spinlock_irqsave_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_irqsave_try, _T)
>  
> +DEFINE_LOCK_GUARD_1(raw_spinlock_init, raw_spinlock_t, raw_spin_lock_init(_T->lock), /* */)
> +DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_init, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
> +#define class_raw_spinlock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_init, _T)
> +
>  DEFINE_LOCK_GUARD_1(spinlock, spinlock_t,
>  		    spin_lock(_T->lock),
>  		    spin_unlock(_T->lock))
> @@ -626,6 +627,10 @@ DEFINE_LOCK_GUARD_1_COND(spinlock_irqsave, _try,
>  DECLARE_LOCK_GUARD_1_ATTRS(spinlock_irqsave_try, __acquires(_T), __releases(*(spinlock_t **)_T))
>  #define class_spinlock_irqsave_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irqsave_try, _T)
>  
> +DEFINE_LOCK_GUARD_1(spinlock_init, spinlock_t, spin_lock_init(_T->lock), /* */)
> +DECLARE_LOCK_GUARD_1_ATTRS(spinlock_init, __acquires(_T), __releases(*(spinlock_t **)_T))
> +#define class_spinlock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_init, _T)
> +
>  DEFINE_LOCK_GUARD_1(read_lock, rwlock_t,
>  		    read_lock(_T->lock),
>  		    read_unlock(_T->lock))
> @@ -664,5 +669,9 @@ DEFINE_LOCK_GUARD_1(write_lock_irqsave, rwlock_t,
>  DECLARE_LOCK_GUARD_1_ATTRS(write_lock_irqsave, __acquires(_T), __releases(*(rwlock_t **)_T))
>  #define class_write_lock_irqsave_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(write_lock_irqsave, _T)
>  
> +DEFINE_LOCK_GUARD_1(rwlock_init, rwlock_t, rwlock_init(_T->lock), /* */)
> +DECLARE_LOCK_GUARD_1_ATTRS(rwlock_init, __acquires(_T), __releases(*(rwlock_t **)_T))
> +#define class_rwlock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(rwlock_init, _T)
> +
>  #undef __LINUX_INSIDE_SPINLOCK_H
>  #endif /* __LINUX_SPINLOCK_H */
> diff --git a/include/linux/spinlock_rt.h b/include/linux/spinlock_rt.h
> index 0a585768358f..373618a4243c 100644
> --- a/include/linux/spinlock_rt.h
> +++ b/include/linux/spinlock_rt.h
> @@ -20,7 +20,6 @@ static inline void __rt_spin_lock_init(spinlock_t *lock, const char *name,
>  do {								\
>  	rt_mutex_base_init(&(slock)->lock);			\
>  	__rt_spin_lock_init(slock, name, key, percpu);		\
> -	__assume_ctx_lock(slock);				\
>  } while (0)
>  
>  #define _spin_lock_init(slock, percpu)				\
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 6cbc6e2d8aee..5397d0c14127 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -530,7 +530,7 @@ static int kcov_open(struct inode *inode, struct file *filep)
>  	kcov = kzalloc(sizeof(*kcov), GFP_KERNEL);
>  	if (!kcov)
>  		return -ENOMEM;
> -	spin_lock_init(&kcov->lock);
> +	guard(spinlock_init)(&kcov->lock);
>  	kcov->mode = KCOV_MODE_DISABLED;
>  	kcov->sequence = 1;
>  	refcount_set(&kcov->refcount, 1);
> diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
> index 1c5a381461fc..0f05943d957f 100644
> --- a/lib/test_context-analysis.c
> +++ b/lib/test_context-analysis.c
> @@ -35,7 +35,7 @@ static void __used test_common_helpers(void)
>  	};											\
>  	static void __used test_##class##_init(struct test_##class##_data *d)			\
>  	{											\
> -		type_init(&d->lock);								\
> +		guard(type_init)(&d->lock);							\
>  		d->counter = 0;									\
>  	}											\
>  	static void __used test_##class(struct test_##class##_data *d)				\
> @@ -83,7 +83,7 @@ static void __used test_common_helpers(void)
>  
>  TEST_SPINLOCK_COMMON(raw_spinlock,
>  		     raw_spinlock_t,
> -		     raw_spin_lock_init,
> +		     raw_spinlock_init,
>  		     raw_spin_lock,
>  		     raw_spin_unlock,
>  		     raw_spin_trylock,
> @@ -109,7 +109,7 @@ static void __used test_raw_spinlock_trylock_extra(struct test_raw_spinlock_data
>  
>  TEST_SPINLOCK_COMMON(spinlock,
>  		     spinlock_t,
> -		     spin_lock_init,
> +		     spinlock_init,
>  		     spin_lock,
>  		     spin_unlock,
>  		     spin_trylock,
> @@ -163,7 +163,7 @@ struct test_mutex_data {
>  
>  static void __used test_mutex_init(struct test_mutex_data *d)
>  {
> -	mutex_init(&d->mtx);
> +	guard(mutex_init)(&d->mtx);
>  	d->counter = 0;
>  }
>  
> @@ -226,7 +226,7 @@ struct test_seqlock_data {
>  
>  static void __used test_seqlock_init(struct test_seqlock_data *d)
>  {
> -	seqlock_init(&d->sl);
> +	guard(seqlock_init)(&d->sl);
>  	d->counter = 0;
>  }
>  
> @@ -275,7 +275,7 @@ struct test_rwsem_data {
>  
>  static void __used test_rwsem_init(struct test_rwsem_data *d)
>  {
> -	init_rwsem(&d->sem);
> +	guard(rwsem_init)(&d->sem);
>  	d->counter = 0;
>  }
>  
> @@ -475,7 +475,7 @@ static DEFINE_PER_CPU(struct test_local_lock_data, test_local_lock_data) = {
>  
>  static void __used test_local_lock_init(struct test_local_lock_data *d)
>  {
> -	local_lock_init(&d->lock);
> +	guard(local_lock_init)(&d->lock);
>  	d->counter = 0;
>  }
>  
> @@ -519,7 +519,7 @@ static DEFINE_PER_CPU(struct test_local_trylock_data, test_local_trylock_data) =
>  
>  static void __used test_local_trylock_init(struct test_local_trylock_data *d)
>  {
> -	local_trylock_init(&d->lock);
> +	guard(local_trylock_init)(&d->lock);
>  	d->counter = 0;
>  }
>  
