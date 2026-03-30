Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD1A3A1A55
	for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 14:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880584; cv=pass; b=FQSsPClcs9USCly9VWYGiYKJhO0i4ksrLjvMxdRFgLB7FUqPLgerah749ajpA7RamXs64/xtAN4Yhqzm+1v7T29PBfQV6/mieU+L9L5AYYmNOl8oWyIz6gMvF/3yk0R/PPltTLcpRTkRul4kbufi3MfRBdDl26ghOxHkiGS7VHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880584; c=relaxed/simple;
	bh=3+spLPqSq4+Ek/BqQMcIlDteSDi+tNmeqBd5QOGG8CY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsniZ2XtbnevwA06V8ZhG4+eM7YubV4EyzShVRtE/wa7MklwGzfL6L7014I52Tj54LuEOwdwAIv5DKkv3m0t8T6J0k0ZDVnYjOv17UXmHoIZ3vEysFlU+7EOnKsdV7JknkagsFmyJuufSAad46Pqs+HZpqdAyWBsBnrCQH9uTmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rRqlaH9U; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rRqlaH9U"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-128b9b7e3edso3429049c88.0
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 07:23:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774880582; cv=none;
        d=google.com; s=arc-20240605;
        b=F1UQfYJ7HzMwVI60oJ1J4k/zyKZEEfyj2quJRZFrrTRmAyeljvYvIuSneT4/ca/hM4
         gTHauA7lYylWdDfHuKySGqrKXQV4pvdKc92eadqfIFm/vLOenjtJLTdjdVnRi+aaayLX
         zMf9bA4W2TrtEYwnsH/vkH5/Mm64V8vZHbSQ+JG4OyLZNDGG3naa4HjziPWum95mW4lI
         YN9Mvr2Z0TeFshh6vi5GdwG2pY+Qax508bXgLeikNVMinKpcB0Hgg/j2pb5UYLdttaUy
         c3zaouhBWEOc5cwJafFilMNsxJv1b7gsefVsC+JMYLCcZOA7vFk+J9vtd0RGgToR+rqZ
         J2oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fs+vNtBq4yM8jaXTLXbgwHhyICbh57/ZxTsW93W0+YY=;
        fh=3v9Xkqwdl+KstDHGSxuptLHo4/CmFHl2ruYl8d5smRo=;
        b=RYQ4lqoxm3lkdzstY85eRAp8t72KvgnWMj0c3oWJMY/8mG2FDuaAaCM7wmhkNCQ+y7
         TkDQdTIeMNrcYU7pZ66nTnrw+zx5K3GhnPnGihfqCDWdjsiJ04LAEloHxN4VXU3PYjA7
         GrqT6coQjv0RBFcELiVUvrsSjWeo0sv8ldhtYTJaY80V5iqbJD2J6xXq9DRfCLnUOc3a
         BFJ7j4qTPKyc5WLGnUeVu3P5Jc0CjIIh1Byg2UBnWL2eQluIL4rHOvtq63n1pnIlsqvY
         nTGxScFBt2ocl3t3DVUmEUNMJdWXrn61AjGyA5LAGvSVlg5rs677iUPuHGtxEZ0nx+Ja
         +Drg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774880582; x=1775485382; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fs+vNtBq4yM8jaXTLXbgwHhyICbh57/ZxTsW93W0+YY=;
        b=rRqlaH9UUIYFpEMNNpOSWtPt4j5ZOyy4UsUHNIAq0y3wH3aWea5JBZbJT7ytOMRLeB
         Jqw9wUFnrPPe0WuUt2oMSa7GnDtDRUnwN/R69YrTEuCHur7QpjOS1v1njBT2jSJ22YBQ
         OwXjRfm9qcvFEFNiPf7CyoslUZswZuxuiXrjOmOIpuxUVQwW2FvoD+K+3G0CLNqyvt9I
         2g2RZXabdPkg7zRZdp7yiIYyUmKAM5zFMrIeFF2YXLNA+vmsUqzOCUjUuR8SMzX8HF6L
         OUBRdTkBKWyaHmtRFDdf/GPqacL3Gf7oL0NhFS5fsfPU5CHeg5ZfVI44y80pdvpE1Obz
         hNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880582; x=1775485382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fs+vNtBq4yM8jaXTLXbgwHhyICbh57/ZxTsW93W0+YY=;
        b=i0XMdoBw6HiUQ2X2oDj8bhTPFf0vMBL1Z3oSP5oehObQhfU+tmav5IgTaW+fDw9pef
         jlnBsbLXxfTsLLu7FjRCPzHTcATQuY5APaBh+7yP2iyvq6sn7gBQlWRHfVLw7V6c18Yc
         m6jTU9UIU9ZdzITzj09y9qk/IztkJv0awEMW+TusNslaeZsBEDjPv5qfd9gyWDocFsas
         IPktYlGXTsxiR7+Fdo6fDltRaTn3ccEm6aByPjEJ4URxWV0tXHFaM8RE7lAwMpAV48Qe
         3EP+RRWBCqq89z1hu4vKghPJ/9TYn+AXgMzaujmWheF5fBjOLNY/epvh557Oj9nmfdDH
         yQFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuEKwYEldMCnQISVL+zymrUJM57A198X/xHd+xNf3hyPGa9EibW2BSaOVPRFikV9eayjRQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3lRSew07LPXTAcIOM0aHVA2r3G85xkbU5zvgieS6X8fiksP+h
	aREeAQXYDEWCDCOELh37KZxdh4RrJxMFUgvQ7LR3aiQDuyCFBXLo87Nl1oMjd7rKMAO9BqUyTPi
	38LsGTDeHIBZa+5nXdnXA84WQTWU0MQlVBRks8BLB
