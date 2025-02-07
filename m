Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58A132C8B
	for <llvm@lists.linux.dev>; Fri,  7 Feb 2025 09:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921857; cv=none; b=clyyQJs3gDNRpz0eRR8CeTVqtBjNaPeIH4szFW3wizAV9zPZ2fs2uTwL+/egqDrp6XrRoOmXJjI4rqzT1EaK4zIq/VowKelzjLKEpyem9xjG1ARpua761wBaD6F4NiriY9N9JYGmWX9x33pVx7VSO84lKZLRGi1NFCC2NyAb1iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921857; c=relaxed/simple;
	bh=DcZStX43QWkfR5u3HFZ/BzIYCBxV2cty6MbV4E+zA/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CsodBWOmloHekpmFgK14pCYN+ia31YntSq9QFhw/j5Tqk4c2fGI6omab+6LrdcJuOxnqSKbDc3H1lX5aToLkxgWnSsdoWbPqHrn/5J6WqTPchbiA8GzKRG6rf/moDNTfaGh1SbDhfDxNxp6yO8vQkHY/+OEQyDesmhbsIn++I/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zdMERQ90; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zdMERQ90"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-21f48ebaadfso21519295ad.2
        for <llvm@lists.linux.dev>; Fri, 07 Feb 2025 01:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738921855; x=1739526655; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RDirK3mhBkbwPEuL8B+oV7JCR8taE0i7p+xewXa9S2U=;
        b=zdMERQ90g5iUU6egb6O+v9Yi8LxkGTt2gGW539lfHbk96lHsccsRRRu+5cicJ+itJX
         HiV/O551/ha7/cZXD7C4lx3Yy8CTms1wqgX3k0zhodrBg5KfOcGo0EZbVUQf3KynWFPY
         aRy9UiykNrUqXQJRCBtR4REY2n0YtcZ2vQCtwAgxntUUOO1clUENiJrozHssq73J/ECi
         GBMnUerqTuyeBuiwOqtBMwf6DID3cbA99VXdLPq4dCXXm+01FOjJ3c32usqFK4Qlt8Hj
         d5k72LJV4v11OK3sEaj6aVUz+CkcFmra/KawutbA5EY2Yj0uqWZTlaTF3YAh37vBWuwW
         S1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738921855; x=1739526655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDirK3mhBkbwPEuL8B+oV7JCR8taE0i7p+xewXa9S2U=;
        b=IQDr3SEI+mDomTebEFPPDfy/zdb+xzA7YH4CoNV7LRYjGL1n6+0HjFijY1aecEg1ud
         rZck4TJ/024GTxyDXPYjQsgeq3tJLv34ZcKCwSNxhJtc72rwyHjgXFDRJ29hCenFYYKW
         pF2ID0epWcnFfeIt9vSUXjL0asMcNu7CnC/jEwq2xUfztI1d45uk5toBO1mwWZnOvnCc
         wNSXwuZe9EUrWlBrdAayvi36Ix07uV7JEfGWtAE9E0BcTRPwqDiLMuWyXUsQh1MmEOPX
         TbrjpF78vhjCaQN1Yf7dBU0BqX98UvYbnhk+iBFAPG5SBayFUDbdOLxjvsZ5ul0pRjpT
         BpzA==
X-Forwarded-Encrypted: i=1; AJvYcCXPg7AT4khBasEjIscUAybllV/o62tRANzX16YWVucrmzZjsRlXHYSOKzYgpjDcdxoWiMxq@lists.linux.dev
X-Gm-Message-State: AOJu0YzOwiqA3lha9GTPEp5l8kUb9A1pM266+H2kcm672vMGbNvp6FoI
	fpNuOeeyUWkkMRYnfaHpPFb0mJnKiEe9hAm+OWFMsyjRs6GjJibcjiTCzYA6FjXOMcOb0JJLN4X
	ATC/dQGp6g+NRZydJVAiVh1PPAxeyVV3gzV0c
X-Gm-Gg: ASbGncugmZzItbfEJ/dK0wz/qWD030BsPTuup7xZEFSYCE4v8Eds5FdtDBBnh78WgrN
	qCi6lkt48huALTbRJcdUbBM8YBMq/COuKcV/eXAoPt02dJl+exdqHeWAW9qqwwJmGk2r3BJYZoV
	qwltxroGujv8VtA5nosk7Egiy2Aa4=
