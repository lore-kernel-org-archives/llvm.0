Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579C530B512
	for <llvm@lists.linux.dev>; Fri, 12 Dec 2025 10:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765536550; cv=none; b=IwchRjZo3B+1nwvCmcjehZXnUW08gnxSPwb+9Cn/bWWkZz/8fkGwJ28g1L1Y7mQW9xoF+2MgjeT8EuSLLICFUW3yvnljMW4KlKwoqH5mczMAbJh7YLJmEdvk05r+aXVZNvXLgdEsUjEQOm/Yzs/CIPdca6Iz4GeOejNx9ZdILCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765536550; c=relaxed/simple;
	bh=av9hKN2hbVjrZk+A7S1PV353SLAqNrjc7QnZ5XIVFLo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cf9d6QjchQ/EwTf4FT4C9JDHpS2sMXRTyH0uyMqEnfMSTm55dpgT87EeVo3/pVmXXqTlPHCvIN1qu1okPcGBcjwjskgrjEZmapcp9NaDlLtwagITuH60im/ppHj6SRqBPqWVcWPPQufN8NpPqKJyMI7ZLLmNjiabR0VU0BI6pso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l0MqBROP; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l0MqBROP"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c03eb31db80so748867a12.2
        for <llvm@lists.linux.dev>; Fri, 12 Dec 2025 02:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765536548; x=1766141348; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SA48npp6esm0XDSNny8uE3VVilMK0KzCGLSxi6mYbKY=;
        b=l0MqBROPp0KyFfDSCmFTG9jMOSNZ4SV/9GuZojE9lktDbfQXbUsiCDZb3Yx+55vv4i
         PVAJyoE9nxDhofQhPr5cUJy9dUEKRpf6RtLgnKA38aGh1cYfiF/ps7xCIRq1+DusbnRG
         mC3JA405pqtIHTycPwwr51T298NVNv1PLFkqhAIT2cTo38pe6Y5bIg8gASV0WLznihZe
         PaofHM9BQsBP9kkMGkJvKDEj7eFIO3dYwxACqVzxNGXJPrn+nU0rMz/FXkbnE7VlNSbw
         1pbcKg76qrvzEZNJayEjmLhMuRy1EkXqxO9x8+oWejhz2AYATunmp50UQ7oTc8xkmva9
         3gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765536548; x=1766141348;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SA48npp6esm0XDSNny8uE3VVilMK0KzCGLSxi6mYbKY=;
        b=vO+2A8a21v905IyR6E5fIL3wn32xni2tb33vJEdYEt+L1ngwd9zE276tlPlMq67KUy
         E4YO8pjzUUIj++VqTYov5vHkM9nn1TNqY0mRQbSOkeuIU6A22w3CMWEVTgftOu6B+mf9
         8HUHqosaWN4CeDCcw1Vvhy2xwDze34yViHPu1uExoEtmk8iOaLZPfSD8g+2uiQkTiutp
         Pi82l81DozElbnQAwojmWfVQ+B4Dl1mxyit6ZlxrWHj3lWDb3xiuPCqYHDekQEunCN3i
         fZHA9m3IU5YMoo9Eh3zdMZIf5k/K4P+/myHymsFc+KVPCwtHTJuwHFK9zR4iizJVyf5+
         Zz/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUjUL9u9Hs2r/nv+vLJR15rb81h0sXJ9j/W0mh+z+w8UHMqSRuq3QyA7QolvfS+bizoRWo/@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf+iR3ksYiLOKWYblBgPfx6nQaP58gVdjiMSW1UaWAXSqLcR/j
	wbwA37RgTrbNZLzZ2jz3x61n5SIUIJv2l5S6sZeVxCm16gt4vG//ajia2h4OibEwzPSPJLUGzdC
	2Wxr3Ox3Hy1QShwLA2So+ol3JkHtnNH3dqo/du/B0
X-Gm-Gg: AY/fxX6wukTynvP5iWEdiDn7labeVN0tF+1qrmORodpATN14A8T3xvDG2iDiyzJduPD
	5ngsE27+Y2StSr0jgAaisdGl+GbXzQL33n3n58OekY9fiEWvlYWddS96GGsnuhmc/0xIt+mB0X4
	1wF7MA/blwl23yAG3dobtxhaagMOMWLeNSW3RLMOh0ccywnuBqHJPeMFz8RmqExcFWUhh0p+fij
	8fnQzSoqs+81OwlRBDcq/9220WnMnPdsKT1FLJEae+rebjUm06HEdkbzKI7UjJV3uNGHkc8G/Mt
	SsSbQ6mzqHOp+F9PtD2NXTX4DXI=
X-Google-Smtp-Source: AGHT+IEmwt/cYGSRMcLEQwRoz4IOBPZmG6ZdFUXvSQgttHHtD3I/ZoiZY45lTyY+63ShMc7m2jk9oXMIHs1yDaFc4yU=
X-Received: by 2002:a05:7301:6781:b0:2ac:2e93:29bf with SMTP id
 5a478bee46e88-2ac300f946dmr1219192eec.22.1765536547134; Fri, 12 Dec 2025
 02:49:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251120145835.3833031-2-elver@google.com> <20251120151033.3840508-7-elver@google.com>
 <20251120151033.3840508-8-elver@google.com> <20251211114302.GC3911114@noisy.programming.kicks-ass.net>
 <CANpmjNObaGarY1_niCkgEXMNm2bLAVwKwQsLVYekE=Ce6y3ehQ@mail.gmail.com> <20251212095943.GM3911114@noisy.programming.kicks-ass.net>
In-Reply-To: <20251212095943.GM3911114@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Fri, 12 Dec 2025 11:48:29 +0100
X-Gm-Features: AQt7F2qCLUKQusRsTOkfVyHaXl__KgFtQ_SoVZmDpwKuRXcKmzXhASdee3aZVrU
Message-ID: <CANpmjNMY55ytuWPh15O-tTe5zEQx3AN6LqrvB9NJ6dm6BsPnsA@mail.gmail.com>
Subject: Re: [PATCH v4 07/35] lockdep: Annotate lockdep assertions for context analysis
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Chris Li <sparse@chrisli.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, 
	Eric Dumazet <edumazet@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Johannes Berg <johannes.berg@intel.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Dec 2025 at 10:59, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Dec 11, 2025 at 02:24:57PM +0100, Marco Elver wrote:
>
> > > It is *NOT* (as the clang naming suggests) an assertion of holding the
> > > lock (which is requires_ctx), but rather an annotation that forces the
> > > ctx to be considered held.
> >
> > Noted. I'll add some appropriate wording above the
> > __assumes_ctx_guard() attribute, so this is not lost in the commit
> > logs.
>
> On IRC you stated:
>
> <melver> peterz: 'assume' just forces the compiler to think something is
>   held, whether or not it is then becomes the programmer's problem. we
>   need it in 2 places at least: for the runtime assertions (to help
>   patterns beyond the compiler's static reasoning abilities), and for
>   initialization (so we can access guarded variables right after
>   initialization; nobody should hold the lock yet)
>
> I'm really not much a fan of that init hack either ;-)
>
> Once we get the scope crap working sanely, I would much rather we move
> to something like:
>
>         scoped_guard (spinlock_init, &foo->lock) {
>                 // init foo fields
>         }
>
> or perhaps:
>
>         guard(mutex_init)(&bar->lock);
>         // init until end of current scope
>
> Where this latter form is very similar to the current semantics where
> mutex_init() will implicitly 'leak' the holding of the lock. But the
> former gives more control where we need it.

I like it. It would also more clearly denote where initialization
start+ends if not confined to a dedicated function.
