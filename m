Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B0B22FF24
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 22:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738879359; cv=none; b=YeAv7rPm9u3y1P4ZyrctwM1pRBfvZp5PsTIjiRpYk7pkKpxIQIUyMjhjg2Q7J45alyKW321eIsDppIkfC1ZrSsr6VZN4M6CCMKr3n+7PSFVEUKGhAB5ck/O4qAl6mGb2xYvBTQEkh87IE2bFqfi1JGZ7KIrDutD3oa+qiUOCquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738879359; c=relaxed/simple;
	bh=yhX7RJVwaA+Lpx5zbK94yXYQtEnJwzrvecNure0CHC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OzgZL05nUf0sHdW3v8QNVkMYmSr59LbTv5syYDG0Dqs6+jETQzUTF/+xnjlKLijOtZZZEgFdL0QCUYQSYZf619akpfn/cqEWGUsrb7jehJ93SKcf1R7iTFH/8ASYcvyxm582GZihyXKTe8P5L+5bltq6uHQf8Tr21OC28E4pJvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zEY8wlJh; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zEY8wlJh"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso2315535a91.0
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 14:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738879356; x=1739484156; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+VZ6pc7yhUf3GbCnbHnQECLXNAA4wAPKI9VijFmeNYk=;
        b=zEY8wlJh8X2+2i/q5S72JiM2B6MverUEPLrgv7KcuFXJE48bBJuQ9vLZ0lSYgGxPKt
         Z5px3dEiedrpJHykh8CHopSF/clZgwzN7jpa9IPrXP19SnE8P1Z+ii5yK0MMtZxPMbqe
         ULWnYpqFkKPMHLWdKSC7uO3IaFPEnhNFd2BhZpy0XXNJo4TZ9GzfJCwnVEALQDucj2+E
         3JH8QqWn2lypTHa2+cKeXLJPGoacZhICDqK9x3lxL7ZP+dXdHrlsLzIIGXFt7quOM8cz
         CybVy8wWiY5jprhCJBj4EA+Fg80vt25upBk9wpsA0Gw2ZjuDlMQ10Zlu6t4YKfjl7sy8
         TSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738879356; x=1739484156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VZ6pc7yhUf3GbCnbHnQECLXNAA4wAPKI9VijFmeNYk=;
        b=vKtUMKDQ7i9PTnK4p+YmcUQc5HBSQMqCFsAgIW2MW7effOBKEJQ6itnc8ARlpoSQaI
         mSAtomJlr9Sw5hc5h1FRurmjxLDxoT3S7TCkInd8PqL+ntegfDc6aeZqfHusOUrfVtu+
         ppwYu0jXtWbrIuk9QwW06wNW6G9MyMBH8cZqa3wx9CsgWawckObiRFf+ayCNfIgPZdtS
         5byHIw4B/MInAcHwHmbuMYaPTVxts/1lps3lN5EvW8rcYngZkrOWxXaHxynNHZY8b3CF
         zDzqz1xYp2DrV1HfRZVQpWYwctCy6A5LMLBkeVsrYdRzAlD1kTdQhKw+QsJzZnYcA9vQ
         wHoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiUSaLkX6HmX+WUKw7JeGpjpTC/zIsyWvMQdXVzhu+S3GHHqd4zdkZhevDENUC0cLYPbmo@lists.linux.dev
X-Gm-Message-State: AOJu0YxseZuIjQgmO3BhBVVu9eUYAk8a0pKF6nXF3ccBieQQa5waGUlv
	40sqJLwsUgvYZcGGAlmpb4jDO1BOHIOk8MlwEGVUUXUYePGY1OF1rMR68nvdBKYlDWlY0q+DvNW
	SQxrt0eY0dGYN4VjHtK3u8YkAjN3v786wgcJ/
X-Gm-Gg: ASbGncvVS+WFWzdrzokjFJtOGA59nn320oac2WtULvEKT7YVnkRKAzRVtvwFtxRUWGj
	jy0miS1wlP8E9BN9wJzZE7pyUMvJZSshKSl2/a8QYEuh9anh3ozPsrOmcrtll1RaTS9PoNvOvl0
	+pNvR604ipNKyeP/mj9XzhjPDZD6cL
