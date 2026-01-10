Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A443227563
	for <llvm@lists.linux.dev>; Sat, 10 Jan 2026 03:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768015410; cv=none; b=B8qUVeoPfjjTHtD6eLs96EStA4cQ9YBdeZsi4eJ5VFESpgmRuAheAhz1j2r4+1iWGQ1dMTFw+Omu11kzUp/tmtZH260GjpjWz4vkGlD74XnAikVo/kZgZ/3gIuunJdsSsX3SHs5xJVEbJgmfPT9wHGvGQjggRe+aP6U/ngqFJFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768015410; c=relaxed/simple;
	bh=pIOWvWaMtOeKk2tGzz6+GGUr1ULM/ynwPFesUocVqWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mV4bNSte3LS0qJlarnd++IUbMo4vomfeIGiOWuj1RwUDaqcTKE2pSRm4n6HQUU6N99kUTQ/wZ2/BEqvmolC0xdAKXIwe0QFiH45GNcqTJc62ENiyO32AEIvSoEZASCyZUCfQtBUWiAEvxGO/wi3rap2IbRWPthGm3BXKYUTYjZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yYb/rspy; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yYb/rspy"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-42fbc305882so2554633f8f.0
        for <llvm@lists.linux.dev>; Fri, 09 Jan 2026 19:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768015406; x=1768620206; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8mq1TLJDe/+4ZL2ybMlQeyJEwr2YWMjzl9f+SS6lqEM=;
        b=yYb/rspyvq7vq2CNdYXPlqzOD6K7jz6FBeuhe6AASNNoDJIQ+3B4ob3nI/y00qZ7me
         YdUNJgEO3Bk0cJdMo0TViPMJdIKJaAxPjZhcBzpEFWgO6iWEn8ZacvCeRBO8+9esA6sL
         HREMvR4xfqTuzwP4vYfvRLM6DUoi7bTYTYEGwjunWxrquezlVULEc9LhvmyJCB2osUKP
         Q/dTbnaDHxMf/Y3af05qxQeSHS0//1gbj9R+De1YQrNS867luojQl8w6ScT3dhC9lipX
         0P8qjQO9NAcImX1ofjq1HYCdP9lOw+oAEmpp1FwQyEOKMpRy0LW30kP7+A2hX9TyELJq
         5leA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768015406; x=1768620206;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8mq1TLJDe/+4ZL2ybMlQeyJEwr2YWMjzl9f+SS6lqEM=;
        b=sh0qk2Sl2pZXP3m4kTGGGzXmpcT4huEnFsQh50O5F6uGD6NHQ59huy3IMddfszD6p9
         a4rtL7LwbpHTIff8t1nUX6aLm/xxazmwQdGcHSU5SkKHkG5aSPVLVJwsWLG7CaXJ9jB7
         qILpigXaZVXROsDCcgVAPDXxd6tDU/IMg6MtGk54Bbt/9k4Be6NCbdzImz20xhbxyBsC
         bMqbxgBj25yabpx0hPmyfjaXtrclH30yOM0803J9KSzTo7d24lK7RI/aE/d3KveUekei
         tP8m5DeDpyyVa29JZQgJrrbbctnXla9AO3dO4UB64uFJMVG36dWZzOHsFW0iFCVzxUA3
         t3hg==
X-Forwarded-Encrypted: i=1; AJvYcCU1JeTz0VsW7y9+t/Z+JOT/c2GrmHW9P9z1QqXjMSjzInAejWnAtcLNuWs9nz+VT/Vp2uub@lists.linux.dev
X-Gm-Message-State: AOJu0YwT8AiVyK8VUmRgo6e3lrmKR5XzZ9hFcmJrwOKq3CyUkwiLdRYv
	PJegzxA9dKAM5CoVhyBl/7GHvLW1EE0YQQEQrePjcCwCuPP9lZmq7gAQSaMTwDzlUg==
