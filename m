Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B862033C532
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 21:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766178218; cv=none; b=CtCq6KUSKDcAy7Ucmk8uVOmgLn3CiDAnT/jO2TmnMhWYsLplzyjn6S2mT5YWs2DJNst7CA2OoFfjCgNjaM981OqGrFdAo5cjcDg3WW1xA8/vcUqF/MIyK6wWaIc5SsIyXL/XD8V6ER9AUNtvCMYLgKcZwxBEzwJDsoTmY1UrvXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766178218; c=relaxed/simple;
	bh=Gv0sx2crcIg2ojZmxyqSmjTC12L5Iz95jTVidDAOXEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RG3uXahLzjIRbuwZpd21H0t06CKkYL734AGeDroWB/QMnbwqz9RxgiTcjHSCwsfSWheEgUxQcBGXq6nNTu4jjATOV5TgD+XHTqaCt+CTe9d3+sZNZ/4BZCoWvOI/tsnPwBx3Nd965BWfmX/sxXZ5f020hXS3BP8OiXkdAk/4cf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SWf70Pbg; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SWf70Pbg"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c1cf2f0523eso1526712a12.3
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 13:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766178214; x=1766783014; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=de8pCxnipY54b0+yxIRceTprHyPFDweXvtkEVQB+6ZQ=;
        b=SWf70PbgfexKWBL7ednzcANNdzGyJY7+7DCvRqVx+zQxVD+gkZRRlw5FFdvYXHCyLY
         Q2RQr4YtkoDWanwBcLngNfYKBdhCR2s3PK9CkP425bcL5DzyIeuQeyrQsEYNiWticUrK
         i2Ti6DOY+6x5tm6maFHJuLlxeezze39qGALCV5BdApd6tglj501sWfZUB5pzaHQL6aYi
         TVccL3bz18rFGwRRN3zUGDJgFPWO8svxICgq0xuwB363A2t+H0QBbP1LbbCeCBeOsPhu
         xlEiUwugy+5mVUccUacbUobEZn5lTsBwW68hWF+PS7LPtNgVEdwMHcSM3dmnlCd087hm
         M4WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766178214; x=1766783014;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=de8pCxnipY54b0+yxIRceTprHyPFDweXvtkEVQB+6ZQ=;
        b=fPWr2GuM10iG3m8tNf0idwQA11uqNwHb49kAWyTvjjOJD6a0oQFPYPdla7baHGkrSG
         wHYMwTbbgaqmu6pB0e9Hhk9x3uonzvov1hFy/s9apyfEp6+589pj34ljadfV/geCPaZW
         N2G5djsvu+yp1yzinIKKDjPnK2fq38PsJHoMhdD0Hv4Kf2Fz2aJgb55YgkfAx9XUxw1r
         fTONNi1kanJc6IfcE7kVRum3mbV6S71EeC4g//HXWJDYmeEHVD0MAsEdqDbgGaLYD4aJ
         g2v/6foZVM8MnPKAHOliBqIzhoaUP167e2uqyacKy5rilNf/ZGgjbaCExQvZIqmD5rqP
         lvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVyRXzaalxRR3BCWkbNZuBt8FQEHljINZpYGLVQG7mZTLbFDm7i3uqew+5Ra0Ig1hrm1Q/@lists.linux.dev
X-Gm-Message-State: AOJu0YyezGbXEtQDTgLl6A1F1SmR/gjUoHBQeOSmvDWDNDyVB5ubp+oJ
	UYfjivgiNmorqR/1tN5WIp/n+MieJt2T+QcPVqYuxvTJMl7XDmkiy4vE2PqyRbaRdIWZPc+TZpT
	fvfY+14KrpzzTx52bjLHVpB0bipwtSDGMADO5VgUP
X-Gm-Gg: AY/fxX6nmuJ1fRZdk4pZKjiR3ENumc/lWozIGPX2L2jyZmxYvpqDpB1dg833ppM8VPM
	3hZn036rdK4Xri/5yopVwMAzFNV2ygrSQgnpxf1C58jv6OLMGPj+bnPG7mUqwZ46zu2SlnXs7qs
	V+3TK3aPN4ebMCCnjFlRY/cQLG/AHxGZ3lqEFD9D18rwsQJAoihq+fYP49Q6Hbl0G5VdLZOhIcs
	2BIvWhM6b2xM6HiruFwF4TsQiOIjtltTvs/5k6hST5m/pv8oKvW/4bZhBi+eEmSmfj3J/Qg05ia
	AhOYxn+RzaVFOR/7RUzCTpwSX2Q=
X-Google-Smtp-Source: AGHT+IFg+H7bSZfFX25VI1D2TcRvhiMGdeLrAoERYZ7E84os+Kz9RUi2WSmTBrf46N46WhW85ro17M8H8dzWFnHpZdU=
X-Received: by 2002:a05:7022:150d:b0:11c:e661:2590 with SMTP id
 a92af1059eb24-121722ba459mr3928518c88.20.1766178213442; Fri, 19 Dec 2025
 13:03:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-9-elver@google.com>
 <17723ae6-9611-4731-905c-60dab9fb7102@acm.org>
