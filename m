Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCD124C06A
	for <llvm@lists.linux.dev>; Fri, 15 May 2026 12:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778849463; cv=pass; b=Z74//NfpwQlyq3YdrLGWMUHun3B3WTGPVPsZkA6wUYq08YJsHJx9dnRWjCtHDF1eerKTlVf+SamFZg9gGxOjzQ2FlXzt2dY27NwD+N1AvFx87pQXldMvYBVr6btjdQlIc3EfAiMWEZnH9IyTTKByd1mDuYDLVXYKkCLAHA51vGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778849463; c=relaxed/simple;
	bh=DbM81wTDR3/6F/Qk0xF0Vh3HTCGXCUrxe7OFbToxy0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTwFte6Lj1VBF/fRMI/AwZvCOAbv5ZXPxmBkKiAz61BHydTRiC5GPCiq6CJn3vSCho1u2bYXZGZZs5+ZseZWli1+hGcLzBaPaqw73QM6l91HrjSNzcriEeWj8EaFlyirfrynH4tsyq3lfQl4zbv2Pi9B9kWLMVRQUseFIvZHMUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DideiND6; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DideiND6"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-133466cf955so5781814c88.0
        for <llvm@lists.linux.dev>; Fri, 15 May 2026 05:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778849461; cv=none;
        d=google.com; s=arc-20240605;
        b=QwsnxW7XX+y90HMEt9XLPqwC3O2vlZ3qRsrThpFM1F33zWlUQKjckr7auZdbxV6m7l
         gtumebkGn6SR+TF3D+QKuKF+OgDSMYsE9acSEZ6DoH4UinCKxup6v/HMGxuqWSu8OlUl
         ZOCX9a7K5eEsbP/lPspQ4BnWstrztZFUs27BkkVJRetVcuGNjURRtuba6SRKunECpLtD
         OlyOgPwxfeabrCoON24dTHfX1UDYUxizEHQ0IC2XpyJHp+xDnIs/aTSVAn8AIL995Blr
         QImdalKT8Ft1P9U2Mu3oMvHyZT03UA9/aTJOEbczgk+AUeKZZGh9B92BD4zfMxWaqeZr
         By5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xaq1JI3mcrgoJFxkZe1RlgcsVEZcBCsetRlcZ2aei/Y=;
        fh=a9Z631iUwnKDGW0HcryJRCwaeqAZ2TfxaZNqvGTwrv4=;
        b=O59z0Ml0Du7KGcLwh4L/mdLfiAyejbxt7wQAQlE9wWN7u9tw6omuJLWuvd5/spleA5
         vHajrdllnGf4rDEbVwJ8jwgqYpU14i0FLGEumEjsM0V7MEz1mJehS+eeRe/b8w8N1WGQ
         m9TSTLzCZ2LkbuAfJ1CbkDzQeb/Dcov4lnnbK0wJg+uDzrr9/Lvyl4dDFR6yzFcUJ8vS
         Xx+Tp7GR6v6UwAo90Q2uei6zpowPK6ANled4ZOgagPtrf9Ly3bkbab0S/syNq/9BFgeD
         NXRZg+c8sAUeiefpqmlgf6kyl+ioN2XymYhgXvO8cWv7/4f+Rk4m1CI2FRBn5lPoBX50
         fBGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778849461; x=1779454261; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xaq1JI3mcrgoJFxkZe1RlgcsVEZcBCsetRlcZ2aei/Y=;
        b=DideiND6HMe3QIGEgCuO+W8t7K39GRyGhk6AXDyxueCfgYLbKF0RHhiGC0rtWZEHBp
         4hvq0OMM/kgLF4ICrbEZSd0YZMa87OBpM8BduqA334Ve5xtu7TicpiyXRQVVYitJrBmL
         jyuY4K+cdJ8ufkezyUxlAXhT2DALxH6tAruqU4qEF5dP+gpdreD8tT9UoKpnsEMrkE+N
         NmbzcEGo2ojpUdU7yTy6Y/Mgh73QCK0mZf56elaaik81m4nAJ79HOm5eT1ITk1OTZeZw
         wHBlCxJKBS+Ag3bd+qlqGEg6BxWQZJIpb5Kr7ZdHJvizeApm/mROyS2bVte4PCo8wO+h
         RlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778849461; x=1779454261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaq1JI3mcrgoJFxkZe1RlgcsVEZcBCsetRlcZ2aei/Y=;
        b=qnCHopcuwglTXs7KORN/FYbPneEec7ux81cZ/WVJ270YCegr8nRddR1PuvXUthhEZZ
         95GCzXKfaYItE6qAWWBp1ELSTdxwFFf98I0AFdKFX9YpitBeRJVNsZyLeCqgn+VkGssL
         //n8AETKoNYkFmtoEVynCMs3f7Bsg7+1tBB6tTry/q6rfZExf/xl1Wahz91MwMnsGJ/p
         h1jbuIYdLBe9uDw9Ky1XAbyWe0psX5cOJhmXI/wDoTsgWicn2qANcmlVxIHCmU0b5kmZ
         6Tjsq6UyjpxVI+xxLXoj2a0s8dUN9os/MbswlYcEFGMY7sKGb4DQznRH8fjE3TREDFq1
         iEng==