X-Gm-Gg: AY/fxX6R6RRuuFdXoFGkjJA96E6MOabh4fdizxfl9LUvmFAmJYmwv6n8qq963dxmDhX
	vvHvcwslHHahv1rvf+mq4cGqZ2hnAZHlJ4aWFN1WdPuhfwqte3orCm+WKAErE9Xt4M8Ph2Ij3ZV
	hIKD32UeahnXXb81vjb4cEy8O5jxTfRH//QIzyPR3Z0FbWTZ75Vn3nIeT+PP84ilaIAHvTXx3G3
	oBb02/lmf7aAoZnVdYStcvJUce4E9ZB6B8EVwovIHv+LRO3zLutCwiR4wjRGnn7q60MPneIqask
	Dw6iYRVQm1E94cuJG1JFU/BMNh6/j01OdaNaLsU2p3Abl3fmB9OGbJNey1zqXKaUv2sr0CJJp5I
	cyQ2+4kei2a13zeOsuifDKEs9ryUXP95s1u5s6pJ8sbDkQYKEaN3jrgxtuQgD39blAIePA6wGPk
	/vDIngavULHGrHW5XhOxDYvyVPyOhKq/T2voXGIPRalxHTBZs7
X-Google-Smtp-Source: AGHT+IG9MVcoXYErsfPeUV+H1nwvNcE/auehFYm8oxMSVuIuHSa0XoHmpfdrWmRqI4nV3F3yqmQGrg==
X-Received: by 2002:a05:6000:2909:b0:42f:bad9:20c9 with SMTP id ffacd0b85a97d-432c36329f9mr14528086f8f.19.1768015405505;
        Fri, 09 Jan 2026 19:23:25 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:2965:801e:e18a:cba1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee24esm25605099f8f.33.2026.01.09.19.23.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 19:23:24 -0800 (PST)
Date: Sat, 10 Jan 2026 04:23:16 +0100
From: Marco Elver <elver@google.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	Chris Li <sparse@chrisli.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Dmitry Vyukov <dvyukov@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, kasan-dev@googlegroups.com,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-security-module@vger.kernel.org,
	linux-sparse@vger.kernel.org, linux-wireless@vger.kernel.org,
	llvm@lists.linux.dev, rcu@vger.kernel.org
Subject: Re: [PATCH v5 10/36] locking/mutex: Support Clang's context analysis
Message-ID: <aWHGJA8imMgELQrA@elver.google.com>
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-11-elver@google.com>
 <57062131-e79e-42c2-aa0b-8f931cb8cac2@acm.org>
 <aWA9P3_oI7JFTdkC@elver.google.com>
 <20260109060249.GA5259@lst.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109060249.GA5259@lst.de>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Fri, Jan 09, 2026 at 07:02AM +0100, Christoph Hellwig wrote:
> On Fri, Jan 09, 2026 at 12:26:55AM +0100, Marco Elver wrote:
> > Probably the most idiomatic option is to just factor out construction.
> > Clearly separating complex object construction from use also helps
> > readability regardless, esp. where concurrency is involved. We could
> > document such advice somewhere.
> 
> Initializing and locking a mutex (or spinlock, or other primitive) is a
> not too unusual pattern, often used when inserting an object into a
> hash table or other lookup data structure.  So supporting it without
> creating pointless wrapper functions would be really useful.  One thing
> that would be nice to have and probably help here is to have lock
> initializers that create the lock in a held state.

Fair point. Without new APIs, we can fix it with the below patch;
essentially "promoting" the context lock to "reentrant" during
initialization scope. It's not exactly well documented on the Clang
side, but is a side-effect of how reentrancy works in the analysis:
https://github.com/llvm/llvm-project/pull/175267

------ >8 ------

From 9c9b521b286f241f849dcc4f9efbd9582dabd3cc Mon Sep 17 00:00:00 2001
From: Marco Elver <elver@google.com>
Date: Sat, 10 Jan 2026 00:47:35 +0100
Subject: [PATCH] compiler-context-analysis: Support immediate acquisition
 after initialization

When a lock is initialized (e.g. mutex_init()), we assume/assert that
the context lock is held to allow initialization of guarded members
within the same scope.

