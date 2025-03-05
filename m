Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F3D20468D
	for <llvm@lists.linux.dev>; Wed,  5 Mar 2025 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741166832; cv=none; b=aw7z6QMzgFYJy6MAmIijs8p6rI1mmFdZUkX5EhiZecqJH2VSkOBj3GhG/5WMvnfc7tNSKOwHVHc3fGu8+bxWl2uSrnmqMHJO2pLfWtvS/F8no71AL0wKJfuYwhDZp5BafEEcDIE9obdBfDmvkuZHQRdjmD6iBhv04h8xttQX5BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741166832; c=relaxed/simple;
	bh=3mDFeB3Bpj3IOfRwlQRf3Grj75HR3nrndwXyWmM3Ob4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0QSa9rN0ql0JkZ75hUX7ZNqePGr5B3Ps/z9cli7esqzsn3pGYQhSUIXnYHZZeeT6seK8yLmQdu90nfki/CUaeBiFTQUwjcn7fsJ6Te8neO0VqiVeX6g2Xada0riRwS1p9n/g0LtDPICkArYL/CbFrc7I31mSQumNby4inl/ME4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JWNHmKlb; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JWNHmKlb"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bc4b1603fso19208385e9.0
        for <llvm@lists.linux.dev>; Wed, 05 Mar 2025 01:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741166829; x=1741771629; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VaMa3tOr/8WS8V6AnlLw/eUNgZqrJVmxSDme9KtSQnA=;
        b=JWNHmKlbwe5a1AsjRjOPUZCREmiosBO9NRu4OLmSPd/dX6EaUVsQ/EfEsrKyfYQsZg
         dqt13kDV+tQ7MWePUuAiUOevlJ9mqWA62m1yENytgIc89bqPLjvB6lB1lQCAQ8t0o5v7
         Xg8FhlmxIEjiUK+qZ01WVOeckMEVaJLftBHFfzO/8me1dwbBbZ/QviiWxqPRr3X8HChj
         /0jAfaeCP8YzrEsIlzDKcsfJ6j7gQAnCQxq5r1O/K/HruxzTt4xiSiIOWdUB445bwNqD
         64nKd3T9ytRVeWRofigzlVnN50ms+6j0Gmyc9wB97wFfPZk6MjFPQSH/7yHddOY2e7ZH
         3FPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741166829; x=1741771629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaMa3tOr/8WS8V6AnlLw/eUNgZqrJVmxSDme9KtSQnA=;
        b=MNiCDOcmJI3VqpTofjrc+z/nBTThsrv0BAR4E8jcONvU1RmEUmDSpQVun0bBmRDH06
         D3yqkN0yq5gLDf2V9H2k1Hq/4D0aE4WJYfGjiGTExrV4jnRQsRVTr4LHCQpFp3QLuxvZ
         HPmOY8ngSd/5OfdViDiUqr6JtNiLo8Fbyge7ESGZeQ57XZzMTeOuzEaakIfS6Nc+gz1I
         IaPgYV71PJbzKOWtXZYtOBw+PedufUzSELWRpHElV42h4TBdRe894H+UD5fqJIckSJ9K
         4S1erZzxl+61iKb3dNnhWUuRZ0p4F6q4eX/Zhn3fcm+IJXgVxhxcLqVqlyuOIILabGyV
         zGfw==
X-Forwarded-Encrypted: i=1; AJvYcCUVgtf088s322oMxsn42nSgPIB2FZ5lxC2qdWcQi6D4f/MNPIeEjCfCjXufmzCDNaZtKg4D@lists.linux.dev
X-Gm-Message-State: AOJu0YwPcpkTlfbQ+VCKkpgwXAZD2WSXdDkhLA/LKcM3f2miory9XJxu
	cs1WgZ7ohCtERT9vsPWkMWDoQa2wTLzHrDF1wVC4FPvuEnFT+Ode/Zre0+tU4Ss=