X-Forwarded-Encrypted: i=1; AFNElJ+noV7jUMYlbfFI7unfChEr9Jc/Q1usGpfM/Klqm1Fy7M8Gc510YZnGdAaKXJql7g3WU+gc@lists.linux.dev
X-Gm-Message-State: AOJu0YzIbZvJ9fp/UIu5L0zGWTp30CEKiscDhOn/DE7JVkvlV/dNej1M
	PO0xrDSP7DP5f/Wvy2a/p9EQUhcd4QxwgI/OZvVAFcovlHyFTp0U4JQli8z/mME2qNwrlxLgAdU
	wlz0jeeDlQ2gu0M6WuqSc99vMa73NshvCNcAO/aO0
X-Gm-Gg: Acq92OHATZ/EAl4/NcfcYZNlbnIJTh4xKInhDuk7iREe1/1YdIh3Q1Fu9tL/ZHXhu5P
	2ismDAeAimHbrPCkczCI2HfGQbxo1z8p8ssmOyYcFyc3qHe3EBRsWKl9QCpU8Fcblhjm0A0lbye
	ik3dOrXa96Ng8mMEBlbJbEJLlZNiZ8uiMP2IH0KDavNjD4DBJUAeCjrVLt4d/AKZIESDFvJk5kb
	snbuu698MHHywfoG5H5XrLpQAm47+12QyH/L4Ye7dHspcnNLi3lbYVon1s3NY08c6kNORpPrROc
	/a+HBY7kakBCJOUJxxvysiNukLRMEJuNqIlrdwOI3FDhnth0
X-Received: by 2002:a05:7022:40c:b0:12d:b205:c737 with SMTP id
 a92af1059eb24-1350451e639mr1661849c88.17.1778849460322; Fri, 15 May 2026
 05:51:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260515124426.2227783-1-elver@google.com>
In-Reply-To: <20260515124426.2227783-1-elver@google.com>
From: Marco Elver <elver@google.com>
Date: Fri, 15 May 2026 14:50:22 +0200
X-Gm-Features: AVHnY4KfI7gjW1FWU1I_R6_FqXGPUigyH1QtP-xnzoFQccMefV9K7xL7ErNPIDY
Message-ID: <CANpmjNMOF1Q5=S=8tiqRTUt173NKj8xw2WmSUhecmncBGrOc4A@mail.gmail.com>
Subject: Re: [PATCH tip/locking/core v3] compiler-context-analysis: Bump
 required Clang version to 23
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 15 May 2026 at 14:44, Marco Elver <elver@google.com> wrote:
>
> Clang 23 introduces several major improvements:

Oh, and in case it wasn't clear, Clang 23 has not yet been released
officially, but the dev version is already used by the Intel test
robot, and preview versions may appear at
https://mirrors.edge.kernel.org/pub/tools/llvm/ (courtesy of Nathan).

The release schedule is on https://llvm.org/: "Tue Aug 25th, 2026: 23.1.0".