However, this previously prevented actually acquiring the lock within
that same scope, as the analyzer would report a double-lock warning:

  mutex_init(&mtx);
  ...
  mutex_lock(&mtx); // acquiring mutex 'mtx' that is already held

To fix (without new init+lock APIs), we can tell the analysis to treat
the "held" context lock resulting from initialization as reentrant,
allowing subsequent acquisitions to succeed.

To do so *only* within the initialization scope, we can cast the lock
pointer to any reentrant type for the init assume/assert. Introduce a
generic reentrant context lock type `struct __ctx_lock_init` and add
`__inits_ctx_lock()` that casts the lock pointer to this type before
assuming/asserting it.

This ensures that the initial "held" state is reentrant, allowing
patterns like:

  mutex_init(&lock);
  ...
  mutex_lock(&lock);

to compile without false positives, and avoids having to make all
context lock types reentrant outside an initialization scope.

The caveat here is missing real double-lock bugs right after init scope.
However, this is a classic trade-off of avoiding false positives against
(unlikely) false negatives.

Link: https://lore.kernel.org/all/57062131-e79e-42c2-aa0b-8f931cb8cac2@acm.org/
Reported-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/compiler-context-analysis.h | 12 ++++++++++++
 include/linux/local_lock_internal.h       |  6 +++---
 include/linux/mutex.h                     |  2 +-
 include/linux/rwlock.h                    |  4 ++--
 include/linux/rwlock_rt.h                 |  2 +-
 include/linux/rwsem.h                     |  4 ++--
 include/linux/seqlock.h                   |  2 +-
 include/linux/spinlock.h                  |  8 ++++----
 include/linux/spinlock_rt.h               |  2 +-
 include/linux/ww_mutex.h                  |  2 +-
 lib/test_context-analysis.c               |  3 +++
 11 files changed, 31 insertions(+), 16 deletions(-)

diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
index db7e0d48d8f2..e056cd6e8aaa 100644
--- a/include/linux/compiler-context-analysis.h
+++ b/include/linux/compiler-context-analysis.h
@@ -43,6 +43,14 @@
 # define __assumes_ctx_lock(...)		__attribute__((assert_capability(__VA_ARGS__)))
 # define __assumes_shared_ctx_lock(...)	__attribute__((assert_shared_capability(__VA_ARGS__)))
 
