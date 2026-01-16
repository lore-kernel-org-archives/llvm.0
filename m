Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260AA328B78
	for <llvm@lists.linux.dev>; Fri, 16 Jan 2026 01:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768526246; cv=none; b=IX0w8ndEzMuvhS1Idnq4bTSPZWlZsLe7er6MKIG8NyOaqzUCj5hSYVxvDxItPohngpQRZbku9dNRfPzgXFXdxxO1pODSHUjTRiLxpRCDt6UijdWIH2faBJXMU8aRfZGBU5R0RCk3+OpAoyQ5RZU/wjq7j9gMG2g3c/dabyOQYG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768526246; c=relaxed/simple;
	bh=jo/z2ClkXAUNPt1s3azDN+3+GXUCVx/cLHT+tbRfrzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZ4dSNAsqJvWCIIlQoJYwz4L//BhcocGsp+V/87b8t5qJ1CCSHwr89WX/LDE1wHr3+7YYYs2N8QVN6CgUqHH8qJqqyRvlMafoumpYb6EV4INq/l6lrEJhw526t/mv14voTD4p82vPhcWMgv1QI0WHjo9TWkZZydMO+6EJXZoWDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WTN8vD+l; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WTN8vD+l"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so17815515e9.0
        for <llvm@lists.linux.dev>; Thu, 15 Jan 2026 17:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768526237; x=1769131037; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RarHsn9mectVuS/RlfcIvspw8mX/YCp8idbx6nxucHY=;
        b=WTN8vD+lWt/OV8kX9Fne5/eaUcLSjOkdqUCQOpIEAgjSngrDIFB8wUJZTP7fEhFPRU
         46yRdC0+zjeKCdsWgtZnanD5rLBxfqnWnPmhLFK7041erMljBJx6mjpenOzMlpqLQx93
         UkvPjhsA0fgXvJtujP88hIsUw3QSP3mvRIV8HVPrXIM9m2Rx6h85cyFnI0GW26hkai9u
         ZC6iyNXcY/7eOxnrD1Oe5C6IlrVjlqKMW+EK2uI/dZGllB5Ji0SEK2E201wfNvoYu3o1
         NtM/4gti/4UPUxgsD1myuSNSylFXI/037jWw2rXyPvpUV/BXhBONoskBO24mVrgMfbjL
         /UAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526237; x=1769131037;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RarHsn9mectVuS/RlfcIvspw8mX/YCp8idbx6nxucHY=;
        b=Yhx4b5dLV8CmNjmG2Zzh7u46BWIEJfBndVGpYwEcEXqxI3ylpvSnilii0qt9rCBCYT
         bhHeQH6rCGpAWdSMEFyrjP9/7uw3QoXNx3tf+dEnqeUkXBBT4ArQ0x95jd2L7QNIWNj4
         B6FcXAqttYrNJCNJn+CvDxBXxcwFfUI4UCBMFLDYOwruHHZn/xJuYmVRnJ/muboV5lVC
         zL4sNctHxcXiuhFASwqwTYYeUp6AN73H+KtCUU6yrhlkT3zmtjO/NxRAEJqudae7t5Pf
         1aKg7pB55V+Y6WQP9Bjec+5mlLKySFq/Wj03IQdJ7hHW3JYoSrPPf98gWV+jTdyAxBC9
         UiIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUptvSefy7xAHg0orB1Zg+HjA9ph+zOEfexaFIUsVfNV3HC5w7ShtLnNeYDUDrZVjxbsefg@lists.linux.dev
X-Gm-Message-State: AOJu0YwLlan0wyUT0WXO5O+rGEZ4vVUdsl5rSMBY/RZFSDP7kOb1Yn8S
	2c7Hh3OT8GY4oPGzx1lgnDnJJYR3q9H/VJxhHEPRBklGxHr2bJkmor6+9mRZbbE5blDO5s6e8eE
	3531LWq1RL/4=
