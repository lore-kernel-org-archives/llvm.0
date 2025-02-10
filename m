Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A902566DC
	for <llvm@lists.linux.dev>; Mon, 10 Feb 2025 18:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739211830; cv=none; b=GIXAG7q+XkPzHyJRxgtmB5I5ME1jZ63StwzVqY8B/ZvZAAXIU4ArMtxfeUFYbhpchvhPEPzDiiHIdRQ0MUt9iaFs+IGZTnbHuNwfXRgV9joKrCBj8ozQadRcwtSEDdRlUMhqIEgeSwh02Wd+OnMlHbqxEfhiZpyooV2kWvn4tdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739211830; c=relaxed/simple;
	bh=Miu/trECjtxaQhLI9ymFMWHhU+IK6xkOEhR0bChPAI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0Ran5tvVQwJScouOOIIQ+H2jL15avt3kPHd1XNytOn5RRKvW1D6J55LF9lphbkN6KBZSw2X7VdT+kVDtkrK2/dRXkzudHajclhx+Z67AHDr3pVsbnZMNumhHh5v+2yVXpttKxEThBtTIB31Tvo48oEzyfMU2eBM2jKx86UO4k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NhcWdWb9; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NhcWdWb9"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fa2c1ab145so5879491a91.3
        for <llvm@lists.linux.dev>; Mon, 10 Feb 2025 10:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739211828; x=1739816628; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GHmPYfF8/lSNO+AXa3rKVXqC3Xbb512b0LOODXOyyrk=;
        b=NhcWdWb9q5QUh1Q+q4x0wdRO1UuTZe661M5HiXCadGbCfblNQUO+VZHflh9l/FVzYg
         /WHtbSXb/oxiNBGR+nwb4XdPq7YDFD7Su/bPWwFnrh1RZ5TVY0wv2Dd9a9dohKY3T7a/
         Gb04IeMB4XeFUIpd7mSLbNpQuXAX4t7UZluYPEynoHcJIVPGsa+UK2rxkYKZCAsJZIYD
         gLDKz4AnWHdCQOwlrQM9mxiNl0mMcMExb/vWZ6/qJ4aAOBxz7ZH6s5bJjODl/8yLqfci
         iSzVe8O6uaKteKbptMdnbaipJKfm9s/V6LQ7mlP9x0GocBoLYICIehxdv9iUxejJLQFB
         udwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739211828; x=1739816628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHmPYfF8/lSNO+AXa3rKVXqC3Xbb512b0LOODXOyyrk=;
        b=klRF2LYxSFvNKMk8f31x/GwXZ/sWEMkTAhP8PazPKcSr0FMgy8u2Oa4v1MB/JzRI6K
         G6IY13VOMwZx3hM4eXgYFchXiIu01YUcqkl/9ehmNwIAs8nQ5d/z6tKq9D4znHkqQ+QU
         rVdv8z+82N3XSvrIhrTWvvnddBfNW3KgshY1mHt+DZc0amOZVMH2Fyf1aQHY8Lf4OSA/
         yk3VDwUbNyDf8YRdAGgo0JyK0CoFfXoDn4ZolHLz5/Uz/XqsQzLVFsyB9KcaO8CLAnsZ
         hV3n3HG5N+nbHSyQkwrf3P1WhJsJ6tEFD/eyE9T+h5lHi0oTTBACbn5zqwyivxMNh1I7
         r8UA==
X-Forwarded-Encrypted: i=1; AJvYcCVv+roMIhG5fwTqsymuqv9OqQw3aQZmEIYJQzTS9Qcl4VESRPShPnTfepQshCCZ5WO0LAV8@lists.linux.dev
X-Gm-Message-State: AOJu0YygnZW7N2ILLBp3PkRXa1TzaO+vtE0mtPqnejuxbqgy3rLfjIJL
	8Q9JcmbUHWSncg6I8jH4Vbba9aXHSnFFdp4/4SE+SCJO36fITBgBIkDoKI7CiBIxZNFUn2nv6zv
	FUXAVE9X9/glMI5WV6gRssq5SU6vzOPmKAThq
X-Gm-Gg: ASbGncu5o5ki83ogcZAmM3HM91i+kMOJMObV44vD2SwnGLhGuZmlcxgW1TMQ4O8Bo6u
	So+Zjif3g+vvwW2fTjJuc0GmWRIuaon7bANIBYShlUQLQeKyu6btbOCD4AElbQR0Pon3syaUE8p
	UHRyq4vghfUfZ861/jQgDDL7v83cQ=
