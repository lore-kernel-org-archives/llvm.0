Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9320C1FFC69
	for <llvm@lists.linux.dev>; Tue,  4 Mar 2025 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741088635; cv=none; b=l9ypseVrtkH5mEU9piTJac4Olrk3nZLuW8pvFGSrFGHL4B/lFXMB6m8ehhE5wHHxGPPrP3HOsR5D4+8iBnBftRDMBfChMunh2UIC/T+tuyy8F3xqjee6La6Iuc/a2AE0tRvvi9DT9whXY//9oaOecAoKIyp8z8bNcFeIR8JtgzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741088635; c=relaxed/simple;
	bh=7JMGCeJF/Dp3pl5kzpMvrUbvwzv+GjyKlzt033ZLbrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JyIqcV+lN1RUL2+VPDpHNMkC1FV9PcWMZ33KvFqasbGDfUgM1MBdv7vONZwIoeyLDNmzHTzuhLabGNtk0DpLqjQ9gFIZWPhMo0O+mYM4uNq5ZNCVTVAJgLTy3WNRsEpLxKXldieRjcXChu6Z1ELH9ivQHUDX6ciX2T8KSanohAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HrdHCq32; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HrdHCq32"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22355618fd9so93518455ad.3
        for <llvm@lists.linux.dev>; Tue, 04 Mar 2025 03:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741088633; x=1741693433; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QR5Fe2yNdtUQN8MYBySGOzmABqc40NGzK767K+eex7I=;
        b=HrdHCq32+xjscX7+llIxYHl7m/FuacECP3UEEe10+OSis70rxT9UrSK23v0Y4/K8fW
         M4tH/ATc7vSFzLBMntEyM1f4k8b6ebNMo5FXfO6tmZ8ykhF4B5YoPXsLMvnCpGnpNjk0
         xrz0Bol1wFqF8NjIWf0RPKPIiHOeDt18vHp+BTgwiuwRDPoAbt74IyBJPlI+Fa+y+/2w
         iqVLNcqp+IJGhYGit8zxEbz1Zn1IZxRGVxSgugph7sX593ROhcQHNcR8PSh/Hf3VEXtR
         ITl3XCZG6NGSJENGS77YPPRb+4DFK1MGPnhlEzbD2q3f0KBtD78w9381e2t6bk9q9s34
         gZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741088633; x=1741693433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QR5Fe2yNdtUQN8MYBySGOzmABqc40NGzK767K+eex7I=;
        b=obPWRb2kkGTFbl93GDunkSjGjTagyQZ02HmjIMzzP4RMS+y7h3cc4N+ZwIAYxwr4g5
         faY+6TxxpOw33aw+2agoiwO7aIRvjDhsgTzI8uxINP/kJc9JzsXH6wLli0it6R92jhkq
         wmDvdbHhiWAWmMVPi0fP1ALbqH/cde0jJG5ZGEXLbPQ+BoVqiACYbQ4icVXU/j0LWeOW
         +rR0/l6Askb3Hkrv0+Ov0UYy+OS2gVwauR8S+D6TB2xtysdZ0wXabYLlTYIFqLzJHrOe
         vRVz63UZMdkA83elf75+dccc/wY6zY+F8Ivf7/jd5ZHUKhn0FMXkLF1Ado2X/fm3jli7
         jMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2ro3pEUN8/DXQrLQKPIFcVxcV8JzvPU2GTeIgDKNLsyPg+SECHirDf7UipLoMH87f4YWX@lists.linux.dev
X-Gm-Message-State: AOJu0YwBYC7yORNiabGCBJzv4XVDgCrFzw1BMK8tCxIS552gK/B2Kx49
	kbBHMzLPvSJJ64BXII587zr0x5KsDnlk7bFCBkJZCzft+cFszYccjyr4+k++rtgFmoF3Eb82ZPP
	m1VqbBqfE9jyCgS4rHQ8d9+CsZQIvh3PQI00y
X-Gm-Gg: ASbGnctQuV6KuPNUWLolKCwWRahh5heq4UKcyW6vJ4vgAv4Af4fcpj1Wn8YpxkxN0Qg
	h7pROovltkLXM1kE9EyAjHlVeiSlSHkRBCmWWzUNGCe9fHpd36GPR9h9ekWSqbE0S/D1LdFokSu
	QOU1qNTuWB8mzMHwE4lxKwDU3VCJuL3GQAUIXC7RQ9CDYwGn+T76f80DDj