X-Gm-Gg: AY/fxX4kUDnQdX3gk4yJa9Y4NNyQXOyimTF++WFhFuHF8hFq1XKMsQPdqtQXy0+2Irw
	65Ho9rLaL0Fy2TRMwkoL4q64SJW0fxgzrk4fmoFdGyelWP+q0pzSuBhcZajKqEe58XEJ6Z2Kd16
	N4iIGYbx+1QwcV5+7LvFQGTt66h/UyfcmqGhG7vHmqApe6w96VQv2cLT9/Z/9QQrwUArfzyC0TC
	g1I7hUE6pJxss3++wb3QKUtC435Sd+14wK1dQmErfA57sUcnPB45IhzQAEWBvjEqVOVpEr0dM+8
	MUInzs2r6FoQyvFtZLeOtLpflVtnDmm0PvznBpnrcwzcBwHO5V1bLd9/YhTxjEVYC+iORw+WWsV
	PCBhiiEvCsid7WcR7CmzLKps2RP22uN5Y7rTsHiFIfwauJgTsFOSq10M2629v3AezHzCAY7ziAe
	QDy515BAlcPKQb+7QI1AvqV3r7NV2ftdQsn1hB1pfK7/6HqNhc
X-Received: by 2002:a05:600c:6215:b0:477:6e02:54a5 with SMTP id 5b1f17b1804b1-4801e3388b6mr16386085e9.18.1768526236723;
        Thu, 15 Jan 2026 17:17:16 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:f9a6:51d3:e5cd:842f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f3b7a5f94sm77417205e9.0.2026.01.15.17.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:17:15 -0800 (PST)
Date: Fri, 16 Jan 2026 02:17:09 +0100
From: Marco Elver <elver@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
Message-ID: <aWmRlXZaOOUvU_Nv@elver.google.com>
References: <20260115005231.1211866-1-elver@google.com>
 <20260115213311.GG830755@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115213311.GG830755@noisy.programming.kicks-ass.net>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Thu, Jan 15, 2026 at 10:33PM +0100, Peter Zijlstra wrote:
> On Thu, Jan 15, 2026 at 01:51:25AM +0100, Marco Elver wrote:
> 
> > Longer-term, Peter suggested to create scoped init-guards [1], which
> > will both fix the issue in a more robust way and also denote clearly
> > where initialization starts and ends. However, that requires new APIs,
> > and won't help bridge the gap for code that just wants to opt into the
> > analysis with as little other changes as possible (as suggested in [2]).
> 
> OTOH, switching to that *now*, while we have minimal files with
> CONTEXT_ANALYSIS enabled, is the easiest it will ever get.
> 
> The more files get enabled, the harder it gets to switch, no?

Fair point; meaning, we should improve it sooner than later. :-)

In my sleep-deprived state, I came up with the below. I'd split it up
into maybe 3 patches (add guards; use guards where needed; remove
assume).

Thoughts?

------ >8 ------

diff --git a/Documentation/dev-tools/context-analysis.rst b/Documentation/dev-tools/context-analysis.rst
index e69896e597b6..0afe29398e26 100644
--- a/Documentation/dev-tools/context-analysis.rst
+++ b/Documentation/dev-tools/context-analysis.rst
@@ -83,9 +83,11 @@ Currently the following synchronization primitives are supported:
 `bit_spinlock`, RCU, SRCU (`srcu_struct`), `rw_semaphore`, `local_lock_t`,
 `ww_mutex`.
 
-For context locks with an initialization function (e.g., `spin_lock_init()`),
-calling this function before initializing any guarded members or globals
-prevents the compiler from issuing warnings about unguarded initialization.
+For context locks with an initialization function (e.g., ``spin_lock_init()``),
+use ``guard(foo_init)(&lock)`` or ``scoped_guard(foo_init, &lock) { ...  }``
+pattern to initialize guarded members or globals. This initializes the context
+lock, but also treats the context as active within the initialization scope
+(initialization implies exclusive access to the underlying object).
 
 Lockdep assertions, such as `lockdep_assert_held()`, inform the compiler's
 context analysis that the associated synchronization primitive is held after
