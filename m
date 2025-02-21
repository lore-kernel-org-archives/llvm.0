Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1502120A5DB
	for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 17:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157814; cv=none; b=fXXNNEkppH0UJ5bYGnzGmMzU2dKp+1PtIrPdUh25UrhRyIRr2ET8aRnnAaPpYjEWOKhtX6eNDuV8RBQoUTRpNfI3w7AWNuppq6r/zbt2RVqib7sbCr9KcZ+4pRrdwX7R9oKBHUSzrkk8JYEWIHf+gl6rXOvk6xuA2LMk6DszVQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157814; c=relaxed/simple;
	bh=aeZfSLvONakrPfUFPz6/WEr+o9IGTdzP41h/PEH+b6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OI3oVLz6bf3nmpTO3quuErjmr8bHM+nZJv/hTUhq7zyJWNeviUkMZ959gddIvXOjQpCazfNlPH4x+BwZvw2Yue8OYszU5jdj1yKB76Pu1+wz0FECblyXBtg6VVu2YPgu0yo/k2E0kEaigFygoUqr9b6cLyFImckJ1CkkyuvR9So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PokuIM6g; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PokuIM6g"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so15999455e9.0
        for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 09:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740157811; x=1740762611; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ae5OH7jwtkminWKyF9PaRglXPc6x2IkfIyVHHThfxY=;
        b=PokuIM6gp3MQn73WgKsCja15RrhwpMoySNEzNmi1deUas2I7XI9b5enELBuShwrPWx
         fMffRxUWcx7GrpHDg3f4cXLxHEKN1HAzy9VgmIpRLn+NxqWGoHsJMZKJVwHlwoP0EhjF
         g7VoAl+uhcQT6Yfv5Hb4znZlTCJF8KN5xRGO+DiMFTSykpH5gDiiI761rE0hI+BtRyF4
         JYdBOqYIAEDPHm8taMg8BoS4WTjqif6MktvblBVrkjvf4gBGjY5ses+qOQGpHxwbHDRX
         IDyPnvBFep1tiIinOHzNJo3tU9wjNhc7REfa+uvSgn41YR1X62H51JgryWlCtEt1QYPz
         iuDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740157811; x=1740762611;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ae5OH7jwtkminWKyF9PaRglXPc6x2IkfIyVHHThfxY=;
        b=XTfObq94vZ7so9dY7ms6G5T4J/0C1ohMvqBd6OPGKAKxBOsI6FJAP54oDRviwbO9s9
         WJ5OAZdkbMhUpdLsEjBSQcwuMl4E+X28vmy9Y6rLvbGjFv6516rkeNNhm7V3rNYsK6mW
         +g+bHUBrU6SuuGMtwRLBA1AbBv7F4bCz9zZ+AZOERG3Qdgp4sUV0mUp4KX69pv/46HGb
         7iI7TNWgJVh4iHnHNHgpObD4mhdaCRbnz0GvIGW2VzM/WJ6InecVMi8RoTUOUcQH/8Hz
         dOaznC5Tlz8OPwFoBFECqcSniH3Cf9hL/RRsCwnWXONo5YmI1zOUxNg56UfieTuCEFiS
         6zYw==
X-Forwarded-Encrypted: i=1; AJvYcCVqudmA07VO8d1UDb0OZQkBsojBwnDkZbXltXlOZ6XhwZHVyZK7t2f/GGpNbT2nVn6zhpl6@lists.linux.dev
X-Gm-Message-State: AOJu0YxF/jy7Sfoti++0+zk8Ml4VjVJl6lnbXQ3p/o2vHyM7Tgg+lo3Z
	H+RCbB/8r5d98B2rL425+Df4Mw056DH9hX7hZXhmUFT7LEpvmFFBK9r5MsLRdA==
X-Gm-Gg: ASbGnctPJrfU9Dfn5xjsSjMJTWVWxOjtLvzYIYV1xhB5EMUqFhIAACaX4SAiSXATQh4
	6ln3cDKPtEkSQrU6vxyvuPbg3c+O42j1LtmhBW2q8L07jH13XddFZ5XMhElsIhJgY5cSyQZzDIf
	Ed/t3q1G/axONoQ6tTuYpwdUiwIq9MF9RvdM1/dGd8WmnotOqAMiRuudUnNEsxPGLrECV4cP2Q1
	SvABJMCwNITVbnswgycC7MpQLY2URpfxG8w9pu3A/VUfvd79BsM5sGLV1vK8Vz6xITeZsZGvzOA
	FOKWmE2Rdh3Mp7aM88WOEfirvLqu2U4AEJ1wluuUmYHOe855WmCBujJceplB
