Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C83845AC;
	Mon, 23 Mar 2026 23:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308516; cv=none; b=W4/Y4w7wcTXE3of2NQzBjAd1lu8Vs/CxDWQ0fdTHLHPZveLEm4fLrSf+TUfr7fwWIh2waB9MF0bIKoZIm4Vbq7YWVAiGUerVnJMpalkWdtMLIWMuCkK/La7Z2q2yhmjb9eJMD/8MDqptjdHO47rxeXeZWTg3WTiW1pSS0pHnTJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308516; c=relaxed/simple;
	bh=C7PXswTCkJfJml/awnquQvaw75Rp23l0S/JeHAOJb/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+oEnhDqArT3ONSuyRdgPPq+Rc9OgWpp23Xhck5tLZ65R33j3RtkwU8pv+tK2mnKjgxmcreaU3zMHh+ui0I9zYraO4E6KY6ljRuQp7UESq1cR45w9THe+t8mXrcoESV5apRPeivB8OvT2mtl652/oe/2Q2fe8mpdjws9Sv9Ocz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rH86pfXi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rH86pfXi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42EB0C4CEF7;
	Mon, 23 Mar 2026 23:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774308516;
	bh=C7PXswTCkJfJml/awnquQvaw75Rp23l0S/JeHAOJb/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rH86pfXieIhHgxan5j5gH9vE0Hjzdo7O0LPdu7vJ9ADqb3F4npX/bKN5jof4I4f2t
	 1R5+3j1gKHFkysXofNvE1LaPjs81VUAjngHo+Qs7YoKMkGmzitDVAU6SXdW3iseP0o
	 9cE/wTlRRf8aHmQfYDpWaU/2oL/xHJIekyeJ2prOLr1D7pKIJ3voi/GN4OEke0F7xt
	 FFagSdYPzDLq5cTQddm/zX0k2U+bcXD3wCfVAZZz7WDInrbqKd+3KF3NZTeDGhGF3z
	 pVXAT1Qc2puZi4Uq9WSjkgLGw7eL7ZEJ9Q9G+0cwmcIWL5lMhDAM7Psc+Yk7jSJtNo
	 x7/FR4t42JX0Q==
Date: Mon, 23 Mar 2026 16:28:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Add support
 for multi-argument guarded_by
Message-ID: <20260323232831.GB4147808@ax162>
References: <20260323153351.1412355-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323153351.1412355-1-elver@google.com>

On Mon, Mar 23, 2026 at 04:33:32PM +0100, Marco Elver wrote:
> Clang 23 introduces support for multiple arguments in the `guarded_by`
> and `pt_guarded_by` attributes [1]. This allows defining variables
> protected by multiple context locks, where read access requires holding
> at least one lock (shared or exclusive), and write access requires
> holding all of them exclusively.
> 
> To use the feature while maintaining compatibility with Clang 22, add
> the `__guarded_by_any()` and `__pt_guarded_by_any()` macros. On Clang 23
> and newer, these expand to the underlying attributes; with older Clang
> versions, they fall back to a no-op (false negatives possible).
> 
> Link: https://github.com/llvm/llvm-project/pull/186838 [1]
> Requested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Marco Elver <elver@google.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

One small comment below.

