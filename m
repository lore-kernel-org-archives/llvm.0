Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52973233722
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 23:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769471248; cv=pass; b=mGf9tzmqne31M0yFH+QS+2n2EU1ONYdXJ5jg75su/bB2mkYs/qXoPyhhgFiJJLhNn8gDzMdCANO1c7gjIyvX83ATk8mtrPz7xJfYfQIBMs+UOe7WVTIYGwwzXtT+wKtlQOpbJFvaEasJVTskzJh30Xlx7naFDuL0se9Uu+i4B/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769471248; c=relaxed/simple;
	bh=fG2Ruh+rMXy8HECrlWrSGEzE9JMwnw/wcqEcRF2te3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwiCOQPgrGdkyWmzc6HTfE4klzQV4OoEFpFruAGE5JdtMb/e1o49e/SR9NaYma3Sz9z8Q6sYq+AmPhCWzGark6M1QmHFRsDljWc/xyyR55UTemPRwzNggnoyXafhQS5ZJQstaUMIAzO0rXWrl4bM2UpC1J7IHM+zQSoiewLEM+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tOQ5kISW; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tOQ5kISW"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12460a7caa2so7228636c88.1
        for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 15:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769471245; cv=none;
        d=google.com; s=arc-20240605;
        b=UwkVkXu6QvH6Uuh4WpbfGKyP9OYJZ5MD0dzZGvaISO1BK6oUcZWcgh3ONZFXpo2Tsn
         W0CdKRIgGE8lt/EFZJh30xvw0f0+8w9jWbVnAlNrYHJ/fE/ygTO8PHyvDqN4kRgwfind
         o7RAeYQ7WDQfIO0kOdaE4589CnHku4lA8J77Ez6lpqSw29vyab3giTfO5By43DAvFwgx
         TNyiKgI/8UVdDb+SUMk4ZMwX+xoPoCN4/E0Oyp0m/5vTL/nRf/B72TDjl/occpdKPY70
         b7CBvGuP0rwqz+DznV6ueMqPCuZ89AYGz+9iHfchcL1lDkof8HPFn+EtgSiQEDGBTtPu
         YXpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=X34tjfxPPMupW8WHmEJAIsWdH0Oem6uch60iKqedEdc=;
        fh=mdBBKK0BzupVSDkLJYwy8fKjeterENnae/Cvck+RYUE=;
        b=k3Bk4/0snznoYpAlwKpInnTiq5P+jf6mEA6CekVGMw8POcNpn1b+1tKpJqEuomtxWP
         VsqkEiGe6D2PYSwQwVzIq9i/CWO1/4L8CsGPEth1db/aFGcvsHh/iuA8CtoQjGF6Hq00
         fujGIk0cKerYYM8xL4JXrd6BvUWkxh3TH0RKkjcWcEoTytTIbm86PPEANJiLiD55KFwR
         dCg0tDDQfarpR1ev9AuG1zhDA0elCHdkyypdUTuhsHMSTQJmSXva/3xfmww+mUN1dCdF
         XKT7dfi+58phsiM8lRilzJCmIzi6kKitPwKV70LQ2gPQJ1vtln1Xk0NZ/KM6A1YQvlB1
         ZPKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769471245; x=1770076045; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X34tjfxPPMupW8WHmEJAIsWdH0Oem6uch60iKqedEdc=;
        b=tOQ5kISWDX1QsA9ML/6HqpZdAYqCmvu1LAl4RLjV6vmMc4FurcDbz94Bs2WqIi6zQx
         hxlwHyXnJTlRyPXrileUtaHeMBQkZ9Mr2rii6cf8UZCehdTOWSHakYOVGyAesTk99mcB
         FPxcpcREa+6xV9jajU2vI2kc2Ufi5BDSa8unt+FCaQ/dMh2VUlXGGlurR7q5Vc+R1l/b
         v/dVxZslza0PVO2iaCuzKLt44aY6Tb/F84K+b753oxJ9KUkkrM9maYaEcYhwPoy8ET5a
         4EMkun0kBryaLcC7o1paX6OFN8EXiwqly0mlI6ruzV3nJJrRDEtN9PYp3O3sibi5B/7V
         HyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769471245; x=1770076045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X34tjfxPPMupW8WHmEJAIsWdH0Oem6uch60iKqedEdc=;
        b=OnraBnPtCR/R4eCrxc3F6gslhzO7+Xf/O6T2OrCZIXNL7NHPHkuAafaZCD8/BtVNat
         3YgHX02IMA9euDTGclrsgCEpPJWRFXzti0rAKxBGCBcLbkAHj/G78GNg8BbFQbYF8RTo
         pdlCcwDtGFt8mzQ2BWfyn0Pjr3wVv6Yguiaqi3spF/axD7sOu1sL+FCk0JfEJcZuoD1l
         MwhWPPsbjR7WwC247qCALZxo1NL05hOdsroPKVKrxKrb/eHMDTpgbILCdqtUOqpIlkpO
         eKY9QRrcNqGJBiCHYxL+hyYA0psmKfUYf+mkMzbmMjY8+3QZ8G9yO7fNMVy1HJTT3AFB
         9oUg==
