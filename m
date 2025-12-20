Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C689023A9B3
	for <llvm@lists.linux.dev>; Sat, 20 Dec 2025 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766235172; cv=none; b=OPhPAGTIw2GZBEU7cxYXsm+rMdpYAiqesDJto3lG1Y3jMhN0mxoKli+yRhr9+4rAT+cWuKCF2PE7lhSMR+dMMWji0k6pWt/Ra2I++i7VimqbNvZL9odVut9H4XXu+9oa0NFj/YPYk6htOHqJ1UielF1i3UIw1/cPyDLrHP1xpl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766235172; c=relaxed/simple;
	bh=mfOXg447RAZ1jn16CEUFd8WZttm8IVc21yuyK4Wgy4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bPjdSBYpHkt8Kw3+bsnFR/KEiZwVOed1mJ8Thwa+q7gn1qEDarEGhroYHd1QdB+baH/YQFrqfNHr7+VUwnGhfjp3pDYfXoUkwRAG+tw4kvonBBtBBY+puMpBLn1Smg67aoAJO2XKqIJ/fFWS9qm+KVPFS54igpBjT7K+eO/mg2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fuMrm63m; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fuMrm63m"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f102b013fso33198885ad.2
        for <llvm@lists.linux.dev>; Sat, 20 Dec 2025 04:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766235170; x=1766839970; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mbJUZ0xTndCf3VdowDat4Wdfn4Fu9I8D0dKSNYqhcFE=;
        b=fuMrm63muvudvbeBJB+LY/aBKjEd68KqtNphO8Sm6M9LTh6S+YuUui+M/yVjJ9gCNr
         21mRW8I3rPtGhxF/90NJqOCPoM1dLPkd7ygA9b2Qr2reqsNAsvtaLhppIm3gdR/ewvJl
         BRzqzovBokNriWOFvABA6ryQtI39huKQSxUCvvvq4RgqJXsO7Wu6AD7zOqgPRlf1ci5j
         vn17T6lQWAJ2l39tVe9eElO4vO/PC1qY4qFl/Iuo8G7WvMAM/7Bf2D4G+OLqOMzeBomd
         9kjXwN9BchiPX8fqqLiAB21XR/KiL+E4ja5jucBtto2F+uYtB1XRamwB8K32ai3VdpNc
         fgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766235170; x=1766839970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbJUZ0xTndCf3VdowDat4Wdfn4Fu9I8D0dKSNYqhcFE=;
        b=UOOd3QUBcvR37+vW7ycgazN3RvGWH9uLxvKeFmfbOkeXuO6hp+/0FuinvfZkAbe3Z3
         ASv+zLEo+iG4rs4Cbg3pPDZfbuI4ikrYDQtiBrbviixyIFwCXMBL5s9uB59isUgHR3oG
         x5scDtdUCqjgPjmWWW1EEpRLXtvtvn8GlKiq58mfvjhUYj/TpwGD5EqMfTDtRA7ws18E
         cOBiSeJyGaBiHx3kvq1TdX/O2oNVH1EMxftxZFhjj+aKT2kP7EKhdWMq6gZg7cXjCbpG
         5Hi708kUr69JCG1DUrkoueSg9E9471gqxVwr6SmeJejdxthcp3CL5yPVcRnFwnxjFLGO
         U7MA==
X-Forwarded-Encrypted: i=1; AJvYcCWc1nWM4hSX+J4mds9WStGxkNF+0I8ntbtN0rwHZj+NWQQYqE8tlP4K5ZQUtoMtY+99wiFw@lists.linux.dev
X-Gm-Message-State: AOJu0YxE77qx/tnsjtWaBxJVaf+1TZ9jJO9S2O9Eh19EgYL+vCaFoKYi
	OyVH9ZboYVV3+fT0DF6EQoad0fCZhZkmaL8l41zaLssKb2mc4g/9+CUA7z3ncVtLAvUBkAgOFIJ
	WJElrgCX8I81+MFeKQk902UMWLen9KhdZwABo4Ubp
X-Gm-Gg: AY/fxX41wz3X5lDlWyxpd0xJoVzuell/B2W5JFfI80sWM2o7sxzK6B51dUIytaKfVfB
	Dj3ROm4YUDobubXO3ZM2RmQtPsCgivogkbX1rRuTXAKHiivgJeO/GEr5+tdUpmbnWoaNbpOXrI5
	+oJMizyqkPPLShXsAsF3oRoRq0RM1QmluCgQrDo28UdHTHsoPjtNrxkQEpAMsQh+wk/iBw4SvCP
	FiJdaWFm/GaNy7aNmKcds33Hy/0qDDt3awACwp1tKW9jlmEa/Q2mr1lDbETrbc+mA6ndYAbNBz5
	3KkimcI3skBBBTc4fITHGmwR8EM=
X-Google-Smtp-Source: AGHT+IETmgOAcDHbF6MqcLCKTf5epOZwA9tGllY35Ia+ZmQjsZsBscMmnIOEXdoPmuZFimi3nJyivgIHK6DMRk5k25A=
X-Received: by 2002:a05:7022:6722:b0:119:e569:f626 with SMTP id
 a92af1059eb24-121722e0444mr6670285c88.31.1766235169708; Sat, 20 Dec 2025
 04:52:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-18-elver@google.com>
 <81d2defc-8980-4022-a464-3d285aff199c@acm.org>
In-Reply-To: <81d2defc-8980-4022-a464-3d285aff199c@acm.org>
From: Marco Elver <elver@google.com>
Date: Sat, 20 Dec 2025 13:52:13 +0100
X-Gm-Features: AQt7F2oG2tk1HNWJ4txFgkKVTgQOAoxLExF81nhreitjIuVCBm-zQmVADhDjpfw
Message-ID: <CANpmjNMAGYeFK-jYafSihmA+T7wi3zC8Sb4fJ+ZjzDK5jGuMvQ@mail.gmail.com>
Subject: Re: [PATCH v5 17/36] locking/rwsem: Support Clang's context analysis
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Dec 2025 at 21:55, 'Bart Van Assche' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On 12/19/25 7:40 AM, Marco Elver wrote:
> >   static inline void rwsem_assert_held_nolockdep(const struct rw_semaphore *sem)
> > +     __assumes_ctx_lock(sem)
> >   {
> >       WARN_ON(atomic_long_read(&sem->count) == RWSEM_UNLOCKED_VALUE);
> >   }
> >
> >   static inline void rwsem_assert_held_write_nolockdep(const struct rw_semaphore *sem)
> > +     __assumes_ctx_lock(sem)
> >   {
> >       WARN_ON(!(atomic_long_read(&sem->count) & RWSEM_WRITER_LOCKED));
> >   }
> > @@ -119,6 +121,7 @@ do {                                                              \
> >       static struct lock_class_key __key;                     \
> >                                                               \
> >       __init_rwsem((sem), #sem, &__key);                      \
> > +     __assume_ctx_lock(sem);                                 \
> >   } while (0)
>
> Just like as for lockdep.h, I think that the above annotations should be
> changed into __must_hold().

My point is the same: we use it to delegate to dynamic analysis where
we reach the limits of static analysis, to avoid false positives [1].
Code should apply __must_hold() or __guarded_by() to called or
protected variables respectively, which is both cleaner and the
idiomatic way to use all this.

[1] https://lore.kernel.org/all/CANpmjNPp6Gkz3rdaD0V7EkPrm60sA5tPpw+m8Xg3u8MTXuc2mg@mail.gmail.com/