X-Gm-Gg: ATEYQzx1kdjOetsvTwo2tuRX8cYwGimpFWGNV7fiGkrFQzNPyfA6vIWlPZOSD/X61a1
	mT5Wd4Wa8O1LwZ5ZVMUvIDIXp1HT4g4BFjZEUk5SIABPfq3mR4H7fZ1hiPfr653gIcvZWvrJzoJ
	/xR1xvcwA5U6r/TxP49vTFrm0EO0oNJIPNwme0OCqOYYKlJLUh5/gZUxvj/a1eqMs9t63yn9K8p
	wKNIlYb6WeSrbZjFByYYCZ6zAwuGUCg7Zu4XQKamHs0fJf4JSdd2EXEYh0o153n1GRmw8O0ApSX
	ElG2P0Rd2ZeoNpfo3tOQP4MLEiWPvamPGNIVxA==
X-Received: by 2002:a05:7022:eacf:b0:123:2c98:f6af with SMTP id
 a92af1059eb24-12ab28cad4bmr7955796c88.14.1774880580925; Mon, 30 Mar 2026
 07:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323153351.1412355-1-elver@google.com> <CANpmjNMo5kX=2B7UTo-gbiBSTAF0JPwWRZNf=KWpRP4tRA2FAg@mail.gmail.com>
 <20260325152000.GG3738786@noisy.programming.kicks-ass.net>
 <acqELlVC6vEeEF-W@elver.google.com> <20260330141824.GC1990358@ax162>
In-Reply-To: <20260330141824.GC1990358@ax162>
From: Marco Elver <elver@google.com>
Date: Mon, 30 Mar 2026 16:22:24 +0200
X-Gm-Features: AQROBzD4BNoYGZ5_h8-1gUbt1CjDQ_dDBgUySdMBkNozgh5zqxk-hJpZKL1kpcQ
Message-ID: <CANpmjNPqHRO6ckSbE-Lpyg+GL27V6risE8s0x-5soGrgQaoZSQ@mail.gmail.com>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Bump required
 Clang version to 23
To: Nathan Chancellor <nathan@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, 
	Bart Van Assche <bvanassche@acm.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 30 Mar 2026 at 16:18, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Mon, Mar 30, 2026 at 04:09:50PM +0200, Marco Elver wrote:
