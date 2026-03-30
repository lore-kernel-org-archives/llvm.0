Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202A73A4518;
	Mon, 30 Mar 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880309; cv=none; b=cfG0UhOezTDbp84CM/p1YC0L03+zE/bQNPF54QTd45V6RXYxdBEwUaVdAyC0nuCIFnWFX1jKaSDj/C3/DV4ySRJ0g4dRtWURhsqSFiebgbCjMuC7Y7Ljs52raV7khLx7ZUl2cpR0Ba74o1BTkJGjPjsDrHAHKiJEKDaSY1l3WZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880309; c=relaxed/simple;
	bh=FAmodYWETLW48mXuJRfoZx01vfV0as0xnGxbZB/f/Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SpaNyjEPCRpCov716rgdm1e6fJzoPjj+J2j5a8GYO8cL6maTpxWi6QjjgOlzPpEHqN++YeFzZrj41Lev5a4T0tU4jiO9VxXEhJFtJ0CgS8SAZ8tGZtNn/ozsE2kpF49uNUCeWw2E66Mtv9SSr8bFfFTx5eh9pGsZO38J7m1dKdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U32uBhRd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U32uBhRd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F544C4CEF7;
	Mon, 30 Mar 2026 14:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774880309;
	bh=FAmodYWETLW48mXuJRfoZx01vfV0as0xnGxbZB/f/Nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U32uBhRdV7VPnMLsLvvvJI/sFe19DUA5gX/UNVOmPMsxNjhAV/JbXOpeNwIsbOSuz
	 XnMW2TMbplF5wprvek1t/p0+l2at8zT+XSMwSD+M/idh5p5Iv027oIL0uaXE2tIFRd
	 7Bqw8cILh75RiTJZQXIjO3E3ZeyY4UxQURPkl6cccRp40os+5s2iZkPmcja88h3q71
	 dt+QjpHcnmB1PUzY1I3cN/Y5Mt6z7pUp2Wy35yV7bA6BNht7/F7kj/ClkIB/Lf4lm/
	 nk2O69U3SONAiDNy7bB0dmEbMlZw4ri6/8p/2sx0Y++qDdPZ4CfbXRbfvQgpd61swT
	 XhhH+6Xg9ALew==
Date: Mon, 30 Mar 2026 16:18:24 +0200
From: Nathan Chancellor <nathan@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Bump
 required Clang version to 23
Message-ID: <20260330141824.GC1990358@ax162>
References: <20260323153351.1412355-1-elver@google.com>
 <CANpmjNMo5kX=2B7UTo-gbiBSTAF0JPwWRZNf=KWpRP4tRA2FAg@mail.gmail.com>
 <20260325152000.GG3738786@noisy.programming.kicks-ass.net>
 <acqELlVC6vEeEF-W@elver.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acqELlVC6vEeEF-W@elver.google.com>

On Mon, Mar 30, 2026 at 04:09:50PM +0200, Marco Elver wrote:
> Clang 23 introduces support for multiple arguments in the `guarded_by`
> and `pt_guarded_by` attributes [1]. This allows defining variables
> protected by multiple context locks, where read access requires holding
> at least one lock (shared or exclusive), and write access requires
> holding all of them exclusively.
> 
> Clang 23 also provides a few other improvements (such as being able to
> deal with arrays of locks [2]) that make it worthwhile bumping the
> compiler version instead of trying to make both Clang 22 and later work
> while supporting these new features.
> 
> Link: https://github.com/llvm/llvm-project/pull/186838 [1]
> Link: https://github.com/llvm/llvm-project/pull/148551 [2]
> Requested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Marco Elver <elver@google.com>