X-Google-Smtp-Source: AGHT+IEpjZI+LySUmcGlEa+CW28RWh5CJfAMFDDLShGLLN4xFU3oiMLkaI2j0IpT7DZLL4InHIDC1P6Sa7+hlDf+qGU=
X-Received: by 2002:a17:90b:2ec5:b0:2fa:2252:f438 with SMTP id
 98e67ed59e1d1-2fa2450cf33mr21544870a91.30.1739211828003; Mon, 10 Feb 2025
 10:23:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com> <20250206181711.1902989-9-elver@google.com>
 <e276263f-2bc5-450e-9a35-e805ad8f277b@acm.org>
In-Reply-To: <e276263f-2bc5-450e-9a35-e805ad8f277b@acm.org>
From: Marco Elver <elver@google.com>
Date: Mon, 10 Feb 2025 19:23:11 +0100
X-Gm-Features: AWEUYZmxMGiGlzeQT0LaguR-GUnXW8sHLZhY4gy5ushUKI7JT1xIrRKge8P_UM4
Message-ID: <CANpmjNMfxcpyAY=jCKSBj-Hud-Z6OhdssAXWcPaqDNyjXy0rPQ@mail.gmail.com>
Subject: Re: [PATCH RFC 08/24] lockdep: Annotate lockdep assertions for
 capability analysis
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Feb 2025 at 19:10, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 2/6/25 10:10 AM, Marco Elver wrote:
> > diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
> > index 67964dc4db95..5cea929b2219 100644
> > --- a/include/linux/lockdep.h
> > +++ b/include/linux/lockdep.h
> > @@ -282,16 +282,16 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
> >       do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
> >
> >   #define lockdep_assert_held(l)              \
> > -     lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
> > +     do { lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD); __assert_cap(l); } while (0)
> >
> >   #define lockdep_assert_not_held(l)  \
> >       lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
> >
> >   #define lockdep_assert_held_write(l)        \
> > -     lockdep_assert(lockdep_is_held_type(l, 0))
> > +     do { lockdep_assert(lockdep_is_held_type(l, 0)); __assert_cap(l); } while (0)
> >
> >   #define lockdep_assert_held_read(l) \
> > -     lockdep_assert(lockdep_is_held_type(l, 1))
> > +     do { lockdep_assert(lockdep_is_held_type(l, 1)); __assert_shared_cap(l); } while (0)
>
> These changes look wrong to me. The current behavior of
> lockdep_assert_held(lock) is that it issues a kernel warning at
> runtime if `lock` is not held when a lockdep_assert_held()
> statement is executed. __assert_cap(lock) tells the compiler to
> *ignore* the absence of __must_hold(lock). I think this is wrong.
> The compiler should complain if a __must_hold(lock) annotation is
> missing. While sparse does not support interprocedural analysis for
> lock contexts, the Clang thread-safety checker supports this. If
> function declarations are annotated with __must_hold(lock), Clang will
> complain if the caller does not hold `lock`.
>
> In other words, the above changes disable a useful compile-time check.
> I think that useful compile-time checks should not be disabled.

The assert_capability attribute was designed precisely for assertions
that check at runtime that the lock is held, and delegate to runtime
verification where the static analysis is just not powerful enough. In
the commit description:

Presence of these annotations causes the analysis to assume the
capability is held after calls to the annotated function, and avoid
false positives with complex control-flow; for example, where not all
control-flow paths in a function require a held lock, and therefore
marking the function with __must_hold(..) is inappropriate.

If you try to write code where you access a guarded_by variable, but
the lock is held not in all paths we can write it like this:

struct bar {
  spinlock_t lock;
  bool a; // true if lock held
  int counter __var_guarded_by(&lock);
};
void foo(struct bar *d)
{
   ...
   if (d->a) {
     lockdep_assert_held(&d->lock);
     d->counter++;
   } else {
     // lock not held!
   }
  ...
}

Without lockdep_assert_held() you get false positives, and there's no
other good way to express this if you do not want to always call foo()
with the lock held.

It essentially forces addition of lockdep checks where the static
analysis can't quite prove what you've done is right. This is
desirable over adding no-analysis attributes and not checking anything
at all.