> > Clang 23 introduces support for multiple arguments in the `guarded_by`
> > and `pt_guarded_by` attributes [1]. This allows defining variables
> > protected by multiple context locks, where read access requires holding
> > at least one lock (shared or exclusive), and write access requires
> > holding all of them exclusively.
> >
> > Clang 23 also provides a few other improvements (such as being able to
> > deal with arrays of locks [2]) that make it worthwhile bumping the
> > compiler version instead of trying to make both Clang 22 and later work
> > while supporting these new features.
> >
> > Link: https://github.com/llvm/llvm-project/pull/186838 [1]
> > Link: https://github.com/llvm/llvm-project/pull/148551 [2]
> > Requested-by: Peter Zijlstra <peterz@infradead.org>
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Fair enough. I will upload a new main snapshot to kernel.org to make it
> more accessible to folks for testing.
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks.  I always suspected we'll need to bump the Clang version here,
which is a bit inconvenient for now. But I think it's better to do now
than find odd workarounds in the kernel tree later that we need to
revert.

> > ---
> > v2:
> > * Bump version instead of __guarded_by_any workaround.
> > ---
> >  Documentation/dev-tools/context-analysis.rst |  2 +-
> >  include/linux/compiler-context-analysis.h    | 30 ++++++++++++++------
> >  lib/Kconfig.debug                            |  4 +--
> >  lib/test_context-analysis.c                  | 24 ++++++++++++++++
> >  4 files changed, 49 insertions(+), 11 deletions(-)
> >
> > diff --git a/Documentation/dev-tools/context-analysis.rst b/Documentation/dev-tools/context-analysis.rst
> > index 54d9ee28de98..8e71e1e75b5b 100644
> > --- a/Documentation/dev-tools/context-analysis.rst
> > +++ b/Documentation/dev-tools/context-analysis.rst
> > @@ -17,7 +17,7 @@ features. To enable for Clang, configure the kernel with::
> >
> >      CONFIG_WARN_CONTEXT_ANALYSIS=y
> >
> > -The feature requires Clang 22 or later.
> > +The feature requires Clang 23 or later.
> >
> >  The analysis is *opt-in by default*, and requires declaring which modules and
> >  subsystems should be analyzed in the respective `Makefile`::
> > diff --git a/include/linux/compiler-context-analysis.h b/include/linux/compiler-context-analysis.h
> > index 00c074a2ccb0..1ab2622621c3 100644
> > --- a/include/linux/compiler-context-analysis.h
> > +++ b/include/linux/compiler-context-analysis.h
> > @@ -39,12 +39,14 @@
> >  # define __assumes_shared_ctx_lock(...)      __attribute__((assert_shared_capability(__VA_ARGS__)))
> >
> >  /**
> > - * __guarded_by - struct member and globals attribute, declares variable
> > - *                only accessible within active context
> > + * __guarded_by() - struct member and globals attribute, declares variable
> > + *                  only accessible within active context
> > + * @...: context lock instance pointer(s)
> >   *
> >   * Declares that the struct member or global variable is only accessible within
> > - * the context entered by the given context lock. Read operations on the data
> > - * require shared access, while write operations require exclusive access.
> > + * the context entered by the given context lock(s). Read operations on the data
> > + * require shared access to at least one of the context locks, while write
> > + * operations require exclusive access to all listed context locks.
> >   *
> >   * .. code-block:: c
> >   *
> > @@ -52,17 +54,24 @@
> >   *           spinlock_t lock;
> >   *           long counter __guarded_by(&lock);
> >   *   };
> > + *
> > + *   struct some_state {
> > + *           spinlock_t lock1, lock2;
> > + *           long counter __guarded_by(&lock1, &lock2);
> > + *   };
> >   */
> >  # define __guarded_by(...)           __attribute__((guarded_by(__VA_ARGS__)))
> >
> >  /**
> > - * __pt_guarded_by - struct member and globals attribute, declares pointed-to
> > - *                   data only accessible within active context
> > + * __pt_guarded_by() - struct member and globals attribute, declares pointed-to
> > + *                     data only accessible within active context
> > + * @...: context lock instance pointer(s)
> >   *
> >   * Declares that the data pointed to by the struct member pointer or global
> >   * pointer is only accessible within the context entered by the given context
> > - * lock. Read operations on the data require shared access, while write
> > - * operations require exclusive access.
> > + * lock(s). Read operations on the data require shared access to at least one
> > + * of the context locks, while write operations require exclusive access to all
> > + * listed context locks.
> >   *
> >   * .. code-block:: c
> >   *
> > @@ -70,6 +79,11 @@
> >   *           spinlock_t lock;
> >   *           long *counter __pt_guarded_by(&lock);
> >   *   };
> > + *
> > + *   struct some_state {
> > + *           spinlock_t lock1, lock2;
> > + *           long *counter __pt_guarded_by(&lock1, &lock2);
> > + *   };
> >   */
> >  # define __pt_guarded_by(...)                __attribute__((pt_guarded_by(__VA_ARGS__)))
> >
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 93f356d2b3d9..09e9bd003c70 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -630,7 +630,7 @@ config DEBUG_FORCE_WEAK_PER_CPU
> >
> >  config WARN_CONTEXT_ANALYSIS
> >       bool "Compiler context-analysis warnings"
> > -     depends on CC_IS_CLANG && CLANG_VERSION >= 220100
> > +     depends on CC_IS_CLANG && CLANG_VERSION >= 230000
> >       # Branch profiling re-defines "if", which messes with the compiler's
> >       # ability to analyze __cond_acquires(..), resulting in false positives.
> >       depends on !TRACE_BRANCH_PROFILING
> > @@ -641,7 +641,7 @@ config WARN_CONTEXT_ANALYSIS
> >         and releasing user-definable "context locks".
> >
> >         Clang's name of the feature is "Thread Safety Analysis". Requires
> > -       Clang 22.1.0 or later.
> > +       Clang 23 or later.
> >
> >         Produces warnings by default. Select CONFIG_WERROR if you wish to
> >         turn these warnings into errors.
> > diff --git a/lib/test_context-analysis.c b/lib/test_context-analysis.c
> > index 06b4a6a028e0..316f4dfcda65 100644
> > --- a/lib/test_context-analysis.c
> > +++ b/lib/test_context-analysis.c
> > @@ -159,6 +159,10 @@ TEST_SPINLOCK_COMMON(read_lock,
> >  struct test_mutex_data {
> >       struct mutex mtx;
> >       int counter __guarded_by(&mtx);
> > +
> > +     struct mutex mtx2;
> > +     int anyread __guarded_by(&mtx, &mtx2);
> > +     int *anyptr __pt_guarded_by(&mtx, &mtx2);
> >  };
> >
> >  static void __used test_mutex_init(struct test_mutex_data *d)
> > @@ -219,6 +223,26 @@ static void __used test_mutex_cond_guard(struct test_mutex_data *d)
> >       }
> >  }
> >
> > +static void __used test_mutex_multiguard(struct test_mutex_data *d)
> > +{
> > +     mutex_lock(&d->mtx);
> > +     (void)d->anyread;
> > +     (void)*d->anyptr;
> > +     mutex_unlock(&d->mtx);
> > +
> > +     mutex_lock(&d->mtx2);
> > +     (void)d->anyread;
> > +     (void)*d->anyptr;
> > +     mutex_unlock(&d->mtx2);
> > +
> > +     mutex_lock(&d->mtx);
> > +     mutex_lock(&d->mtx2);
> > +     d->anyread++;
> > +     (*d->anyptr)++;
> > +     mutex_unlock(&d->mtx2);
> > +     mutex_unlock(&d->mtx);
> > +}
> > +
> >  struct test_seqlock_data {
> >       seqlock_t sl;
> >       int counter __guarded_by(&sl);
> > --
> > 2.53.0.1018.g2bb0e51243-goog