X-Google-Smtp-Source: AGHT+IGtpI60RL6U4oqQIl1xCkyZiOpePhlEFI1F9M8a5wczlR73MReXjWLUiW2MgPhSx2R8ZYzw5o/wmDVYUO+I2GU=
X-Received: by 2002:a17:902:e547:b0:215:5935:7eef with SMTP id
 d9443c01a7336-21f4e6b1204mr47269625ad.22.1738921854968; Fri, 07 Feb 2025
 01:50:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com> <20250206181711.1902989-3-elver@google.com>
 <20250207082832.GU7145@noisy.programming.kicks-ass.net> <Z6XTKTo_LMj9KmbY@elver.google.com>
 <20250207094120.GA7145@noisy.programming.kicks-ass.net>
In-Reply-To: <20250207094120.GA7145@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Fri, 7 Feb 2025 10:50:18 +0100
X-Gm-Features: AWEUYZnQWDpp3VDaOjksp9Zo0oytYCkyAdjXISUfV_jPXxvw0lspyJEb-bEMFNQ
Message-ID: <CANpmjNPfFXjwb1-ou3M6s38w=uXgHioK1d=mMSB3_HjHjV2waw@mail.gmail.com>
Subject: Re: [PATCH RFC 02/24] compiler-capability-analysis: Rename
 __cond_lock() to __cond_acquire()
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 10:41, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Feb 07, 2025 at 10:32:25AM +0100, Marco Elver wrote:
> > On Fri, Feb 07, 2025 at 09:28AM +0100, Peter Zijlstra wrote:
> > > On Thu, Feb 06, 2025 at 07:09:56PM +0100, Marco Elver wrote:
> > > > Just like the pairing of attribute __acquires() with a matching
> > > > function-like macro __acquire(), the attribute __cond_acquires() should
> > > > have a matching function-like macro __cond_acquire().
> > > >
> > > > To be consistent, rename __cond_lock() to __cond_acquire().
> > >
> > > So I hate this __cond_lock() thing we have with a passion. I think it is
> > > one of the very worst annotations possible since it makes a trainwreck
> > > of the trylock code.
> > >
> > > It is a major reason why mutex is not annotated with this nonsense.
> > >
> > > Also, I think very dim of sparse in general -- I don't think I've ever
> > > managed to get a useful warning from between all the noise it generates.
> >
> > Happy to reduce the use of __cond_lock(). :-)
> > Though one problem I found is it's still needed for those complex
> > statement-expression *_trylock that spinlock.h/rwlock.h has, where we
> > e.g. have (with my changes):
> >
> >       #define raw_spin_trylock_irqsave(lock, flags)           \
> >               __cond_acquire(lock, ({                         \
> >                       local_irq_save(flags);                  \
> >                       _raw_spin_trylock(lock) ?               \
> >                       1 : ({ local_irq_restore(flags); 0; }); \
> >               }))
> >
> > Because there's an inner condition using _raw_spin_trylock() and the
> > result of _raw_spin_trylock() is no longer directly used in a branch
> > that also does the unlock, Clang becomes unhappy and complains. I.e.
> > annotating _raw_spin_trylock with __cond_acquires(1, lock) doesn't work
> > for this case because it's in a complex statement-expression. The only
> > way to make it work was to wrap it into a function that has attribute
> > __cond_acquires(1, lock) which is what I made __cond_lock/acquire do.
>
> Does something like:
>
> static inline bool
> _raw_spin_trylock_irqsave(raw_spinlock_t *lock, unsigned long *flags)
>         __cond_acquire(1, lock)
> {
>         local_irq_save(*flags);
>         if (_raw_spin_trylock(lock))
>                 return true;
>         local_irq_restore(*flags);
>         return false;
> }
>
> #define raw_spin_trylock_irqsave(lock, flags) \
>         _raw_spin_trylock_irqsave((lock), &(flags))
>
> work?

Yup it does (tested). Ok, so getting rid of __cond_lock should be doable. :-)
