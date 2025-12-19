Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1068B2F7AD8
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 21:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766179035; cv=none; b=g1F7Ijj2bZd+WFBRGJS3Cf4Tkdw/4Z1g7bJVXpGu1N9XhkP9lUImBX5QEe35U8gMGu9e+zG2/4MSl4BX2whxwRVM2fCV+hrOeF8dQHu259tjcvFEBX3Kq+pHP/t35SZXSuz1snN2I8jQu72/rGQOf/XZMNR8vHwyjT/+PYyl8gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766179035; c=relaxed/simple;
	bh=LLpGwIKkDXp5hVROlTCKeGGUdVbJKYXE3k+8i7znnho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OcS/J758L5lMh9Sv6O6G1Vhv+Ep5o1w9qAWYhUsYI26mit1FABrpfbrHkLgdZbYdEEhBYupmMoaGxPhtbI8CXCUkzN1KX2Sm1yKkpzD88bCzhJjKLl5sqpBbNZWxn+OCjh5BdNwMZ86doBfZpm9/yhW8H2TGv4Thu2HM+5DyU4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Jr+BBuI9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Jr+BBuI9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0d0788adaso19939395ad.3
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 13:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766179033; x=1766783833; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0rK9w1Snx+IiOS1yyTvDXywJSRfl2rZ6jIui6kPmEaA=;
        b=Jr+BBuI9jck3htnkJBTfNnTbEHhvPz3rHApLxyGaswVtD72CAeY0n+zDIsDa7deIF8
         d+1Vt72mozceWy0u0VQjeyjkvYJufD0Qw+E7jmuD4POMTX6AorEUdRAJybW2cgz+4rL8
         njR0RskCjSSjgAUcip1BWcgi1FLJzNHk6vmWYhbyE9Up6Vnh1f0dFu62pj1F7lo2Vh6A
         1LF67RIV/En6F8MswNjby/2hqz3RZ7ab4s6OsEjb6uXPaQiGB4CO4aOC50Q1wPHnCTRT
         rdNgPl31w0KL8bYKvNypPl5jFA8atB28bV7dzqKVK3GbfsjEUG+ixJS+YADbA26GTGFD
         ZDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766179033; x=1766783833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rK9w1Snx+IiOS1yyTvDXywJSRfl2rZ6jIui6kPmEaA=;
        b=ngq31Z75jx8bVbr0i772jEllX4CwIKj6mUi/pryV6gXq2gEgUJh4DZWL9SX4wU1qTs
         4EX2NO5a9S+BhUmAG4LK8xAD4TaSUms70tLUJx8QeaCMotny8VBcx3HA0uIFxDq1kBeE
         N5ARExcBFSTjWaxw3kNp7e+OxRoKkgp6It8ME/Jibq9J231nHfz38e5pHOAhvUxAYGqY
         yi0v1rze0yZudoEbG5/h1PY+chcBPm9a9y7x1vqjyueanK6AN+nNPp/oh18mlVcF9BfO
         7vjmpqWFQwooT7AM8dFy2miJ1m+00KALOw2PNXmZP6eFgHNeUKK0/0bp7gBSWZ0fZc1N
         nzrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQgobPB3L6isUZ0LXPuKeekHWaQGGkrSfhS+QxEUU+hbfUh+f9fdKywzF5KIPMUyXVDPQS@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7Bog1EJUJOHyaC/91V+D5eMvlF9pgwrDdRc5MGkQYPnQdqJXp
	NloOsRx9hjqc3DjE9DXunAU+wZmYjQ6SH7GfJSCrp1HxxtdoJR4ki9m+W6NR+cAkzRlNyNHIyz5
	e45YwSaQBDx8kySZW4KspQ4MrmQTJgYMtouVsvx4c
X-Gm-Gg: AY/fxX4etXBC3+y3anXE0HZhEv12wiF65TpF8ciV27SaTRLWm5JRBJpuq4nkH7R6UFu
	e2dM3DtbN7GDeShsxMPuHzVG1HooEvcxBx7f7GjBFJKsb5IW628Sga35/CsIrWdHzBdN44/fCIC
	qo/yOpwO+/D1JUJkeTCWBJffTnDXlqOWvYfwQv7K+OGCOJHAPPfxzBvt9CDgZ6jE+N26BXKh5Uz
	Fc4euC3fVYl1tcSpIJ3KCGseK2wuKv/W3dm/eekpmhngz+j0cykAHIv2OfQ+sus2lYVLF6icEJK
	f8ca9rpj+wZpLM8tR5EwkaUL94vYG4C2BGN65w==
