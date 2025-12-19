Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F8A341074
	for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766178602; cv=none; b=ZpZCIuvrKguVGPUWTIv2LRieildhETQtLvlJl/B8cZkqdrwXuWlx0s2vJyHSpt7rvlUKzQ6Y7JSYA3aNkU1hjFsoPQ4Mj5PjPrJrEnbiHHZls7GXEY6ANnMGK4oeurs0k4ssApwwO/I2cvtSrk1IAFQL5G5zEWnCVbPVuQNho1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766178602; c=relaxed/simple;
	bh=iqhEYrpWgm5Yfz8pxMwX3Z8XLhEcxpfARdS1KcSLhis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YkiWWJM/GgwD7PgDh5+wLUC4lGInl8e8Uh+gTVVyjfLGADkr+QAS6V+RVjE2Fr70sF7batYt+kTUQ+iSp0tLPG0uguV+CcVqG6HP7u2mkDQhW3VF7FDYVK31mya+HH5oIAyfd8f7MAjg2f8rMYLSO6oPYf1zSY9Vz0IbzKtq0S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pGwro0T1; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pGwro0T1"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34aa62f9e74so2768099a91.1
        for <llvm@lists.linux.dev>; Fri, 19 Dec 2025 13:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766178600; x=1766783400; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iqhEYrpWgm5Yfz8pxMwX3Z8XLhEcxpfARdS1KcSLhis=;
        b=pGwro0T1pupcHTjKpDMA4rrkCkq/iZOyjPJrokSetUqCk3VzO4XiZBZnAOWnCAG3K+
         +wt8A4m7ip//GCTWndnUeTfTa4+KYFZORN2TJPaPUd2I8yMbXSqleSJU8agvIXjbhrwq
         mm6YFJqZq8Ufs5evDigRV/xf7YmMBLnRwDMUs5VCqgd+Lq0ysER6c1yCUCXEafIvE9b/
         9FpYlfR0i2T9mboziDcVnmcS3d1BGO82sgBVnTvJ1C0ppnGc60XCydmDjMkPulxYrkQn
         utZ569EIKet8bQPWKokO9bghaWJsQ8L9+Xe7bZkGd1U5x+RUPLGXdRaZdktUc71e+oaM
         sUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766178600; x=1766783400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqhEYrpWgm5Yfz8pxMwX3Z8XLhEcxpfARdS1KcSLhis=;
        b=Wt6a80uPOj5EKUrxQJ9VC7qa2F35DpB3PKIYCXZNzeDhq8q8bLXbnWYDb8GcTN2zjy
         q49eaqtKLBYmhEm5aKsNsZ+NSKs6bIdOwCzWrgeNG5dWrGM6aYrUvsHhrrtEi7JFwCAW
         qaiPcZnWYKG8+iMqoy2pMlWczPpu3gmA0bZKvdZK9gZzdhhREqA1ACenjLOW2d1TGyRC
         0aJVdVUEawS/3W+WwU2rmiyX+KuK9U1vDJKW6SsCfXRCpilpRh/Glq6OfUIgnX8B4bvD
         ZlSns8b041eT27j0tbQdqhOBJ44obTimykaFcovt9Qr2uZ3AJzbRm8yhkDWgBzvpB9gQ
         7Z1g==
X-Forwarded-Encrypted: i=1; AJvYcCWWWAg45ClmM+QHgpg3oTfrX134s7AhKC9GRQ4wbYUoMTupUUkIxTc5eqn5G27WP7YEQioB@lists.linux.dev
X-Gm-Message-State: AOJu0YxMCPQBj207Qpn2gqC6s4UQ0ULkSDCDZdNmeHML5WHk6Vvw3kLh
	ZmUr5SwoOgM/h/MX3+KefLCx8UTCU5BVOg7AQWM6G27umRfzxAQZcZVOfF5Hpvyc9vSgxovhTr8
	PIM0KsQeShA/Q4H2FKQTdfelZ1vc3YMCuQYY2sA+n
X-Gm-Gg: AY/fxX5ggH2TVCn8nq9yNA3Kaot/Ehgs5O0lZD9psSFLc/fOydvhc2pkCthyMjERFNf
	MKlp4MGNjsRMKkPkBsQJY3w6BxQFo6bXbgJSIKx3uQQeqji4HENYY6LXIrS4JT1UpJGyFwqqaAq
	QLFtnNszHg11FxqMUzIJyorCfDBNmv1KpGv9Elmev3ctrWBXetxevFo2gQOggim0kZWTIWC8wbW
	GE4HW0bDXScov8G97VzN/0ByyxqwyPa0qhYpvPQxUSDYVsmH4hnnoyzgn70aIc70G4pkkNrC+OI
	pAYLg2KjXljiecsfoZlT2oKpTLM=
X-Google-Smtp-Source: AGHT+IGdr0jH8cGEaDB7eA0QDwFP/5Ve8WscN7cZkV8XMcvDcmhs6BtuLqrVUM3kTfn7w87OZJ/+kODUMJAxXUcmHFc=
X-Received: by 2002:a05:7022:ef0b:b0:11b:9386:7ece with SMTP id
 a92af1059eb24-12172309509mr4284248c88.43.1766178599422; Fri, 19 Dec 2025
 13:09:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-14-elver@google.com>
 <3b070057-5fda-410e-a047-d9061d56a82f@acm.org>
In-Reply-To: <3b070057-5fda-410e-a047-d9061d56a82f@acm.org>
From: Marco Elver <elver@google.com>
Date: Fri, 19 Dec 2025 22:09:23 +0100
X-Gm-Features: AQt7F2racRCVQBtX1XHCEqHFLvRozCqLgqx9fCp_0Wp28A2qceHYZ0Bj23R_eEk
Message-ID: <CANpmjNN6QrxwUUkpAopTfxLwUqGfB53J96dwOWHNcoYrOrEocQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/36] bit_spinlock: Support Clang's context analysis
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

On Fri, 19 Dec 2025 at 21:48, 'Bart Van Assche' via kasan-dev
<kasan-dev@googlegroups.com> wrote:
>
> On 12/19/25 7:40 AM, Marco Elver wrote:
> > +/*
> > + * For static context analysis, we need a unique token for each possible bit
> > + * that can be used as a bit_spinlock. The easiest way to do that is to create a
> > + * fake context that we can cast to with the __bitlock(bitnum, addr) macro
> > + * below, which will give us unique instances for each (bit, addr) pair that the
> > + * static analysis can use.
> > + */
> > +context_lock_struct(__context_bitlock) { };
> > +#define __bitlock(bitnum, addr) (struct __context_bitlock *)(bitnum + (addr))
>
> Will this cause static analyzers to complain about out-of-bounds
> accesses for (bitnum + (addr)), which is equivalent to &(addr)[bitnum]?

Only if they decide to interpret never-executed code (i think the
kernel has various dead code that's optimized out that might trigger
static analyzers if they analyzed it).
But this could probably be improved by using a different idiom, and
using an empty inline function that takes bitnum, addr as args, and
Clang simply takes the call to that function as the context lock
identity.