X-Gm-Gg: ASbGncuPc3wI/zDnXDhiMKD1306yEKLYfhvQZxAh1F1HlggMbKIVN9culeW/D+6c0mq
	/pVfmbcGWzbIgx7qGXwZEmkuaW/rWDU2I+/pL+Zto/sYMpj1iHtvm5h7r1OPo4QaKzcEOmLX6Wf
	OF8SubOfTuxFzlNntcipuH7M2FAG2boSOQeMNCTECS6XmraOUrL/iLwo44Ll2xtZgYkfKbpWRrn
	JIulItNsKEQtMXq6+mKoiej5Vr/FXFVIaWeBo1FSDnp4rUszTxEiy2Z8Qft4QVuSsiU0oFTYPD3
	YWl2d7XgUcKLnNXf9GEVhD33cZOLVID9ReJGVLd1UawZERLPuA==
X-Google-Smtp-Source: AGHT+IE3mizAOsnSuTtcbkO82OvTIYaM5IjOsyfCaEaBUlwqBcpm21mf2Z2/NNT65xir9k5CCr442Q==
X-Received: by 2002:a05:600c:4750:b0:439:9e8b:228e with SMTP id 5b1f17b1804b1-43bd29c42c8mr13412085e9.20.1741166829098;
        Wed, 05 Mar 2025 01:27:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd426d069sm11942015e9.3.2025.03.05.01.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 01:27:08 -0800 (PST)
Date: Wed, 5 Mar 2025 12:27:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marco Elver <elver@google.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>,
	Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@kernel.org>, Jann Horn <jannh@google.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>,
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, rcu@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 01/34] compiler_types: Move lock checking attributes
 to compiler-capability-analysis.h
Message-ID: <b6af185f-0109-4f98-a2d7-ab8f716e21a5@stanley.mountain>
References: <20250304092417.2873893-1-elver@google.com>
 <20250304092417.2873893-2-elver@google.com>
 <f76a48fe-09da-41e0-be2e-e7f1b939b7e3@stanley.mountain>
 <Z8gVyLIU71Fg1QWK@elver.google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8gVyLIU71Fg1QWK@elver.google.com>

On Wed, Mar 05, 2025 at 10:13:44AM +0100, Marco Elver wrote:
> On Wed, Mar 05, 2025 at 11:36AM +0300, Dan Carpenter wrote:
> > On Tue, Mar 04, 2025 at 10:21:00AM +0100, Marco Elver wrote:
> > > +#ifndef _LINUX_COMPILER_CAPABILITY_ANALYSIS_H
> > > +#define _LINUX_COMPILER_CAPABILITY_ANALYSIS_H
> > > +
> > > +#ifdef __CHECKER__
> > > +
> > > +/* Sparse context/lock checking support. */
> > > +# define __must_hold(x)		__attribute__((context(x,1,1)))
> > > +# define __acquires(x)		__attribute__((context(x,0,1)))
> > > +# define __cond_acquires(x)	__attribute__((context(x,0,-1)))
> > > +# define __releases(x)		__attribute__((context(x,1,0)))
> > > +# define __acquire(x)		__context__(x,1)
> > > +# define __release(x)		__context__(x,-1)
> > > +# define __cond_lock(x, c)	((c) ? ({ __acquire(x); 1; }) : 0)
> > > +
> > 
> > The other thing you might want to annotate is ww_mutex_destroy().
> 
> We can add an annotation to check the lock is not held:
> 

Sorry, my email was bad.

I haven't actually tried your patch at all.  I have locking check in
Smatch so I'm just basing this on the things that I did...
https://github.com/error27/smatch/blob/master/smatch_locking.c
This isn't a mandatory thing.  Whatever happens we're going to end up
doing dozens of patches all over the kernel later.

I thought you could destroy a mutex regardless or whether it was held
or not.  I was getting false positives which said that we should drop
the lock on error but actually the mutex is destroyed on that path so it
doesn't matter.

regards,
dan carpenter