X-Google-Smtp-Source: AGHT+IHpiDrn99m7x0uN4estdHNLC96nljKxP9R6JbsteT8HXtfNtk+xeDdUnA0onYdjgh5ezU9+Po7MHQlADcjwb9o=
X-Received: by 2002:a05:7022:2586:b0:11d:f037:891c with SMTP id
 a92af1059eb24-12172311ffamr3088830c88.44.1766179032817; Fri, 19 Dec 2025
 13:17:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-8-elver@google.com>
 <cdde6c60-7f6f-4715-a249-5aab39438b57@acm.org>
In-Reply-To: <cdde6c60-7f6f-4715-a249-5aab39438b57@acm.org>
From: Marco Elver <elver@google.com>
Date: Fri, 19 Dec 2025 22:16:36 +0100
X-Gm-Features: AQt7F2oJirW61gdd7JR_kO6v8Pm8LYFzp_d0WJmR_my_E34K94emt-YaA94Rukg
Message-ID: <CANpmjNPJXVtZgT96PP--eNAkHNOvw1MrYzWt5f2aA0LUeK8iGA@mail.gmail.com>
Subject: Re: [PATCH v5 07/36] lockdep: Annotate lockdep assertions for context analysis
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

On Fri, 19 Dec 2025 at 21:54, 'Bart Van Assche' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On 12/19/25 7:39 AM, Marco Elver wrote:
> > diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
> > index dd634103b014..621566345406 100644
> > --- a/include/linux/lockdep.h
> > +++ b/include/linux/lockdep.h
> > @@ -282,16 +282,16 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
> >       do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
> >
> >   #define lockdep_assert_held(l)              \
> > -     lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
> > +     do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assume_ctx_lock(l); } while (0)
> >
> >   #define lockdep_assert_not_held(l)  \
> >       lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
> >
> >   #define lockdep_assert_held_write(l)        \
> > -     lockdep_assert(lockdep_is_held_type(l, 0))
> > +     do { lockdep_assert(lockdep_is_held_type(l, 0)); __assume_ctx_lock(l); } while (0)
> >
> >   #define lockdep_assert_held_read(l) \
> > -     lockdep_assert(lockdep_is_held_type(l, 1))
> > +     do { lockdep_assert(lockdep_is_held_type(l, 1)); __assume_shared_ctx_lock(l); } while (0)
> >
> >   #define lockdep_assert_held_once(l)         \
> >       lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
> > @@ -389,10 +389,10 @@ extern int lockdep_is_held(const void *);
> >   #define lockdep_assert(c)                   do { } while (0)
> >   #define lockdep_assert_once(c)                      do { } while (0)
> >
> > -#define lockdep_assert_held(l)                       do { (void)(l); } while (0)
> > +#define lockdep_assert_held(l)                       __assume_ctx_lock(l)
> >   #define lockdep_assert_not_held(l)          do { (void)(l); } while (0)
> > -#define lockdep_assert_held_write(l)         do { (void)(l); } while (0)
> > -#define lockdep_assert_held_read(l)          do { (void)(l); } while (0)
> > +#define lockdep_assert_held_write(l)         __assume_ctx_lock(l)
> > +#define lockdep_assert_held_read(l)          __assume_shared_ctx_lock(l)
> >   #define lockdep_assert_held_once(l)         do { (void)(l); } while (0)
> >   #define lockdep_assert_none_held_once()     do { } while (0)
>
> I think these macros should use __must_hold() instead of __assume...().
> lockdep_assert_held() emits a runtime warning if 'l' is not held. Hence,
> I think that code where lockdep_assert_held() is used should not compile
> if it cannot be verified at compile time that 'l' is held.

That's not the purpose of this - if a function or variable should have
a lock held, we mark them explicitly with __must_hold() or
__guarded_by(), and we don't really need to use lockdep_assert,
because the compiler helped us out. In an ideal world, every function
or variable that requires a lock held is annotated, and we don't need
to ever worry about explicitly checking if a lock is held (but we'll
be far from that for a while).

The purpose is described in the commit message:

> Presence of these annotations causes the analysis to assume the context
> lock is held after calls to the annotated function, and avoid false
> positives with complex control-flow; [...]

It's basically an escape hatch to defer to dynamic analysis where the
limits of the static analysis are reached. This is also the original
purpose of the "assert"/"assume" attributes:
https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#assert-capability-and-assert-shared-capability

Without this escape hatch, and deferral to dynamic analysis, we'd be
stuck in some cases.