X-Google-Smtp-Source: AGHT+IHT0gKSH+kblZFLx/Wzk00J8ULB9nNNudVm2CwEFSzub8EVmI8aYK9egI+4TLHMpy13Xtg4Kl5eKF+OeEA9kSk=
X-Received: by 2002:a17:90b:1a91:b0:2ef:949c:6f6b with SMTP id
 98e67ed59e1d1-2f9ffb38596mr8748127a91.13.1738879355643; Thu, 06 Feb 2025
 14:02:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com> <20250206181711.1902989-8-elver@google.com>
 <4ce8f5f2-4196-43e7-88a2-0b5fa2af37fb@acm.org>
In-Reply-To: <4ce8f5f2-4196-43e7-88a2-0b5fa2af37fb@acm.org>
From: Marco Elver <elver@google.com>
Date: Thu, 6 Feb 2025 23:01:59 +0100
X-Gm-Features: AWEUYZnffMY9S6S6so6pFI6Su5ySq6ByivopC2ArucfUZC95P3tyJXAV2JoDeGo
Message-ID: <CANpmjNMGH36vs8K9Z8tnJc=4xSeeQjeZGyhZj5KSUwh0kQ06MQ@mail.gmail.com>
Subject: Re: [PATCH RFC 07/24] cleanup: Basic compatibility with capability analysis
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

On Thu, 6 Feb 2025 at 22:29, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 2/6/25 10:10 AM, Marco Elver wrote:
> > @@ -243,15 +243,18 @@ const volatile void * __must_check_fn(const volatile void *val)
> >   #define DEFINE_CLASS(_name, _type, _exit, _init, _init_args...)             \
> >   typedef _type class_##_name##_t;                                    \
> >   static inline void class_##_name##_destructor(_type *p)                     \
> > +     __no_capability_analysis                                        \
> >   { _type _T = *p; _exit; }                                           \
> >   static inline _type class_##_name##_constructor(_init_args)         \
> > +     __no_capability_analysis                                        \
> >   { _type t = _init; return t; }
>
> guard() uses the constructor and destructor functions defined by
> DEFINE_GUARD(). The DEFINE_GUARD() implementation uses DEFINE_CLASS().
> Here is an example that I found in <linux/mutex.h>:
>
> DEFINE_GUARD(mutex, struct mutex *, mutex_lock(_T), mutex_unlock(_T))
>
> For this example, how is the compiler told that mutex _T is held around
> the code protected by guard()?

DEFINE_GUARD is the generic variant usable for more than just locking
primitives. DEFINE_LOCK_GUARD_X is a specialization of DEFINE_GUARD
intended for locking primitives, all of which should be
capability-enabled.

So I added automatic support for DEFINE_LOCK_GUARD_1 (keeping in mind
the limitations as described in the commit message). All later patches
that introduce support for a locking primitive that had been using
DEFINE_GUARD are switched over to DEFINE_LOCK_GUARD. There's no
additional runtime cost (_T is just a struct containing _T->lock). For
example, the change for mutex [1] switches it to use
DEFINE_LOCK_GUARD_1.

[1] https://lore.kernel.org/all/20250206181711.1902989-12-elver@google.com/

(For every primitive added I have added tests in
test_capability-analysis.c, including testing that the scoped guard()
helpers work and do not produce false positives.)

The RCU patch [15/24] also makes it work for LOCK_GUARD_0, by simply
adding an optional helper macro to declare the attributes for lock and
unlock. There's no need for additional variants of
DEFINE_LOCK_GUARD_X.

Should the need arise to add add annotations for DEFINE_GUARD, we can
introduce DECLARE_GUARD_ATTRS(), similar to
DECLARE_LOCK_GUARD_0_ATTRS() introduced in [15/24]. But it's omitted
because DEFINE_GUARD() can be replaced by DEFINE_LOCK_GUARD for
locking primitives.

In general I wanted to keep the current interface for defining guards
untouched, and keeping it simpler.