diff --git a/include/linux/local_lock.h b/include/linux/local_lock.h
index 99c06e499375..0f971fd6d02a 100644
--- a/include/linux/local_lock.h
+++ b/include/linux/local_lock.h
@@ -104,6 +104,8 @@ DEFINE_LOCK_GUARD_1(local_lock_nested_bh, local_lock_t __percpu,
 		    local_lock_nested_bh(_T->lock),
 		    local_unlock_nested_bh(_T->lock))
 
+DEFINE_LOCK_GUARD_1(local_lock_init, local_lock_t __percpu, local_lock_init(_T->lock), /* */)
+
 DECLARE_LOCK_GUARD_1_ATTRS(local_lock, __acquires(_T), __releases(*(local_lock_t __percpu **)_T))
 #define class_local_lock_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_lock, _T)
 DECLARE_LOCK_GUARD_1_ATTRS(local_lock_irq, __acquires(_T), __releases(*(local_lock_t __percpu **)_T))
@@ -112,5 +114,11 @@ DECLARE_LOCK_GUARD_1_ATTRS(local_lock_irqsave, __acquires(_T), __releases(*(loca
 #define class_local_lock_irqsave_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_lock_irqsave, _T)
 DECLARE_LOCK_GUARD_1_ATTRS(local_lock_nested_bh, __acquires(_T), __releases(*(local_lock_t __percpu **)_T))
 #define class_local_lock_nested_bh_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_lock_nested_bh, _T)
+DECLARE_LOCK_GUARD_1_ATTRS(local_lock_init, __acquires(_T), __releases(*(local_lock_t __percpu **)_T))
+#define class_local_lock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_lock_init, _T)
+
+DEFINE_LOCK_GUARD_1(local_trylock_init, local_trylock_t __percpu, local_trylock_init(_T->lock), /* */)
+DECLARE_LOCK_GUARD_1_ATTRS(local_trylock_init, __acquires(_T), __releases(*(local_trylock_t __percpu **)_T))
+#define class_local_trylock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(local_trylock_init, _T)
 
 #endif
diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock_internal.h
index e8c4803d8db4..66d4984eea62 100644
--- a/include/linux/local_lock_internal.h
+++ b/include/linux/local_lock_internal.h
@@ -86,13 +86,11 @@ do {								\
 			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
 			      LD_LOCK_PERCPU);			\
 	local_lock_debug_init(lock);				\
-	__assume_ctx_lock(lock);				\
 } while (0)
 
 #define __local_trylock_init(lock)				\
 do {								\
 	__local_lock_init((local_lock_t *)lock);		\
-	__assume_ctx_lock(lock);				\
 } while (0)
 
 #define __spinlock_nested_bh_init(lock)				\
@@ -104,7 +102,6 @@ do {								\
 			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
 			      LD_LOCK_NORMAL);			\
 	local_lock_debug_init(lock);				\
-	__assume_ctx_lock(lock);				\
 } while (0)
 
 #define __local_lock_acquire(lock)					\
diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 89977c215cbd..ecaa0440f6ec 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -62,7 +62,6 @@ do {									\
 	static struct lock_class_key __key;				\
 									\
 	__mutex_init((mutex), #mutex, &__key);				\
-	__assume_ctx_lock(mutex);					\
 } while (0)
 
 /**
@@ -254,6 +253,7 @@ extern int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock) __cond_a
 DEFINE_LOCK_GUARD_1(mutex, struct mutex, mutex_lock(_T->lock), mutex_unlock(_T->lock))
 DEFINE_LOCK_GUARD_1_COND(mutex, _try, mutex_trylock(_T->lock))
 DEFINE_LOCK_GUARD_1_COND(mutex, _intr, mutex_lock_interruptible(_T->lock), _RET == 0)
+DEFINE_LOCK_GUARD_1(mutex_init, struct mutex, mutex_init(_T->lock), /* */)
 
 DECLARE_LOCK_GUARD_1_ATTRS(mutex,	__acquires(_T), __releases(*(struct mutex **)_T))
 #define class_mutex_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex, _T)
@@ -261,6 +261,8 @@ DECLARE_LOCK_GUARD_1_ATTRS(mutex_try,	__acquires(_T), __releases(*(struct mutex
 #define class_mutex_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex_try, _T)
 DECLARE_LOCK_GUARD_1_ATTRS(mutex_intr,	__acquires(_T), __releases(*(struct mutex **)_T))
 #define class_mutex_intr_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex_intr, _T)
+DECLARE_LOCK_GUARD_1_ATTRS(mutex_init,	__acquires(_T), __releases(*(struct mutex **)_T))
+#define class_mutex_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex_init, _T)
 
 extern unsigned long mutex_get_owner(struct mutex *lock);
 
diff --git a/include/linux/rwlock.h b/include/linux/rwlock.h
index 65a5b55e1bcd..3390d21c95dd 100644
--- a/include/linux/rwlock.h
+++ b/include/linux/rwlock.h
@@ -22,11 +22,10 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__rwlock_init((lock), #lock, &__key);			\
-	__assume_ctx_lock(lock);				\
 } while (0)
 #else
 # define rwlock_init(lock)					\
-	do { *(lock) = __RW_LOCK_UNLOCKED(lock); __assume_ctx_lock(lock); } while (0)
+	do { *(lock) = __RW_LOCK_UNLOCKED(lock); } while (0)
 #endif
 
 #ifdef CONFIG_DEBUG_SPINLOCK
diff --git a/include/linux/rwlock_rt.h b/include/linux/rwlock_rt.h
index 37b387dcab21..5353abbfdc0b 100644
--- a/include/linux/rwlock_rt.h
+++ b/include/linux/rwlock_rt.h
@@ -22,7 +22,6 @@ do {							\
 							\
 	init_rwbase_rt(&(rwl)->rwbase);			\
 	__rt_rwlock_init(rwl, #rwl, &__key);		\
-	__assume_ctx_lock(rwl);				\
 } while (0)
 
 extern void rt_read_lock(rwlock_t *rwlock)	__acquires_shared(rwlock);
diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
index 8da14a08a4e1..9bf1d93d3d7b 100644
--- a/include/linux/rwsem.h
+++ b/include/linux/rwsem.h
@@ -121,7 +121,6 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__init_rwsem((sem), #sem, &__key);			\
-	__assume_ctx_lock(sem);					\
 } while (0)
 
 /*
@@ -175,7 +174,6 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__init_rwsem((sem), #sem, &__key);			\
-	__assume_ctx_lock(sem);					\
 } while (0)
 
 static __always_inline int rwsem_is_locked(const struct rw_semaphore *sem)
@@ -280,6 +278,10 @@ DECLARE_LOCK_GUARD_1_ATTRS(rwsem_write_try, __acquires(_T), __releases(*(struct
 DECLARE_LOCK_GUARD_1_ATTRS(rwsem_write_kill, __acquires(_T), __releases(*(struct rw_semaphore **)_T))
 #define class_rwsem_write_kill_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(rwsem_write_kill, _T)
 
+DEFINE_LOCK_GUARD_1(rwsem_init, struct rw_semaphore, init_rwsem(_T->lock), /* */)
+DECLARE_LOCK_GUARD_1_ATTRS(rwsem_init, __acquires(_T), __releases(*(struct rw_semaphore **)_T))
+#define class_rwsem_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(rwsem_init, _T)
+
 /*
  * downgrade write lock to read lock
  */
diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
index 113320911a09..c0c6235dff59 100644
--- a/include/linux/seqlock.h
+++ b/include/linux/seqlock.h
@@ -14,6 +14,7 @@
  */
 
 #include <linux/compiler.h>
+#include <linux/cleanup.h>
 #include <linux/kcsan-checks.h>
 #include <linux/lockdep.h>
 #include <linux/mutex.h>
@@ -816,7 +817,6 @@ static __always_inline void write_seqcount_latch_end(seqcount_latch_t *s)
 	do {								\
 		spin_lock_init(&(sl)->lock);				\
 		seqcount_spinlock_init(&(sl)->seqcount, &(sl)->lock);	\
-		__assume_ctx_lock(sl);					\
 	} while (0)
 
 /**
@@ -1359,4 +1359,8 @@ static __always_inline void __scoped_seqlock_cleanup_ctx(struct ss_tmp **s)
 #define scoped_seqlock_read(_seqlock, _target)				\
 	__scoped_seqlock_read(_seqlock, _target, __UNIQUE_ID(seqlock))
 
+DEFINE_LOCK_GUARD_1(seqlock_init, seqlock_t, seqlock_init(_T->lock), /* */)
+DECLARE_LOCK_GUARD_1_ATTRS(seqlock_init, __acquires(_T), __releases(*(seqlock_t **)_T))
+#define class_seqlock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(seqlock_init, _T)
+
 #endif /* __LINUX_SEQLOCK_H */
diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index 396b8c5d6c1b..e1e2f144af9b 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -106,12 +106,11 @@ do {									\
 	static struct lock_class_key __key;				\
 									\
 	__raw_spin_lock_init((lock), #lock, &__key, LD_WAIT_SPIN);	\
-	__assume_ctx_lock(lock);					\
 } while (0)
 
 #else
 # define raw_spin_lock_init(lock)				\
-	do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); __assume_ctx_lock(lock); } while (0)
+	do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); } while (0)
 #endif
 
 #define raw_spin_is_locked(lock)	arch_spin_is_locked(&(lock)->raw_lock)