X-Google-Smtp-Source: AGHT+IEVXXLrKnpkIy+GQHgCDOyqfRoqXWkok7n4CEJmqUNtrw4OipvJO9eUgzweAGOK6LFHiiUO/kAFxvZ/Vg2r6rk=
X-Received: by 2002:a17:903:17cf:b0:215:89a0:416f with SMTP id
 d9443c01a7336-22368fc97c4mr252442495ad.30.1741088632488; Tue, 04 Mar 2025
 03:43:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304092417.2873893-1-elver@google.com> <20250304112114.GE11590@noisy.programming.kicks-ass.net>
In-Reply-To: <20250304112114.GE11590@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Tue, 4 Mar 2025 12:43:15 +0100
X-Gm-Features: AQ5f1Jq8MTV2B3C5aow9x7Sg78yjoK0kjhHzTC3jNgyCezrqQgZfKxcyrD8i65c
Message-ID: <CANpmjNP6N0d0dnGjDUGLeH4FQ2-G5YAuWrSPp+bvDR==0hYykw@mail.gmail.com>
Subject: Re: [PATCH v2 00/34] Compiler-Based Capability- and Locking-Analysis
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

On Tue, 4 Mar 2025 at 12:21, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Mar 04, 2025 at 10:20:59AM +0100, Marco Elver wrote:
>
> > === Initial Uses ===
> >
> > With this initial series, the following synchronization primitives are
> > supported: `raw_spinlock_t`, `spinlock_t`, `rwlock_t`, `mutex`,
> > `seqlock_t`, `bit_spinlock`, RCU, SRCU (`srcu_struct`), `rw_semaphore`,
> > `local_lock_t`, `ww_mutex`.
>
> Wasn't there a limitation wrt recursion -- specifically RCU is very much
> a recursive lock and TS didn't really fancy that?

Yup, I mentioned that in the rcu patch. Make it more prominent in documentation?

> >   - Rename __var_guarded_by to simply __guarded_by. Initially the idea
> >     was to be explicit about if the variable itself or the pointed-to
> >     data is guarded, but in the long-term, making this shorter might be
> >     better.
> >
> >   - Likewise rename __ref_guarded_by to __pt_guarded_by.
>
> Shorter is better :-)
>
> Anyway; I think I would like to start talking about extensions for these
> asap.
>
> Notably I feel like we should have a means to annotate the rules for
> access/read vs modify/write to a variable.
>
> The obvious case is RCU; where holding RCU is sufficient to read, but
> modification requires a 'real' lock. This is not something that can be
> currently expressed.

It can. It distinguishes between holding shared/read locks and
exclusive/read-write locks.

RCU is is a bit special because we also have rcu_dereference() and
rcu_assign_pointer() and such, but in general if you only hold a
"shared capability" e.g. the RCU read lock only, it won't let you
write to __guarded_by variables. Again, the RCU case is special
because updating RCU-guarded can be done any number of ways, so I had
to make rcu_assign_pointer() a bit more relaxed.

But besides RCU, the distinction between holding a lock exclusively or
shared does what one would expect: holding the lock exclusively lets
you write, and holding it shared only lets you only read a
__guarded_by() member.

> The other is the lock pattern I touched upon the other day, where
> reading is permitted when holding one of two locks, while writing
> requires holding both locks.
>
> Being able to explicitly write that in the __guarded_by() annotations is
> the cleanest way I think.

Simpler forms of this are possible if you stack __guarded_by(): you
must hold both locks exclusively to write, otherwise you can only read
(but must still hold both locks "shared", or "shared"+"exclusive").

The special case regarding "hold lock A -OR- B to read" is problematic
of course - that can be solved by designing lock-wrappers that "fake
acquire" some lock, or we do design some extension. We can go off and
propose something to the Clang maintainers, but I fear that there are
only few cases where we need __guarded_by(A OR B). If you say we need
an extension, then we need a list of requirements that we can go and
design a clear and implementable extension.

In general, yes, the analysis imposes additional constraints, and not
all kernel locking patterns will be expressible (if ever). But a lot
of the "regular" code (drivers!) can be opted in today.

Thanks,
-- Marco
