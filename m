Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E674C1EF09C
	for <llvm@lists.linux.dev>; Thu, 20 Feb 2025 22:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740089504; cv=none; b=sOfPVkpAU7iYLNo59vEzrCTVYbtNCaR9I0JD9bE3jHJiSdMLinCK+/JGRaZ01E859t3O/JIRiurTOegch3A0jXdsXZwScwbaTXwEGV1eiixuyr+DfuPWF2sc13asBbcZ2Liy7eOeSlBFsAQTg7c/DrJl5QXylTtUm+G9LKuW26U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740089504; c=relaxed/simple;
	bh=XoQ9YNrhSqddyyvTwy9PGAcc33M/ALNhUIP4UPWv6bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTct2+prdEPunhQyI8IiSeKYfiMhodPZWJiOpwexva19+a/CpO1Gv4Z9GC3dM/DT4jkN5doHdPMLqI8g+6XlJNhgbdHDYMMkxnRqb4VI+pvsfqOMhOwSWEsBKi/8shyLueR5adCzXgg9rOH++POVqYNHnTruNJR1TGHdY8wIUes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rzLxuNnT; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rzLxuNnT"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2f83a8afcbbso2622898a91.1
        for <llvm@lists.linux.dev>; Thu, 20 Feb 2025 14:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740089502; x=1740694302; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uxsIjlZZ4NvCMtUBbUKBaSillRpgb0iDSMQ6jrfUP4s=;
        b=rzLxuNnTt3uQ4QJqrGQyEZwfZGve188Kht2zNUISWm3feYCEIMPSDqzQRifZchmRXV
         68msbe9SzY6a48OajgtUAx7tcd/mIBKOOe8cSI5N29n9XWObOFOqsBiqU674sgfAOIil
         qYocEPYX+D5UQSEhm1VFyr219PbEDemFh/SDIUe2cUT9p2DmMZi/MBGYp7IveEjvubqa
         Xy7OsAcvRHs9pHIAnsVwmQWwQv0nDbTLU3AHJ78+xt9F4nbAj+eko3dPyqTxfs/FCDc7
         XKgEDF+pdetdeHze/xLR2X1vDgZl+sJ5D3ab3luIKqQNbs4Q+VakrAM0KglSPMtF6WFz
         yRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740089502; x=1740694302;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxsIjlZZ4NvCMtUBbUKBaSillRpgb0iDSMQ6jrfUP4s=;
        b=e2r3zyUX4DiHMozTeFofe2Z/xx0ZbTB+uiTK6T+0pYId4MP1LtreKBlH10mCDCu9Sb
         ffOwXSm8eI+QowtBDiH7q3a5392az0fP6zjHX4Ym2G5rBeOVRKSi6mEsfmcUdrIUWq6I
         NzrsaUngOgTfQT485vDOvp3rm+1YH8QoTehjdSuFC9MGqvFIklTbTC7yV9RzD0CAAmgT
         XY+ERvPrI268Ior+FgSHvrTd+N374j5ZTWxKrVr5Fr9v2TvGd2/52p5DXcK5DnPh4980
         IjEh8qHJhdcVdvWQIOwPK0l53DYapxzwnT9Gef6hAsaNPAYhF078+EbmXgwiLzNIKn1Z
         KPUg==
X-Forwarded-Encrypted: i=1; AJvYcCV8qgUzrLN3rG2sG9B79VcO5W5dU9Bo6Og78burqAZ49zoxaw+QX2wB+/TrRPOAZAdi+Q2b@lists.linux.dev
X-Gm-Message-State: AOJu0YznQfBBozdxxWym/evXrRHkrPsM5Dm+JoOsdarvzCDhUfYWzL6x
	GoFTIJd/P1Ae58KGt9tTh6ElozanEggKpcysx5R1VBWzSihpi3Ko14P+lFPR/Z2WPMD3S7sbqeD
	oENFB1ISwNSM5fh/Ab3FaOO7Pu2wrU7Igu0VT
X-Gm-Gg: ASbGncs6BuOJuVmenQNrx307nY/mZ9eMol6wug9duxE0XLx0WA8HSYHouh7PwBD/PD2
	T4PF02azpfXmIcNP8f/+s/waeEZzLb67fq5KBKZvS+0jW6PVctLqfXdh7LOeOAZbH9oNph97hep
	LiZDG8sk2BZ25eshZ8QF/cciVfNIuu
X-Google-Smtp-Source: AGHT+IEIWdX9z1JOma8AW9llag/RxdGA7fLsY2vLgpN0yC7kc+omWzG4eOOU8H13xunLk2NWo3uoV4TbIB9wngAORbk=
X-Received: by 2002:a17:90b:56cd:b0:2fa:22a2:26a3 with SMTP id
 98e67ed59e1d1-2fce7ae91d9mr1293778a91.6.1740089501933; Thu, 20 Feb 2025
 14:11:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com> <20250206181711.1902989-16-elver@google.com>
 <a1483cb1-13a5-4d6e-87b0-fda5f66b0817@paulmck-laptop>
In-Reply-To: <a1483cb1-13a5-4d6e-87b0-fda5f66b0817@paulmck-laptop>
From: Marco Elver <elver@google.com>
Date: Thu, 20 Feb 2025 23:11:04 +0100
X-Gm-Features: AWEUYZlmUbD3zD2pKUzd_1_BxaT4jGAHcCF6wIRviSAHlg-jN4GDUIL9VOeu9Kg
Message-ID: <CANpmjNOPiZ=h69V207AfcvWOB=Q+6QWzBKoKk1qTPVdfKsDQDw@mail.gmail.com>
Subject: Re: [PATCH RFC 15/24] rcu: Support Clang's capability analysis
To: paulmck@kernel.org
Cc: Alexander Potapenko <glider@google.com>, Bart Van Assche <bvanassche@acm.org>, 
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

On Thu, 20 Feb 2025 at 23:00, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Thu, Feb 06, 2025 at 07:10:09PM +0100, Marco Elver wrote:
> > Improve the existing annotations to properly support Clang's capability
> > analysis.
> >
> > The old annotations distinguished between RCU, RCU_BH, and RCU_SCHED.
> > However, it does not make sense to acquire rcu_read_lock_bh() after
> > rcu_read_lock() - annotate the _bh() and _sched() variants to also
> > acquire 'RCU', so that Clang (and also Sparse) can warn about it.
>
> You lost me on this one.  What breaks if rcu_read_lock_bh() is invoked
> while rcu_read_lock() is in effect?

I thought something like this does not make sense:

  rcu_read_lock_bh();
  ..
  rcu_read_lock();
  ..
  rcu_read_unlock();
  ..
  rcu_read_unlock_bh();

However, the inverse may well be something we might find somewhere in
the kernel?
Another problem was that if we want to indicate that "RCU" read lock
is held, then we should just be able to write
"__must_hold_shared(RCU)", and it shouldn't matter if rcu_read_lock()
or rcu_read_lock_bh() was used. Previously each of them acquired their
own capability "RCU" and "RCU_BH" respectively. But rather, we're
dealing with one acquiring a superset of the other, and expressing
that is also what I attempted to solve.
Let me rethink this...

Thanks,
-- Marco