In-Reply-To: <17723ae6-9611-4731-905c-60dab9fb7102@acm.org>
From: Marco Elver <elver@google.com>
Date: Fri, 19 Dec 2025 22:02:57 +0100
X-Gm-Features: AQt7F2r1zeH05SJ6k_ASDq36JbXz12zcm_odE6qCh7vpVVaB3K5VKsjzaangmPo
Message-ID: <CANpmjNO0B_BBse12kAobCRBK0D2pKkSu7pKa5LQAbdzBZa2xcw@mail.gmail.com>
Subject: Re: [PATCH v5 08/36] locking/rwlock, spinlock: Support Clang's
 context analysis
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

On Fri, 19 Dec 2025 at 21:26, Bart Van Assche <bvanassche@acm.org> wrote:
> On 12/19/25 7:39 AM, Marco Elver wrote:
> > - extern void do_raw_read_lock(rwlock_t *lock) __acquires(lock);
> > + extern void do_raw_read_lock(rwlock_t *lock) __acquires_shared(lock);
>
> Given the "one change per patch" rule, shouldn't the annotation fixes
> for rwlock operations be moved into a separate patch?
>
> > -typedef struct {
> > +context_lock_struct(rwlock) {
> >       arch_rwlock_t raw_lock;
> >   #ifdef CONFIG_DEBUG_SPINLOCK
> >       unsigned int magic, owner_cpu;
> > @@ -31,7 +31,8 @@ typedef struct {
> >   #ifdef CONFIG_DEBUG_LOCK_ALLOC
> >       struct lockdep_map dep_map;
> >   #endif
> > -} rwlock_t;
> > +};
> > +typedef struct rwlock rwlock_t;
>
> This change introduces a new globally visible "struct rwlock". Although
> I haven't found any existing "struct rwlock" definitions, maybe it's a
> good idea to use a more unique name instead.

This doesn't actually introduce a new globally visible "struct
rwlock", it's already the case before.
An inlined struct definition in a typedef is available by its struct
name, so this is not introducing a new name
(https://godbolt.org/z/Y1jf66e1M).

> > diff --git a/include/linux/spinlock_api_up.h b/include/linux/spinlock_api_up.h
> > index 819aeba1c87e..018f5aabc1be 100644
> > --- a/include/linux/spinlock_api_up.h
> > +++ b/include/linux/spinlock_api_up.h
> > @@ -24,68 +24,77 @@
> >    * flags straight, to suppress compiler warnings of unused lock
> >    * variables, and to add the proper checker annotations:
> >    */
> > -#define ___LOCK(lock) \
> > -  do { __acquire(lock); (void)(lock); } while (0)
> > +#define ___LOCK_void(lock) \
> > +  do { (void)(lock); } while (0)
>
> Instead of introducing a new macro ___LOCK_void(), please expand this
> macro where it is used ((void)(lock)). I think this will make the code
> in this header file easier to read.

If I recall right, we needed this to generalize __LOCK(),
__LOCK_IRQ(), etc. which do preempt_disable(), local_irq_disable() in
the right way, but then need to make sure we call the right
acquire/release helper, which require different cases depending on the
lock kind. Obviously we could just expand all the macros below, but
the current pattern tried to not rewrite this altogether.

There's probably a way this can all be simplified for UP, but maybe a
separate patch. I'd leave it to the locking maintainers which way they
prefer to go.

>     > -#define __LOCK(lock) \
> > -  do { preempt_disable(); ___LOCK(lock); } while (0)
> > +#define ___LOCK_(lock) \
> > +  do { __acquire(lock); ___LOCK_void(lock); } while (0)
>
> Is the macro ___LOCK_() used anywhere? If not, can it be left out?

Yes, it's the default case if __VA_ARGS__ is empty.

> > -#define __LOCK_BH(lock) \
> > -  do { __local_bh_disable_ip(_THIS_IP_, SOFTIRQ_LOCK_OFFSET); ___LOCK(lock); } while (0)
> > +#define ___LOCK_shared(lock) \
> > +  do { __acquire_shared(lock); ___LOCK_void(lock); } while (0)
>
> The introduction of the new macros in this header file make the changes
> hard to follow. Please consider splitting the changes for this header
> file as follows:
> * A first patch that splits ___LOCK() into ___LOCK_exclusive() and
>    ___LOCK_shared().
> * A second patch with the thread-safety annotation changes
>    (__acquire() -> __acquire_shared()).

I've wrangled with this maze of interdependent macros and definitions
for days (though that was earlier in the year), believe me when I say
I tried to split it up. I think the commit message hints at this:

> Add support for Clang's context analysis for raw_spinlock_t,
> spinlock_t, and rwlock. This wholesale conversion is required because
> all three of them are interdependent.

It's like a carefully crafted house of cards: you take one away, the
whole thing breaks apart. If I recall correctly, the main problem was
that as soon as you make one of these a context lock type, and because
they are all interdependent, the compiler will just complain endlessly
about either wrong attributes or incorrectly acquired/released locks
until they are all precisely in the way you see them here.

> >   /* Non PREEMPT_RT kernels map spinlock to raw_spinlock */
> > -typedef struct spinlock {
> > +context_lock_struct(spinlock) {
> >       union {
> >               struct raw_spinlock rlock;
> >
> > @@ -26,7 +26,8 @@ typedef struct spinlock {
> >               };
> >   #endif
> >       };
> > -} spinlock_t;
> > +};
> > +typedef struct spinlock spinlock_t;
>
> Also here, a new global struct name is introduced (spinlock). Maybe the
> name of this new struct should be made more unique?

As above.
