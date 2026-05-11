Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B1338332A
	for <llvm@lists.linux.dev>; Mon, 11 May 2026 22:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538558; cv=pass; b=JKVo3ixFBjy4pcRmsfaUj3DTh9iyaHibWFklj8Qv6OuPZN1mi5wNy85QMF1W9exbQ02/sDcKxMGfoVKyQz4epaX8ytLGG3nIU0ccJjqhYt/LG0ymnUAALl/dRNngjBuAUVvlRRwV24kkdVUEV8vTE0TCL899cMfU5IOswEURa9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538558; c=relaxed/simple;
	bh=eM+5+pzZKmkohIsWF1v23kwPe6TmlKS0sLy6SpnYGRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rha0lqNqxhdUHBOwelXyoq8CNK47FKO6xx41xz1bxzJEwXz+IOZB8b3QPiZMJROSPJBSn8xkeR0RWFe0S2vThpD3Mnc4KoG2Jhk+PM3PoeT8Enu+7mUDwxvUsPj5gLLSdNcKc3iCCTPZZ1Rp1lFgNFQVaC6SXxW1h5huEOlouhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lF+09IzG; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lF+09IzG"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1334825de43so93928c88.0
        for <llvm@lists.linux.dev>; Mon, 11 May 2026 15:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778538556; cv=none;
        d=google.com; s=arc-20240605;
        b=HJeM9TDriUnx+duVLAVmJyEnecH6MANOQIs0UKgXTPWUQZdOxCD28npHwiig6uY4dN
         zZhyg/cpy8S1QFmEP0E5fue22VIPHrJWLupE1iF+/VaDogo5zSTQmLRtYYfJ6kOjozHK
         onUYXSC1Ff5OcZ+sDm/RdVtowh93k/Tp71uvKZsXyKdcGfrWIGKUtLrqVoJTRZvJ0z78
         SECP9tehQSJ6ckqWm8nu8s28Tlbn7MxJjPx+iiwStU3GlxvlhoRyp+QR6VbzRgJBtR2R
         SGuqvIwN8fvOU6bnaHzS8qaSfRMPDg7I/Ep9dXdM2/9a1VLm8oODXhSwaGG0C+Bacazb
         kgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V4oo29VLreWnESxsV5abYyQh31RQVIhLX3LU1fMpU/Q=;
        fh=NN9baQJyAxmwvB8Tzh4VbMlRQZLXNjnY5icY4FUEk6M=;
        b=TVzPN+fWCIzvhU1cTWKhQUDCovzdgYnrm+KbpijgoPSVeLBKn1GBz/9Lk78go0O3aN
         xUyVIiNvB5SGjTUrYDZg0PWKXizRt9s4pXtBNmbntT2WzCVcSnCM1Yv+zi56YGp3cXYr
         uRWKHrOrF8O946KLAVrPXFnK1ShX9ITblckOoYMQB8x36A+56lcACizgY6cvShLxWAeQ
         3An4/37trnSXGU80FR63t/ZYGgCMDf/vVp8RkZODgKOJhEnI/UK9++hZBCUa04UXX0Il
         dLuJkRb7J41aZBpDQ5OBjQCJT/9vKaR0DpCMTzJgc2F/oZPu9ZyxQ5ov9XiQEBE+3Ct5
         x//A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778538556; x=1779143356; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V4oo29VLreWnESxsV5abYyQh31RQVIhLX3LU1fMpU/Q=;
        b=lF+09IzGHk5y2qss4mQyinqVWQXfM5bjrUmJfQkYiqsgEzNA/f9S792kmHYsAjCGlq
         bi/pm9e5stooJbQOPA8x3asQKYMFyXZOUo5/eEOuVGjMJOUALrRKsg/EjYJNwV9H5nHv
         SKKJpc24PksdWZh6vidNrSLuS8If82jgFcZLdMV3DLNbsQzASteHb18+q2iO96cY/NIY
         +GCXuXHoxR8EJeP4MeUYCd3bOPFCOCvB2/cN06QuOZGG/fmxnxbhPN/qbLFiGiE13TJs
         SCReyElt/7EESP8k32r81jyZlulPyTlLw9Ch+q5Lm9MifIEXovkk31AGtPGeSNvwl3ox
         ijxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538556; x=1779143356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4oo29VLreWnESxsV5abYyQh31RQVIhLX3LU1fMpU/Q=;
        b=nf9fBHAYrQo9vszjzihQaO2yFqAf5BpTIpNazVgCBmGzd98pbIh2gzgrMcc+TDh3Tg
         JC545erd6qLBaWUW8Sm7C83XEw5XT/ReDgAHc4I1zSDgN/CMlG6ODyob4xm1uimqBB8s
         G2iYil9SUuzeuvSHSgyq/nyw91IfSAVpVgYAe8N6zd7Nrpg3Zu5zpJOd/JTiaIajYRsh
         GFkuNtxUjn02oe6snKZp/mZpL07P8iqAHfc4YWiYPUwjhQ0ZeYelD9KimR+iOj/JTqVa
         Eab5r3+9bYK3HCKEjKcM9mg7Dtc7B+YnyGbiVvRno5uEO15GDYkci0d0/UaXG9cWqKUv
         7rgw==
