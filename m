Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2109B264F92
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741104373; cv=none; b=XDsTetmuhmf+eHE76xuwuIMPedemf3eyhqJYUEehUE56GcxfFojdl7Rax4WUb14bWDsfDs95UsUeXIJgxqRp/J2b1We9vQF+w8HP6b3tIay3xe/1NiODmyjfOlkxhv+ZRvZWeBfmdwRdrF2O/OE0KPLGheu3i4pqgHAHXi6XLGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741104373; c=relaxed/simple;
	bh=WWkPvNPAsAK/o9BV1/7oCW3olPK1i28GTmpPd97Esgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GfDjzc3Hpgg1oeDEULX9Zk5H+ks3JExjGJ1FjvB9+mQAa6dMwhwoDSJEuR6BeEl26xENC+BSo8rOafuH1uPGf/rjFqQXrrCDTQGCZC/nybXndKUqsEJHvg0DXGd+gMizM2SZTBIWBKKVCPAbOnosOBwB5BkuhVQwUY6YAUlQpSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GOZpWHQm; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GOZpWHQm"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2feaca4e99cso8554939a91.0
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 08:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741104371; x=1741709171; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1t6ivLIoIuftK2f6E0pPM+6bkcWx6f6OEyc75s3kSwQ=;
        b=GOZpWHQmPTyFdpoPvTKwOodg+hR2/9FtlC9ZQG8aSKpoZX+K3UsnjctWWklUfhnY6R
         LqLGgLiRxo8xcocpoNHsBGONkA3Ki5E50PSb4d93MJC2vfTQQLiKxbHoq+2aedE/mQm7
         LWKCct+YwY1nzvwPk4CqPofSOXabTiClhfxsDBGJUQ0oOVemfOu+R0MVxZjA/qQo5jmx
         1ScfPtFoHZyLtAUZ9eMPYbQFNIz8+WmGsO5BQdZKo71R8b6dx1Yae9cJtUXk/wn5M4qX
         wsNQR6+2OssJGJfUhUbIrbwwR3JF4u9QqEExDcWstOP+9eT5I07r1ca7eq6or6NNfJHi
         MEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741104371; x=1741709171;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1t6ivLIoIuftK2f6E0pPM+6bkcWx6f6OEyc75s3kSwQ=;
        b=oZwQ0qrLsaWLVeEqtC5V9o5XEYggcD+vHnjAjBUnHDh/5bYjtcuzGJ9nryHZ9Xs89o
         fgG83qHgGM6ktbf5Th6TANuVPQF8niYTYEAYvNWPJQ0gCOO4JdHi9OAtA5k6MGOB6lOX
         2GWK54OZdzqyRfkFWzGR26o90SACrdykGuJV+mmU7Ns0GsUfXRacBE84x5ePZT1Gdo7L
         nKo+cUtHK2HjbNYbCVKUFGK6frtfokr+qB7M0dmHfB52EZOd2Z9krXsdQEdrncPW0LWQ
         YpZJpNnDnYM5GZPSjxaNetj4uPF0DwRD+DAbe5NCDzGHavuItlqtO0Vz5ZJFWHqtGrAG
         SLDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3qGgtPzUW94X7XhbvpOORsPJT11g6CMxx9MaLJSoj085iRXeCchCqNXUY7ehPIlhLeDw5@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+lFJ+TMcOANXq9SiiP0BO8jQPTKz3Ft4YS1yBpI8bwv4pvR/s
	GGKhAGmXY/Z6+oO7FwecOCuoXt0kU/OgIRbSqsZ00knaCUrw7Mp3kVlxbvnoEI8f5UEGmIfBvOD
	zk411HTcZcDQHuToPUzj7dk+AjC76qOdJGCty
X-Gm-Gg: ASbGncuIi15KoBLSVVDkJU6gD9pwgHF9X16OWRa56ecwsG+PcBV/JDBva1Ib5a72OJB
	xzE2fhWivrks6WoLMw1lSroMJotzpppEdWXD+PKnsPlxch7GRX73mejnK8tL4A0GWuAHjLMgR7y
	nHeH/n9FeWx0WVzshz8QI6m6vWZY7xjv7u4ptajbnqSfp67Z9SD+MJz6Gh
X-Google-Smtp-Source: AGHT+IGC++S0t8n6ETtzwl720fo704PFOyUfTbjjLTjxsG9B6ISbxU7AjY+lsYqZ8bJrf6DliVj8kaBM3qPLyBgfJME=
X-Received: by 2002:a17:90b:1ccd:b0:2ee:c918:cd60 with SMTP id
 98e67ed59e1d1-2febab78da2mr27444913a91.20.1741104371050; Tue, 04 Mar 2025
 08:06:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304092417.2873893-1-elver@google.com> <20250304092417.2873893-3-elver@google.com>
 <20250304152909.GH11590@noisy.programming.kicks-ass.net>
In-Reply-To: <20250304152909.GH11590@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Tue, 4 Mar 2025 17:05:34 +0100
X-Gm-Features: AQ5f1JrbHN1FRthi_aRGgJ-kY7WYoWmU4g-pqTmD_Y1oCMFum9IakZQE8Yg9HXM
Message-ID: <CANpmjNOR=EaPPhnkj+WwV8mDYNuM7fY2r_xdjORv2MGGxxH_0g@mail.gmail.com>
Subject: Re: [PATCH v2 02/34] compiler-capability-analysis: Add infrastructure
 for Clang's capability analysis
To: Peter Zijlstra <peterz@infradead.org>
Cc: "David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Mar 2025 at 16:29, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Mar 04, 2025 at 10:21:01AM +0100, Marco Elver wrote:
>
> > +# define __asserts_cap(var)                  __attribute__((assert_capability(var)))
> > +# define __asserts_shared_cap(var)           __attribute__((assert_shared_capability(var)))
>
> > +     static __always_inline void __assert_cap(const struct name *var)                                \
> > +             __attribute__((overloadable)) __asserts_cap(var) { }                                    \
> > +     static __always_inline void __assert_shared_cap(const struct name *var)                         \
> > +             __attribute__((overloadable)) __asserts_shared_cap(var) { }                             \
>
> Since this does not in fact check -- that's __must_hold(), I would
> suggest renaming these like s/assert/assume/.

Yeah, that's better.

FTR - the "asserts_capability" attribute was originally meant to be
used on runtime functions that check that a lock is held at runtime;
what Clang does underneath is simply adding the given capability/lock
to the held lockset, so no real checking is enforced. In this series
it's used for a lot more than just our lockdep_assert*() helpers, so
the "assert" naming is indeed confusing.

Thanks!