X-Forwarded-Encrypted: i=1; AJvYcCUpuVptFDKrK2Gvxt/x6c7xJKnNtvX+Qq5VQnOEd8/BF+LDM0dNscvhDklWatX9D/a9b/QV@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq8FzJmdt6Ea8tr8qensUVzj+lxdcIrtllYNp9ZB/hhLPaLoAE
	tQL/pdfj6io9Yjp5gkTmE92GXJVERKLyF22pjn8qQ9UJllbTly4H/rOQ7f8epE0vw2Wj0cC11gC
	O6Sx22pjz3IeroL8XWGWL1CstyLN/KrivknreFi9e
X-Gm-Gg: AZuq6aI1bHMAvJEbqO1ijQ5Ib/GgNpTdoBJKwYYYTzlzZrEGOwZ0mZzMNN4bMAlFu11
	3yaYVyKvGuOTj1Gwgkuon595g7mtM0hBJ4gFyfvgiE9LyJOkIMchWAjBc/Vs3R/92HjED7LuDya
	IRkx9ONC6kKiBsqfctaKvSagk4zV2HmL1Xvy/xHpaGL2LWYoyOkhPNXgi8yDJfgLZdSOo5C/xYa
	GOyRIvHQb2pU7XNr/1d1wmR/Wj8VAthvFJ79Dli4p5NpcaSFpT6q2gPhCxKcDY6+Q070Au80kP5
	KkZTZicSVheG0reVzJjNmMyIvyYL0IZrQ+ccFw==
X-Received: by 2002:a05:7022:eb46:20b0:124:9e46:82fb with SMTP id
 a92af1059eb24-1249e468815mr157327c88.38.1769471245289; Mon, 26 Jan 2026
 15:47:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-16-elver@google.com>
 <dd65bb7b-0dac-437a-a370-38efeb4737ba@acm.org> <aXez9fSxdfu5-Boo@elver.google.com>
 <8c1bbab4-4615-4518-b773-a006d1402b8b@acm.org> <20260126213556.GQ171111@noisy.programming.kicks-ass.net>
In-Reply-To: <20260126213556.GQ171111@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jan 2026 00:46:49 +0100
X-Gm-Features: AZwV_QgcknJe0PlLV-z7bksgFQT7uSnaZ1B5QvyI9tPRocr5FzcCAIEUg9yCt-Y
Message-ID: <CANpmjNPs9CtY1w1-MqL1-CnHVFLxXoA2rbd6d2w4wfxT8AP0ew@mail.gmail.com>
Subject: Re: [PATCH v5 15/36] srcu: Support Clang's context analysis
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>, Boqun Feng <boqun.feng@gmail.com>, 
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

On Mon, 26 Jan 2026 at 22:36, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Jan 26, 2026 at 10:54:56AM -0800, Bart Van Assche wrote:
>
> > Has it ever been considered to add support in the clang compiler for a
> > variant of __must_hold() that expresses that one of two capabilities
> > must be held by the caller? I think that would remove the need to
> > annotate SRCU update-side code with __acquire_shared(ssp) and
> > __release_shared(ssp).
>
> Right, I think I've asked for logical operators like that. Although I
> think it was in the __guarded_by() clause rather than the __must_hold().
> Both || and && would be nice to have ;-)

Some attributes take multiple arguments (__must_hold does), though
__guarded_by doesn't. Yet, && can still be had with adding it multiple
times e.g. '__guarded_by(pi_lock) __guarded_by(rq->__lock)'.

Only thing that doesn't exist is ||. I think the syntax you ask for
won't fly, but I can add it to the backlog to investigate an _any
variant of these attributes. Don't hold your breath though, given the
time it takes to land all that in a released Clang version.

> Specifically, I think I asked for something like:
>
>         cpumask_t       cpus_allowed __guarded_by(pi_lock && rq->__lock)
>                                      __guarded_shared_by(pi_lock || rq->__lock);
>
>
> I think Marco's suggestion was to use 'fake' locks to mimic those
> semantics.