@@ -324,7 +323,6 @@ do {								\
 								\
 	__raw_spin_lock_init(spinlock_check(lock),		\
 			     #lock, &__key, LD_WAIT_CONFIG);	\
-	__assume_ctx_lock(lock);				\
 } while (0)
 
 #else
@@ -333,7 +331,6 @@ do {								\
 do {						\
 	spinlock_check(_lock);			\
 	*(_lock) = __SPIN_LOCK_UNLOCKED(_lock);	\
-	__assume_ctx_lock(_lock);		\
 } while (0)
 
 #endif
@@ -582,6 +579,10 @@ DEFINE_LOCK_GUARD_1_COND(raw_spinlock_irqsave, _try,
 DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_irqsave_try, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
 #define class_raw_spinlock_irqsave_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_irqsave_try, _T)
 
+DEFINE_LOCK_GUARD_1(raw_spinlock_init, raw_spinlock_t, raw_spin_lock_init(_T->lock), /* */)
+DECLARE_LOCK_GUARD_1_ATTRS(raw_spinlock_init, __acquires(_T), __releases(*(raw_spinlock_t **)_T))
+#define class_raw_spinlock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(raw_spinlock_init, _T)
+
 DEFINE_LOCK_GUARD_1(spinlock, spinlock_t,
 		    spin_lock(_T->lock),
 		    spin_unlock(_T->lock))
@@ -626,6 +627,10 @@ DEFINE_LOCK_GUARD_1_COND(spinlock_irqsave, _try,
 DECLARE_LOCK_GUARD_1_ATTRS(spinlock_irqsave_try, __acquires(_T), __releases(*(spinlock_t **)_T))
 #define class_spinlock_irqsave_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_irqsave_try, _T)
 
+DEFINE_LOCK_GUARD_1(spinlock_init, spinlock_t, spin_lock_init(_T->lock), /* */)
+DECLARE_LOCK_GUARD_1_ATTRS(spinlock_init, __acquires(_T), __releases(*(spinlock_t **)_T))
+#define class_spinlock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(spinlock_init, _T)
+
 DEFINE_LOCK_GUARD_1(read_lock, rwlock_t,
 		    read_lock(_T->lock),
 		    read_unlock(_T->lock))
@@ -664,5 +669,9 @@ DEFINE_LOCK_GUARD_1(write_lock_irqsave, rwlock_t,
 DECLARE_LOCK_GUARD_1_ATTRS(write_lock_irqsave, __acquires(_T), __releases(*(rwlock_t **)_T))
 #define class_write_lock_irqsave_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(write_lock_irqsave, _T)
 
+DEFINE_LOCK_GUARD_1(rwlock_init, rwlock_t, rwlock_init(_T->lock), /* */)
+DECLARE_LOCK_GUARD_1_ATTRS(rwlock_init, __acquires(_T), __releases(*(rwlock_t **)_T))
+#define class_rwlock_init_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(rwlock_init, _T)
+
 #undef __LINUX_INSIDE_SPINLOCK_H
 #endif /* __LINUX_SPINLOCK_H */
diff --git a/include/linux/spinlock_rt.h b/include/linux/spinlock_rt.h
index 0a585768358f..373618a4243c 100644
--- a/include/linux/spinlock_rt.h
+++ b/include/linux/spinlock_rt.h
@@ -20,7 +20,6 @@ static inline void __rt_spin_lock_init(spinlock_t *lock, const char *name,
 do {								\
 	rt_mutex_base_init(&(slock)->lock);			\
 	__rt_spin_lock_init(slock, name, key, percpu);		\
-	__assume_ctx_lock(slock);				\
 } while (0)
 
 #define _spin_lock_init(slock, percpu)				\
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 6cbc6e2d8aee..5397d0c14127 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -530,7 +530,7 @@ static int kcov_open(struct inode *inode, struct file *filep)
 	kcov = kzalloc(sizeof(*kcov), GFP_KERNEL);
 	if (!kcov)
 		return -ENOMEM;
-	spin_lock_init(&kcov->lock);
+	guard(spinlock_init)(&kcov->lock);
 	kcov->mode = KCOV_MODE_DISABLED;
 	kcov->sequence = 1;
 	refcount_set(&kcov->refcount, 1);
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 1c5a381461fc..0f05943d957f 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -35,7 +35,7 @@ static void __used test_common_helpers(void)
 	};											\
 	static void __used test_##class##_init(struct test_##class##_data *d)			\
 	{											\
-		type_init(&d->lock);								\
+		guard(type_init)(&d->lock);							\
 		d->counter = 0;									\
 	}											\
 	static void __used test_##class(struct test_##class##_data *d)				\
@@ -83,7 +83,7 @@ static void __used test_common_helpers(void)
 
 TEST_SPINLOCK_COMMON(raw_spinlock,
 		     raw_spinlock_t,
-		     raw_spin_lock_init,
+		     raw_spinlock_init,
 		     raw_spin_lock,
 		     raw_spin_unlock,
 		     raw_spin_trylock,
@@ -109,7 +109,7 @@ static void __used test_raw_spinlock_trylock_extra(struct test_raw_spinlock_data
 
 TEST_SPINLOCK_COMMON(spinlock,
 		     spinlock_t,
-		     spin_lock_init,
+		     spinlock_init,
 		     spin_lock,
 		     spin_unlock,
 		     spin_trylock,
@@ -163,7 +163,7 @@ struct test_mutex_data {
 
 static void __used test_mutex_init(struct test_mutex_data *d)
 {
-	mutex_init(&d->mtx);
+	guard(mutex_init)(&d->mtx);
 	d->counter = 0;
 }
 
@@ -226,7 +226,7 @@ struct test_seqlock_data {
 
 static void __used test_seqlock_init(struct test_seqlock_data *d)
 {
-	seqlock_init(&d->sl);
+	guard(seqlock_init)(&d->sl);
 	d->counter = 0;
 }
 
@@ -275,7 +275,7 @@ struct test_rwsem_data {
 
 static void __used test_rwsem_init(struct test_rwsem_data *d)
 {
-	init_rwsem(&d->sem);
+	guard(rwsem_init)(&d->sem);
 	d->counter = 0;
 }
 
@@ -475,7 +475,7 @@ static DEFINE_PER_CPU(struct test_local_lock_data, test_local_lock_data) = {
 
 static void __used test_local_lock_init(struct test_local_lock_data *d)
 {
-	local_lock_init(&d->lock);
+	guard(local_lock_init)(&d->lock);
 	d->counter = 0;
 }
 
@@ -519,7 +519,7 @@ static DEFINE_PER_CPU(struct test_local_trylock_data, test_local_trylock_data) =
 
 static void __used test_local_trylock_init(struct test_local_trylock_data *d)
 {
-	local_trylock_init(&d->lock);
+	guard(local_trylock_init)(&d->lock);
 	d->counter = 0;
 }
 
