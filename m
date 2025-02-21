Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790104C9D
	for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 00:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740096998; cv=none; b=uqiIEVOHuXvIOQCNwPDi74usI7L7FVgie7dYFHmqpU4vuDeBRZzQWULR9VSqLMIwXXsQ9I6CkoQJWFtqqFdl137VU5YFKw7VbkdltaJEN7HzOEB/f8JITECG83tbFAEJCuVJ0gbnnTg8hnKM9miwd7g0ATlQHpxbI5JsYneRxMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740096998; c=relaxed/simple;
	bh=5+JG17y1no+XiXasWAV4LNR09aAS3RPd/O1cju1aFmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUGh6UzSxyI8lVvMv0PiYadMXV4ta5Hnd7MsvSENI8ZTUt+gioDhY3zXA2f+ZF3SWonnI98Yz/69mFaFAreDnTSmTXxq5EtzhK8gMCv0/TxLWIhfKixQg7bD5nScOyUQ1d4ViglAbnpncmre+8RvP8Z+RL4/KvieOR6tsZTgXdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4P5eTxL/; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4P5eTxL/"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fc3db58932so2355223a91.2
        for <llvm@lists.linux.dev>; Thu, 20 Feb 2025 16:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740096997; x=1740701797; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gOXx46W220E6FZEq/MsCwDe+Yct3ZgJbNWYU+dT6cGI=;
        b=4P5eTxL/nU7dkuJsEZbnD8KAeyo0okCfpxG1HBtV6YIME6GBodj0wEbwXWVHoG4LYM
         CP3JjOw7tQ/ExG6N6xq/alsX1QHfxSDV6wDmtCG6CEhBkVLMw1KV60nBqHPV7IsOt//8
         ebAzCsSu/nMaN5RH5VUA0fMX0SrQGwn0lPfuiujCnW2+5AAff8T0sKjJ6yRihZfFQCBR
         rbnQ2h2WUdJ049a0fPTxYsNLNjUF560RdVXAdYVcPkQ8L1hdTbHnjyDrhIipK264Wm0O
         4LNB0bbZ6+rOZxiSu1Ing3tDTrIEBfY6rg6rqS0Cd8Cot4Y9x7SRmOhBbEb/Yz9+ea8B
         gjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740096997; x=1740701797;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOXx46W220E6FZEq/MsCwDe+Yct3ZgJbNWYU+dT6cGI=;
        b=LEHwUdUjYfMmRFaK84Jwo6hCyHhR2tx0QjCyhhQJ28FZj9BI28+mP7oh2IKMt9pUxQ
         aKg0HK575a8uWz6Xttb1g4yRWiTefUClwH/khy/TcBQqEBOe4CTaNinI3Cca0SLNKbeK
         ZsWSX52hz4MQhvZouIkRhDjpZZFgyW67adr6xMTbq3FCOpzefWvwU6/46EDKgGOczZh5
         QD3YZ+NyNj18Y9eDb1/MDP+7G+8C7ZgNLRdA4ib6YuMwMBGFpGt0cclils+RKriQRF6a
         Tp+y/6jtK1/asWWZKGXocqeQqcFuRJHmlOnm+rpl/43OFlbMMV8tjB0qgcjGr0EiTqA6
         EB3g==
X-Forwarded-Encrypted: i=1; AJvYcCV9TRl+ec6WeLhhGkB/ciWzHaT1DxDnEh/vhj19nec3SkFZ2NNG/cRyLzycrd7PuT56SZ5R@lists.linux.dev
X-Gm-Message-State: AOJu0YxXpIRbWkndLf7kI5/OyVS4C00/++nIWfPXoO7VJ10KjDaYmtZl
	aJcdH3xTBeQn9owYfaQSBUhBLyFUGGhJp0m/MBiHv3AE2LvcjhM8RtUHipo+g/W4BzAZHcLR5q/
	xdyVtLents3fLp+ihFD7c+vxMd726zmBvl050
X-Gm-Gg: ASbGncu1eehvBEQTnqv87rK2z91LBaotaBPGK3RliHFlBdMnmelv59Ae6ykpKUrrYCk
	PbuNwk1xZPoMF1ah60Su5ZhYyXq12yn74OHLAry00hbt1SU6bRDFglEvTd75O1nj5zGV2aUolk4
	mgDHbeWDOkJMMJ2SwzcPQQW5EFj30L
X-Google-Smtp-Source: AGHT+IH300h5TwdZHkn4p/NdY4bFW5MIH3asYrmMXGsx9gCRIlN5VXz6gX2AUHtetV2+tubgqlPwXCwB1TZRnMvVO/A=
X-Received: by 2002:a17:90b:1d83:b0:2fc:3264:3666 with SMTP id
 98e67ed59e1d1-2fce7b221c3mr1828235a91.30.1740096996554; Thu, 20 Feb 2025
 16:16:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com> <20250206181711.1902989-16-elver@google.com>
 <a1483cb1-13a5-4d6e-87b0-fda5f66b0817@paulmck-laptop> <CANpmjNOPiZ=h69V207AfcvWOB=Q+6QWzBKoKk1qTPVdfKsDQDw@mail.gmail.com>
 <3f255ebb-80ca-4073-9d15-fa814d0d7528@paulmck-laptop>
In-Reply-To: <3f255ebb-80ca-4073-9d15-fa814d0d7528@paulmck-laptop>
From: Marco Elver <elver@google.com>
Date: Fri, 21 Feb 2025 01:16:00 +0100
X-Gm-Features: AWEUYZmivm5bHZ6EpPSxW_3r18VidjaU61lIM_KUqGThNf6OIvndggmyl3l59og
Message-ID: <CANpmjNNHTg+uLOe-LaT-5OFP+bHaNxnKUskXqVricTbAppm-Dw@mail.gmail.com>
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

On Thu, 20 Feb 2025 at 23:36, Paul E. McKenney <paulmck@kernel.org> wrote:
[...]
> Suppose that one function walks an RCU-protected list, calling some
> function from some other subsystem on each element.  Suppose that each
> element has another RCU protected list.
>
> It would be good if the two subsystems could just choose their desired
> flavor of RCU reader, without having to know about each other.

That's what I figured might be the case - thanks for clarifying.

> > Another problem was that if we want to indicate that "RCU" read lock
> > is held, then we should just be able to write
> > "__must_hold_shared(RCU)", and it shouldn't matter if rcu_read_lock()
> > or rcu_read_lock_bh() was used. Previously each of them acquired their
> > own capability "RCU" and "RCU_BH" respectively. But rather, we're
> > dealing with one acquiring a superset of the other, and expressing
> > that is also what I attempted to solve.
> > Let me rethink this...
>
> Would it work to have just one sort of RCU reader, relying on a separate
> BH-disable capability for the additional semantics of rcu_read_lock_bh()?

That's what I've tried with this patch (rcu_read_lock_bh() also
acquires "RCU", on top of "RCU_BH"). I need to add a re-entrancy test,
and make sure it doesn't complain about that. At a later stage we
might also want to add more general "BH" and "IRQ" capabilities to
denote they're disabled when held, but that'd overcomplicate the first
version of this series.

Thanks,
-- Marco