X-Forwarded-Encrypted: i=1; AFNElJ8FNP7d7eF4V/YDxuitNL2phwnskkx4FO4uuUiMzW8ubq6bD4QmznmX66f/TsigB6cfydE2@lists.linux.dev
X-Gm-Message-State: AOJu0YxfUvGUSowsmcuColO1QPWRZW+vtZ4tHhlvQ4U+5yomF0SirP6V
	k0f0Q4Llza4MPS2WZ3w0GHT0UK6CRKgukgiGq4IQff3mV8oey1/gTKSxBTpMY48uIIHaxNNPk2o
	uS078RiWyFbuPFuc/+H/STniPJXQxGbyL6BTR4r6+
X-Gm-Gg: Acq92OHUOo7e9QXkVlSWMvikBvsMtLGKjVlj6ohn9XNGapH/zDwuiw5LCKUDQnGPEL9
	sgBR/YelpwA1jZa2SJ3VEjVXWlLqA/29nH4nAJA2W3qLuJoIBedhgTC5S4v2oXaidjFd4UtYgRr
	/lsvH3BBB62Y0XTt+TxHbZTkz/a9LU40U0seQCmvAXZ5Kzg/GVcREQBq3KOINyf0KeFyCCw+gyk
	AkaeJ3n4RHJZHw0S69rRnYu4VxKbJVYIjYK3GxWCIsG0H1JIvb0xOr1l/BGljHpbj0SpAl34sVm
	j24LsCEu8TEA+uza2QtXYt4gIfy5hqdqZv8h3sOsgsmGmP4bZMjR8c2Ulucl
X-Received: by 2002:a05:7022:910:b0:11b:9b98:aa4b with SMTP id
 a92af1059eb24-132a7edc646mr6159870c88.6.1778538555340; Mon, 11 May 2026
 15:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323153351.1412355-1-elver@google.com> <CANpmjNMo5kX=2B7UTo-gbiBSTAF0JPwWRZNf=KWpRP4tRA2FAg@mail.gmail.com>
 <20260325152000.GG3738786@noisy.programming.kicks-ass.net> <acqELlVC6vEeEF-W@elver.google.com>
In-Reply-To: <acqELlVC6vEeEF-W@elver.google.com>
From: Marco Elver <elver@google.com>
Date: Tue, 12 May 2026 00:28:39 +0200
X-Gm-Features: AVHnY4J5BtZmQwbzRGpDdDMcjTLJqoitgQp02xg9IMG1SKJyxy9B0qPzi8f45sE
Message-ID: <CANpmjNN4O=W70sAc5gaVkTAFdrGGOW+XBMyuehfz3_QMiT=uCw@mail.gmail.com>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Bump required
 Clang version to 23
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Mar 2026 at 16:09, Marco Elver <elver@google.com> wrote:
>
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

Maybe it's time - function pointer support, multi-arg guarded_by, and
some more bug fixes are already in unreleased clang 23.

FWIW - Bart just sent:
https://lore.kernel.org/all/20260511163100.1887263-3-bvanassche@acm.org/
... using attributes on function pointers, so we'll need to bump if
that gets merged soon.

I expect if we target Linux 7.2, its release may coincide with clang
23's release in August (per llvm.org schedule).

Preferences?

Thanks,
-- Marco

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
> index 93f356d2b3d9..09e9bd003c70 100644
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
> 2.53.0.1018.g2bb0e51243-goog