Fair enough. I will upload a new main snapshot to kernel.org to make it
more accessible to folks for testing.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> v2:
> * Bump version instead of __guarded_by_any workaround.
> ---
>  Documentation/dev-tools/context-analysis.rst |  2 +-
>  include/linux/compiler-context-analysis.h    | 30 ++++++++++++++------
>  lib/Kconfig.debug                            |  4 +--
>  lib/test_context-analysis.c                  | 24 ++++++++++++++++
>  4 files changed, 49 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/dev-tools/context-analysis.rst b/Documentation/dev-tools/context-analysis.rst
> index 54d9ee28de98..8e71e1e75b5b 100644
> --- a/Documentation/dev-tools/context-analysis.rst
> +++ b/Documentation/dev-tools/context-analysis.rst
> @@ -17,7 +17,7 @@ features. To enable for Clang, configure the kernel with::
>  
>      CONFIG_WARN_CONTEXT_ANALYSIS=y
>  
> -The feature requires Clang 22 or later.
> +The feature requires Clang 23 or later.
>  
>  The analysis is *opt-in by default*, and requires declaring which modules and
>  subsystems should be analyzed in the respective `Makefile`::
> diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
> index 00c074a2ccb0..1ab2622621c3 100644
> --- a/include/linux/compiler-context-analysis.h
> +++ b/include/linux/compiler-context-analysis.h
> @@ -39,12 +39,14 @@
>  # define __assumes_shared_ctx_lock(...)	__attribute__((assert_shared_capability(__VA_ARGS__)))
>  
>  /**
> - * __guarded_by - struct member and globals attribute, declares variable
> - *                only accessible within active context
> + * __guarded_by() - struct member and globals attribute, declares variable
> + *                  only accessible within active context
> + * @...: context lock instance pointer(s)
>   *
>   * Declares that the struct member or global variable is only accessible within
> - * the context entered by the given context lock. Read operations on the data
> - * require shared access, while write operations require exclusive access.
> + * the context entered by the given context lock(s). Read operations on the data
> + * require shared access to at least one of the context locks, while write
> + * operations require exclusive access to all listed context locks.
>   *
>   * .. code-block:: c
>   *
> @@ -52,17 +54,24 @@
>   *		spinlock_t lock;
>   *		long counter __guarded_by(&lock);
>   *	};
> + *
> + *	struct some_state {
> + *		spinlock_t lock1, lock2;
> + *		long counter __guarded_by(&lock1, &lock2);
> + *	};
>   */
>  # define __guarded_by(...)		__attribute__((guarded_by(__VA_ARGS__)))
>  
>  /**
> - * __pt_guarded_by - struct member and globals attribute, declares pointed-to
> - *                   data only accessible within active context
> + * __pt_guarded_by() - struct member and globals attribute, declares pointed-to
> + *                     data only accessible within active context
> + * @...: context lock instance pointer(s)
>   *
>   * Declares that the data pointed to by the struct member pointer or global
>   * pointer is only accessible within the context entered by the given context
> - * lock. Read operations on the data require shared access, while write
> - * operations require exclusive access.
> + * lock(s). Read operations on the data require shared access to at least one
> + * of the context locks, while write operations require exclusive access to all
> + * listed context locks.
>   *
>   * .. code-block:: c
>   *
> @@ -70,6 +79,11 @@
>   *		spinlock_t lock;
>   *		long *counter __pt_guarded_by(&lock);
>   *	};
> + *
> + *	struct some_state {
> + *		spinlock_t lock1, lock2;
> + *		long *counter __pt_guarded_by(&lock1, &lock2);
> + *	};
>   */
>  # define __pt_guarded_by(...)		__attribute__((pt_guarded_by(__VA_ARGS__)))
>  
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 93f356d2b3d9..09e9bd003c70 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -630,7 +630,7 @@ config DEBUG_FORCE_WEAK_PER_CPU
>  
>  config WARN_CONTEXT_ANALYSIS
>  	bool "Compiler context-analysis warnings"
> -	depends on CC_IS_CLANG && CLANG_VERSION >= 220100
> +	depends on CC_IS_CLANG && CLANG_VERSION >= 230000
>  	# Branch profiling re-defines "if", which messes with the compiler's
>  	# ability to analyze __cond_acquires(..), resulting in false positives.
>  	depends on !TRACE_BRANCH_PROFILING
> @@ -641,7 +641,7 @@ config WARN_CONTEXT_ANALYSIS
>  	  and releasing user-definable "context locks".
>  
>  	  Clang's name of the feature is "Thread Safety Analysis". Requires
> -	  Clang 22.1.0 or later.
> +	  Clang 23 or later.
>  
>  	  Produces warnings by default. Select CONFIG_WERROR if you wish to
>  	  turn these warnings into errors.
> diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
> index 06b4a6a028e0..316f4dfcda65 100644
> --- a/lib/test_context-analysis.c
> +++ b/lib/test_context-analysis.c
> @@ -159,6 +159,10 @@ TEST_SPINLOCK_COMMON(read_lock,
>  struct test_mutex_data {
>  	struct mutex mtx;
>  	int counter __guarded_by(&mtx);
> +
> +	struct mutex mtx2;
> +	int anyread __guarded_by(&mtx, &mtx2);
> +	int *anyptr __pt_guarded_by(&mtx, &mtx2);
>  };
>  
>  static void __used test_mutex_init(struct test_mutex_data *d)
> @@ -219,6 +223,26 @@ static void __used test_mutex_cond_guard(struct test_mutex_data *d)
>  	}
>  }
>  
> +static void __used test_mutex_multiguard(struct test_mutex_data *d)
> +{
> +	mutex_lock(&d->mtx);
> +	(void)d->anyread;
> +	(void)*d->anyptr;
> +	mutex_unlock(&d->mtx);
> +
> +	mutex_lock(&d->mtx2);
> +	(void)d->anyread;
> +	(void)*d->anyptr;
> +	mutex_unlock(&d->mtx2);
> +
> +	mutex_lock(&d->mtx);
> +	mutex_lock(&d->mtx2);
> +	d->anyread++;
> +	(*d->anyptr)++;
> +	mutex_unlock(&d->mtx2);
> +	mutex_unlock(&d->mtx);
> +}
> +
>  struct test_seqlock_data {
>  	seqlock_t sl;
>  	int counter __guarded_by(&sl);
> -- 
> 2.53.0.1018.g2bb0e51243-goog