> 1. Support for multiple arguments in the `guarded_by` and
>    `pt_guarded_by` attributes [1]. This allows defining variables
>    protected by multiple context locks, where read access requires
>    holding at least one lock (shared or exclusive), and write access
>    requires holding all of them exclusively.
>
> 2. Function pointer support [2]. We can now add attributes to function
>    pointers just like we do on normal functions.
>
> 3. A fix to use arrays of locks [3]. Each index is now correctly treated
>    as a separate lock instance.
>
> 4. A fix for implicit member access in attributes [4]. This allows to
>    use __guarded_by(&foo->lock) correctly.
>
> Overall that makes it worthwhile bumping the compiler version instead of
> trying to make both Clang 22 and later work while supporting these new
> features.
>
> Link: https://github.com/llvm/llvm-project/pull/186838 [1]
> Link: https://github.com/llvm/llvm-project/pull/191187 [2]
> Link: https://github.com/llvm/llvm-project/pull/148551 [3]
> Link: https://github.com/llvm/llvm-project/pull/194457 [4]
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
> v3:
> * Rebase and update laundry-list of new features and fixes.
>
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
> index a9317571e6af..8302ebc2ea8c 100644
> --- a/include/linux/compiler-context-analysis.h
> +++ b/include/linux/compiler-context-analysis.h
> @@ -39,12 +39,14 @@
>  # define __assumes_shared_ctx_lock(...)        __attribute__((assert_shared_capability(__VA_ARGS__)))
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
>   *             spinlock_t lock;
>   *             long counter __guarded_by(&lock);
>   *     };
> + *
> + *     struct some_state {
> + *             spinlock_t lock1, lock2;
> + *             long counter __guarded_by(&lock1, &lock2);
> + *     };
>   */
>  # define __guarded_by(...)             __attribute__((guarded_by(__VA_ARGS__)))
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
>   *             spinlock_t lock;
>   *             long *counter __pt_guarded_by(&lock);
>   *     };
> + *
> + *     struct some_state {
> + *             spinlock_t lock1, lock2;
> + *             long *counter __pt_guarded_by(&lock1, &lock2);
> + *     };
>   */
>  # define __pt_guarded_by(...)          __attribute__((pt_guarded_by(__VA_ARGS__)))
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 8ff5adcfe1e0..b0f3028a213d 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -630,7 +630,7 @@ config DEBUG_FORCE_WEAK_PER_CPU
>
>  config WARN_CONTEXT_ANALYSIS
>         bool "Compiler context-analysis warnings"
> -       depends on CC_IS_CLANG && CLANG_VERSION >= 220100
> +       depends on CC_IS_CLANG && CLANG_VERSION >= 230000
>         # Branch profiling re-defines "if", which messes with the compiler's
>         # ability to analyze __cond_acquires(..), resulting in false positives.
>         depends on !TRACE_BRANCH_PROFILING
> @@ -641,7 +641,7 @@ config WARN_CONTEXT_ANALYSIS
>           and releasing user-definable "context locks".
>
>           Clang's name of the feature is "Thread Safety Analysis". Requires
> -         Clang 22.1.0 or later.
> +         Clang 23 or later.
>
>           Produces warnings by default. Select CONFIG_WERROR if you wish to
>           turn these warnings into errors.
> diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
> index 06b4a6a028e0..316f4dfcda65 100644
> --- a/lib/test_context-analysis.c
> +++ b/lib/test_context-analysis.c
> @@ -159,6 +159,10 @@ TEST_SPINLOCK_COMMON(read_lock,
>  struct test_mutex_data {
>         struct mutex mtx;
>         int counter __guarded_by(&mtx);
> +
> +       struct mutex mtx2;
> +       int anyread __guarded_by(&mtx, &mtx2);
> +       int *anyptr __pt_guarded_by(&mtx, &mtx2);
>  };
>
>  static void __used test_mutex_init(struct test_mutex_data *d)
> @@ -219,6 +223,26 @@ static void __used test_mutex_cond_guard(struct test_mutex_data *d)
>         }
>  }
>
> +static void __used test_mutex_multiguard(struct test_mutex_data *d)
> +{
> +       mutex_lock(&d->mtx);
> +       (void)d->anyread;
> +       (void)*d->anyptr;
> +       mutex_unlock(&d->mtx);
> +
> +       mutex_lock(&d->mtx2);
> +       (void)d->anyread;
> +       (void)*d->anyptr;
> +       mutex_unlock(&d->mtx2);
> +
> +       mutex_lock(&d->mtx);
> +       mutex_lock(&d->mtx2);
> +       d->anyread++;
> +       (*d->anyptr)++;
> +       mutex_unlock(&d->mtx2);
> +       mutex_unlock(&d->mtx);
> +}
> +
>  struct test_seqlock_data {
>         seqlock_t sl;
>         int counter __guarded_by(&sl);
> --
> 2.54.0.563.g4f69b47b94-goog
>