+/*
+ * Generic reentrant context lock type that we cast to when initializing context
+ * locks with __assumes_ctx_lock(), so that we can support guarded member
+ * initialization, but also immediate use after initialization.
+ */
+struct __ctx_lock_type(init_generic) __reentrant_ctx_lock __ctx_lock_init;
+# define __inits_ctx_lock(var) __assumes_ctx_lock((const struct __ctx_lock_init *)(var))
+
 /**
  * __guarded_by - struct member and globals attribute, declares variable
  *                only accessible within active context
@@ -120,6 +128,8 @@
 		__attribute__((overloadable)) __assumes_ctx_lock(var) { }				\
 	static __always_inline void __assume_shared_ctx_lock(const struct name *var)			\
 		__attribute__((overloadable)) __assumes_shared_ctx_lock(var) { }			\
+	static __always_inline void __init_ctx_lock(const struct name *var)				\
+		__attribute__((overloadable)) __inits_ctx_lock(var) { }					\
 	struct name
 
 /**
@@ -162,6 +172,7 @@
 # define __releases_shared_ctx_lock(...)
 # define __assumes_ctx_lock(...)
 # define __assumes_shared_ctx_lock(...)
+# define __inits_ctx_lock(var)
 # define __returns_ctx_lock(var)
 # define __guarded_by(...)
 # define __pt_guarded_by(...)
@@ -176,6 +187,7 @@
 # define __release_shared_ctx_lock(var)		do { } while (0)
 # define __assume_ctx_lock(var)			do { (void)(var); } while (0)
 # define __assume_shared_ctx_lock(var)			do { (void)(var); } while (0)
+# define __init_ctx_lock(var)			do { (void)(var); } while (0)
 # define context_lock_struct(name, ...)		struct __VA_ARGS__ name
 # define disable_context_analysis()
 # define enable_context_analysis()
diff --git a/include/linux/local_lock_internal.h b/include/linux/local_lock_internal.h
index e8c4803d8db4..36b8628d09fd 100644
--- a/include/linux/local_lock_internal.h
+++ b/include/linux/local_lock_internal.h
@@ -86,13 +86,13 @@ do {								\
 			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
 			      LD_LOCK_PERCPU);			\
 	local_lock_debug_init(lock);				\
-	__assume_ctx_lock(lock);				\
+	__init_ctx_lock(lock);					\
 } while (0)
 
 #define __local_trylock_init(lock)				\
 do {								\
 	__local_lock_init((local_lock_t *)lock);		\
-	__assume_ctx_lock(lock);				\
+	__init_ctx_lock(lock);					\
 } while (0)
 
 #define __spinlock_nested_bh_init(lock)				\
@@ -104,7 +104,7 @@ do {								\
 			      0, LD_WAIT_CONFIG, LD_WAIT_INV,	\
 			      LD_LOCK_NORMAL);			\
 	local_lock_debug_init(lock);				\
-	__assume_ctx_lock(lock);				\
+	__init_ctx_lock(lock);					\
 } while (0)
 
 #define __local_lock_acquire(lock)					\
diff --git a/include/linux/mutex.h b/include/linux/mutex.h
index 89977c215cbd..5d2ef75c4fdb 100644
--- a/include/linux/mutex.h
+++ b/include/linux/mutex.h
@@ -62,7 +62,7 @@ do {									\
 	static struct lock_class_key __key;				\
 									\
 	__mutex_init((mutex), #mutex, &__key);				\
-	__assume_ctx_lock(mutex);					\
+	__init_ctx_lock(mutex);						\
 } while (0)
 
 /**
diff --git a/include/linux/rwlock.h b/include/linux/rwlock.h
index 65a5b55e1bcd..7e171634d2c4 100644
--- a/include/linux/rwlock.h
+++ b/include/linux/rwlock.h
@@ -22,11 +22,11 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__rwlock_init((lock), #lock, &__key);			\
-	__assume_ctx_lock(lock);				\
+	__init_ctx_lock(lock);					\
 } while (0)
 #else
 # define rwlock_init(lock)					\
-	do { *(lock) = __RW_LOCK_UNLOCKED(lock); __assume_ctx_lock(lock); } while (0)
+	do { *(lock) = __RW_LOCK_UNLOCKED(lock); __init_ctx_lock(lock); } while (0)
 #endif
 
 #ifdef CONFIG_DEBUG_SPINLOCK
diff --git a/include/linux/rwlock_rt.h b/include/linux/rwlock_rt.h
index 37b387dcab21..1e087a6ce2cf 100644
--- a/include/linux/rwlock_rt.h
+++ b/include/linux/rwlock_rt.h
@@ -22,7 +22,7 @@ do {							\
 							\
 	init_rwbase_rt(&(rwl)->rwbase);			\
 	__rt_rwlock_init(rwl, #rwl, &__key);		\
-	__assume_ctx_lock(rwl);				\
+	__init_ctx_lock(rwl);				\
 } while (0)
 
 extern void rt_read_lock(rwlock_t *rwlock)	__acquires_shared(rwlock);
diff --git a/include/linux/rwsem.h b/include/linux/rwsem.h
index 8da14a08a4e1..6ea7d2a23580 100644
--- a/include/linux/rwsem.h
+++ b/include/linux/rwsem.h
@@ -121,7 +121,7 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__init_rwsem((sem), #sem, &__key);			\
-	__assume_ctx_lock(sem);					\
+	__init_ctx_lock(sem);					\
 } while (0)
 
 /*
@@ -175,7 +175,7 @@ do {								\
 	static struct lock_class_key __key;			\
 								\
 	__init_rwsem((sem), #sem, &__key);			\
-	__assume_ctx_lock(sem);					\
+	__init_ctx_lock(sem);					\
 } while (0)
 
 static __always_inline int rwsem_is_locked(const struct rw_semaphore *sem)
diff --git a/include/linux/seqlock.h b/include/linux/seqlock.h
index 113320911a09..a0670adb4b6e 100644
--- a/include/linux/seqlock.h
+++ b/include/linux/seqlock.h
@@ -816,7 +816,7 @@ static __always_inline void write_seqcount_latch_end(seqcount_latch_t *s)
 	do {								\
 		spin_lock_init(&(sl)->lock);				\
 		seqcount_spinlock_init(&(sl)->seqcount, &(sl)->lock);	\
-		__assume_ctx_lock(sl);					\
+		__init_ctx_lock(sl);					\
 	} while (0)
 
 /**
diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index 396b8c5d6c1b..e50372a5f7d1 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -106,12 +106,12 @@ do {									\
 	static struct lock_class_key __key;				\
 									\
 	__raw_spin_lock_init((lock), #lock, &__key, LD_WAIT_SPIN);	\
-	__assume_ctx_lock(lock);					\
+	__init_ctx_lock(lock);						\
 } while (0)
 
 #else
 # define raw_spin_lock_init(lock)				\
-	do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); __assume_ctx_lock(lock); } while (0)
+	do { *(lock) = __RAW_SPIN_LOCK_UNLOCKED(lock); __init_ctx_lock(lock); } while (0)
 #endif
 
 #define raw_spin_is_locked(lock)	arch_spin_is_locked(&(lock)->raw_lock)
@@ -324,7 +324,7 @@ do {								\
 								\
 	__raw_spin_lock_init(spinlock_check(lock),		\
 			     #lock, &__key, LD_WAIT_CONFIG);	\
-	__assume_ctx_lock(lock);				\
+	__init_ctx_lock(lock);					\
 } while (0)
 
 #else
@@ -333,7 +333,7 @@ do {								\
 do {						\
 	spinlock_check(_lock);			\
 	*(_lock) = __SPIN_LOCK_UNLOCKED(_lock);	\
-	__assume_ctx_lock(_lock);		\
+	__init_ctx_lock(_lock);			\
 } while (0)
 
 #endif
diff --git a/include/linux/spinlock_rt.h b/include/linux/spinlock_rt.h
index 0a585768358f..154d7290bd99 100644
--- a/include/linux/spinlock_rt.h
+++ b/include/linux/spinlock_rt.h
@@ -20,7 +20,7 @@ static inline void __rt_spin_lock_init(spinlock_t *lock, const char *name,
 do {								\
 	rt_mutex_base_init(&(slock)->lock);			\
 	__rt_spin_lock_init(slock, name, key, percpu);		\
-	__assume_ctx_lock(slock);				\
+	__init_ctx_lock(slock);					\
 } while (0)
 
 #define _spin_lock_init(slock, percpu)				\
diff --git a/include/linux/ww_mutex.h b/include/linux/ww_mutex.h
index 58e959ee10e9..ecb5564ee70d 100644
--- a/include/linux/ww_mutex.h
+++ b/include/linux/ww_mutex.h
@@ -107,7 +107,7 @@ context_lock_struct(ww_acquire_ctx) {
  */
 static inline void ww_mutex_init(struct ww_mutex *lock,
 				 struct ww_class *ww_class)
-	__assumes_ctx_lock(lock)
+	__inits_ctx_lock(lock)
 {
 	ww_mutex_base_init(&lock->base, ww_class->mutex_name, &ww_class->mutex_key);
 	lock->ctx = NULL;
diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
index 1c5a381461fc..2f733b5cc650 100644
--- a/lib/test_context-analysis.c
+++ b/lib/test_context-analysis.c
@@ -165,6 +165,9 @@ static void __used test_mutex_init(struct test_mutex_data *d)
 {
 	mutex_init(&d->mtx);
 	d->counter = 0;
+
+	mutex_lock(&d->mtx);
+	mutex_unlock(&d->mtx);
 }
 
 static void __used test_mutex_lock(struct test_mutex_data *d)
-- 
2.52.0.457.g6b5491de43-goog