> ---
>  include/linux/compiler-context-analysis.h | 66 ++++++++++++++++++++---
>  init/Kconfig                              |  5 ++
>  lib/test_context-analysis.c               | 24 +++++++++
>  3 files changed, 87 insertions(+), 8 deletions(-)
> 
> diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
> index 00c074a2ccb0..a0d135e500dd 100644
> --- a/include/linux/compiler-context-analysis.h
> +++ b/include/linux/compiler-context-analysis.h
> @@ -39,8 +39,9 @@
>  # define __assumes_shared_ctx_lock(...)	__attribute__((assert_shared_capability(__VA_ARGS__)))
>  
>  /**
> - * __guarded_by - struct member and globals attribute, declares variable
> - *                only accessible within active context
> + * __guarded_by() - struct member and globals attribute, declares variable
> + *                  only accessible within active context
> + * @x: context lock instance pointer
>   *
>   * Declares that the struct member or global variable is only accessible within
>   * the context entered by the given context lock. Read operations on the data
> @@ -53,11 +54,12 @@
>   *		long counter __guarded_by(&lock);
>   *	};
>   */
> -# define __guarded_by(...)		__attribute__((guarded_by(__VA_ARGS__)))
> +# define __guarded_by(x)		__attribute__((guarded_by(x)))
>  
>  /**
> - * __pt_guarded_by - struct member and globals attribute, declares pointed-to
> - *                   data only accessible within active context
> + * __pt_guarded_by() - struct member and globals attribute, declares pointed-to
> + *                     data only accessible within active context
> + * @x: context lock instance pointer
>   *
>   * Declares that the data pointed to by the struct member pointer or global
>   * pointer is only accessible within the context entered by the given context
> @@ -71,7 +73,53 @@
>   *		long *counter __pt_guarded_by(&lock);
>   *	};
>   */
> -# define __pt_guarded_by(...)		__attribute__((pt_guarded_by(__VA_ARGS__)))
> +# define __pt_guarded_by(x)		__attribute__((pt_guarded_by(x)))
> +
> +/**
> + * __guarded_by_any() - struct member and globals attribute, declares variable
> + *                      only accessible within active contexts
> + * @...: context lock instance pointers
> + *
> + * Declares that the struct member or global variable is protected by multiple
> + * context locks. Write access requires all listed context locks to be held
> + * exclusively; read access requires at least one of them to be held (shared or
> + * exclusive).
> + *
> + * .. code-block:: c
> + *
> + *	struct some_state {
> + *		spinlock_t lock1, lock2;
> + *		long counter __guarded_by_any(&lock1, &lock2);
> + *	};
> + */
> +# ifdef CONFIG_CC_HAS_MULTI_ARG_GUARDED_BY_ATTR
> +#  define __guarded_by_any(...)		__attribute__((guarded_by(__VA_ARGS__)))
> +# else
> +#  define __guarded_by_any(...)
> +# endif
> +
> +/**
> + * __pt_guarded_by_any() - struct member and globals attribute, declares pointed-to
> + *                         data only accessible within active contexts
> + * @...: context lock instance pointers
> + *
> + * Declares that the data pointed to by the struct member pointer or global
> + * pointer is protected by multiple context locks. Write access requires all
> + * listed context locks to be held exclusively; read access requires at least
> + * one of them to be held (shared or exclusive).
> + *
> + * .. code-block:: c
> + *
> + *	struct some_state {
> + *		spinlock_t lock1, lock2;
> + *		long *counter __pt_guarded_by_any(&lock1, &lock2);
> + *	};
> + */
> +# ifdef CONFIG_CC_HAS_MULTI_ARG_GUARDED_BY_ATTR
> +#  define __pt_guarded_by_any(...)		__attribute__((pt_guarded_by(__VA_ARGS__)))
> +# else
> +#  define __pt_guarded_by_any(...)
> +# endif
>  
>  /**
>   * context_lock_struct() - declare or define a context lock struct
> @@ -158,8 +206,10 @@
>  # define __assumes_ctx_lock(...)
>  # define __assumes_shared_ctx_lock(...)
>  # define __returns_ctx_lock(var)
> -# define __guarded_by(...)
> -# define __pt_guarded_by(...)
> +# define __guarded_by(x)
> +# define __pt_guarded_by(x)
> +# define __guarded_by_any(...)
> +# define __pt_guarded_by_any(...)
>  # define __excludes_ctx_lock(...)
>  # define __requires_ctx_lock(...)
>  # define __requires_shared_ctx_lock(...)
> diff --git a/init/Kconfig b/init/Kconfig
> index 444ce811ea67..9f9a800822ff 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -158,6 +158,11 @@ config CC_HAS_BROKEN_COUNTED_BY_REF
>  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
>  	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) = { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
>  
> +config CC_HAS_MULTI_ARG_GUARDED_BY_ATTR
> +	# supported since clang 23
> +	depends on CC_IS_CLANG
> +	def_bool $(success,echo 'typedef int __attribute__((capability("l"))) L; L l1; L l2; int __attribute__((guarded_by(&l1, &l2))) x;' | $(CC) -x c - -c -o /dev/null -Werror)

Include $(CLANG_FLAGS) after $(CC) like the test above to harden against
the weird case when $(CC) does not have the host backend enabled (dumb,
I know, but I have seen it).

> +
>  config LD_CAN_USE_KEEP_IN_OVERLAY
>  	# ld.lld prior to 21.0.0 did not support KEEP within an overlay description
>  	# https://github.com/llvm/llvm-project/pull/130661
> diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
> index 06b4a6a028e0..691fb2d6fc45 100644
> --- a/lib/test_context-analysis.c
> +++ b/lib/test_context-analysis.c
> @@ -159,6 +159,10 @@ TEST_SPINLOCK_COMMON(read_lock,
>  struct test_mutex_data {
>  	struct mutex mtx;
>  	int counter __guarded_by(&mtx);
> +
> +	struct mutex mtx2;
> +	int anyread __guarded_by_any(&mtx, &mtx2);
> +	int *anyptr __pt_guarded_by_any(&mtx, &mtx2);
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
> 