X-Google-Smtp-Source: AGHT+IEhS0wHzWZ8v8tDe/zSH7y0WxAcPZjhTbw7jssA/vfQ5STDgIJLHbo0vQIMFfjV4xZX+eKRaw==
X-Received: by 2002:a05:6000:154a:b0:38d:e3da:8b50 with SMTP id ffacd0b85a97d-38f7082821bmr3755812f8f.39.1740157810923;
        Fri, 21 Feb 2025 09:10:10 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:9d7a:cec:e5e:1ee2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f561bee3esm9232017f8f.21.2025.02.21.09.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 09:10:10 -0800 (PST)
Date: Fri, 21 Feb 2025 18:10:02 +0100
From: Marco Elver <elver@google.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Alexander Potapenko <glider@google.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@kernel.org>, Jann Horn <jannh@google.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, rcu@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: Re: [PATCH RFC 15/24] rcu: Support Clang's capability analysis
Message-ID: <Z7izasDAOC_Vtaeh@elver.google.com>
References: <20250206181711.1902989-1-elver@google.com>
 <20250206181711.1902989-16-elver@google.com>
 <a1483cb1-13a5-4d6e-87b0-fda5f66b0817@paulmck-laptop>
 <CANpmjNOPiZ=h69V207AfcvWOB=Q+6QWzBKoKk1qTPVdfKsDQDw@mail.gmail.com>
 <3f255ebb-80ca-4073-9d15-fa814d0d7528@paulmck-laptop>
 <CANpmjNNHTg+uLOe-LaT-5OFP+bHaNxnKUskXqVricTbAppm-Dw@mail.gmail.com>
 <772d8ec7-e743-4ea8-8d62-6acd80bdbc20@paulmck-laptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <772d8ec7-e743-4ea8-8d62-6acd80bdbc20@paulmck-laptop>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Thu, Feb 20, 2025 at 05:26PM -0800, Paul E. McKenney wrote:
[...]
> > That's what I've tried with this patch (rcu_read_lock_bh() also
> > acquires "RCU", on top of "RCU_BH"). I need to add a re-entrancy test,
> > and make sure it doesn't complain about that. At a later stage we
> > might also want to add more general "BH" and "IRQ" capabilities to
> > denote they're disabled when held, but that'd overcomplicate the first
> > version of this series.
> 
> Fair enough!  Then would it work to just do "RCU" now, and ad the "BH"
> and "IRQ" when those capabilities are added?

I tried if this kind of re-entrant locking works - a test like this:

 | --- a/lib/test_capability-analysis.c
 | +++ b/lib/test_capability-analysis.c
 | @@ -370,6 +370,15 @@ static void __used test_rcu_guarded_reader(struct test_rcu_data *d)
 |  	rcu_read_unlock_sched();
 |  }
 |  
 | +static void __used test_rcu_reentrancy(struct test_rcu_data *d)
 | +{
 | +	rcu_read_lock();
 | +	rcu_read_lock_bh();
 | +	(void)rcu_dereference(d->data);
 | +	rcu_read_unlock_bh();
 | +	rcu_read_unlock();
 | +}


 | $ make lib/test_capability-analysis.o
 |   DESCEND objtool
 |   CC      arch/x86/kernel/asm-offsets.s
 |   INSTALL libsubcmd_headers
 |   CALL    scripts/checksyscalls.sh
 |   CC      lib/test_capability-analysis.o
 | lib/test_capability-analysis.c:376:2: error: acquiring __capability_RCU 'RCU' that is already held [-Werror,-Wthread-safety-analysis]
 |   376 |         rcu_read_lock_bh();
 |       |         ^
 | lib/test_capability-analysis.c:375:2: note: __capability_RCU acquired here
 |   375 |         rcu_read_lock();
 |       |         ^
 | lib/test_capability-analysis.c:379:2: error: releasing __capability_RCU 'RCU' that was not held [-Werror,-Wthread-safety-analysis]
 |   379 |         rcu_read_unlock();
 |       |         ^
 | lib/test_capability-analysis.c:378:2: note: __capability_RCU released here
 |   378 |         rcu_read_unlock_bh();
 |       |         ^
 | 2 errors generated.
 | make[3]: *** [scripts/Makefile.build:207: lib/test_capability-analysis.o] Error 1
 | make[2]: *** [scripts/Makefile.build:465: lib] Error 2


... unfortunately even for shared locks, the compiler does not like
re-entrancy yet. It's not yet supported, and to fix that I'd have to go
and implement that in Clang first before coming back to this.

I see 2 options for now:

  a. Accepting the limitation that doing a rcu_read_lock() (and
     variants) while the RCU read lock is already held in the same function
     will result in a false positive warning (like above). Cases like that
     will need to disable the analysis for that piece of code.

  b. Make the compiler not warn about unbalanced rcu_read_lock/unlock(),
     but instead just help enforce a rcu_read_lock() was issued somewhere
     in the function before an RCU-guarded access.

Option (b) is obviously weaker than (a), but avoids the false positives
while accepting more false negatives.

For all the code that I have already tested this on I observed no false
positives, so I'd go with (a), but I'm also fine with the weaker
checking for now until the compiler gains re-entrancy support.

Preferences?

Thanks,
-- Marco
