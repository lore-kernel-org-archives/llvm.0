Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5582314B95
	for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 15:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758211051; cv=none; b=O13uCDAI6JASSLIRgqy1NFR88HPTzw7seKA+8KFRV4Pm9/vgr3K6NGyGYXQJ8n76HQc6beHhKG0aAoAPxgYD4Z00RlmDbfHaPVURv5vnJIyOtKSMBjBes6ANvOTp7R0wwlEv4fBC1VSP+5H5gGgXy9tbjrJpWUM5IX8SpfV3QXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758211051; c=relaxed/simple;
	bh=XhR1h2E8azi9+Iqslf03I/SakVc5s2CaBmw/N8HkwwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4i2AlgGMf5RjYUhL6/fmMuumomxE4wC+JNan42worWiuKGq+duoL2DE8y1leb0JwnEnKVSLJV9aoSKsJeuWcKQCr9NygaWx4AB3VQ1dUdGeFptwDhZ1VUjfU6PhAm9s5FPoIei6sKIpnwwESqHI5hRXCl1QgCxrij1L7zVzz2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UBruLNG6; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UBruLNG6"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3515a0bca13so25308041fa.1
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1758211047; x=1758815847; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hpKO6CsQCuex3g+QZ22KGPC+ZgcKRmVKS1THDCqCkXc=;
        b=UBruLNG6l1QuYF8xXEvD+dQRPUPaHStoLe8BuJNnMPQzuDyzR8hhxRNBy91DI4chEa
         Pc2MF9hri5ENxwESYvRkd5IUQ6zcCg9sCqjTWD4HHfIKDCk5eSAvOE9INiCnh4P6C7Oa
         s+tWY8RPLI9udRDTGiLrUB4CI9mPpT68v7bR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758211047; x=1758815847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpKO6CsQCuex3g+QZ22KGPC+ZgcKRmVKS1THDCqCkXc=;
        b=pcrlT5Hg9QGnA76WLk5Ofbt1D+xjDNydp9ZwRF2+W33bQ7M+5FI3IJkNoNynX22xEQ
         VBPSToTBOTWoz5w99aZK60buXCrp7SFrmF6gxQJ7RjOar4tgfoEDGJNoj4T7rnNpBGSO
         ycEa/TTqXOi8eLUzTG2o1fM3xBOqGp7uC8ct7OJa8ejk8kLibbHWUTSvoKgaH54YSr3Z
         emIcFXulODmSPzDY+bs09hun3LgZSZknzMW8JYzuHfLFJFcQk8WfSKS9OVOfnFNX9yDG
         AwlfTl7KYDDGPCmwia4fVhhzUe15qhz6xtblJhX+gOLIzlnDptBgx1GTdgaW3avqVrhg
         YKoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhCgLwMIyUrAH0F850nvzcDe1HccQPYjFoMEDLEsEcGOpP0HKfo6Zqflv2nDOIXByHjJWj@lists.linux.dev
X-Gm-Message-State: AOJu0YyijcnJ+vPIi9SBBTDiLQsMNg90s1I1+EX8zW8z4hLf6ymvrQ4j
	ZyhRkPpON3lYzCyCSDN2pe+8KzgUzu67ku2f9QMMFKC/BnzVSFzaccaEiUsL1QFivMnTM4JXmyj
	l+kD+fvzQmg==
X-Gm-Gg: ASbGncv3zTQVLEkE7cvvFKZgGfCUKcufoLGddF82LvigVCxg1fYT3aPy5Ff0SzqTYdm
	uqdy8pwfqmBBNZzBbdfe5mQ5WvHNxd1ODMj0mqitlaR1xYUOV9bVC7Z7md5Nj8uV/0Kk4AaOeNc
	l0VMEeW1/btpue9zx7GKTOryUXdrBh7ZbEJiUQRjebhBbSy8n3iC2ZVSv6fGAYdNpPoVTxKSLr2
	23j3GUM15euS/UN+kVPG6t4GwcQ/zNUpH1+WyunToQFm4ZgUCyub+voG+nJBb9DMnYwWLDorvzP
	884439K11dMAyOJ74Nzn+YPQD1zblOzXNx7k69BOBc93UpPYaU8vmrC8jOjNhlwNFcL1tfdQTrM
	hE+BZDSmaleGTKr5Uv6MnLJEejN/BOG0W0K/bN2OEKuXmUH4jf1QXdUZb3Vp7z7yN6jbPM3hjJ9
	kqNvM4h/G/0yUU488=
X-Google-Smtp-Source: AGHT+IEn7VufH3X/Snt0k+wer96wfodht1vNouj4+3d3G8x6QoEXXbV0p2LyxrMFF5Y0Yzynwp6f4w==
X-Received: by 2002:a05:651c:508:b0:336:ca1d:2289 with SMTP id 38308e7fff4ca-3640adc567bmr554931fa.14.1758211046529;
        Thu, 18 Sep 2025 08:57:26 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99eb018sm6507591fa.57.2025.09.18.08.57.26
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 08:57:26 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f720ffe34so1283540e87.1
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 08:57:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVX5TjxX8BF7ifgTTHwtq9Kxm/dEnBrELLGC0nf/VAcz6c28cL+LQY9upGspviPonC1fQ6I@lists.linux.dev
X-Received: by 2002:a17:907:9612:b0:b10:ecc6:5d8d with SMTP id
 a640c23a62f3a-b1fac9c9b84mr417765966b.26.1758210601571; Thu, 18 Sep 2025
 08:50:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com>
In-Reply-To: <20250918140451.1289454-1-elver@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 18 Sep 2025 08:49:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
X-Gm-Features: AS18NWBk4u9ObN57KesSGhJyt-aPlWZgKdxYhvzpAyoaxlNUF53WHe4dSKjzUBg
Message-ID: <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
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
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Sept 2025 at 07:05, Marco Elver <elver@google.com> wrote:
>
> Capability analysis is a C language extension, which enables statically
> checking that user-definable "capabilities" are acquired and released where
> required. An obvious application is lock-safety checking for the kernel's
> various synchronization primitives (each of which represents a "capability"),
> and checking that locking rules are not violated.
>
> Clang originally called the feature "Thread Safety Analysis" [1],

So this looks really interesting, but I absolutely *hate* the new
"capability" name.

We have existing and traditional - and very very different - meaning
of "capabilities" in the kernel, and having this thing called
"capability" is just wrong. Particularly as it then talks about
"acquiring capabilities" - which is *EXACTLY* what our lon-existing
capabilities are all about, but are something entirely and totally
different.

So please - call it something else. Even if clang then calls it
'capability analysis", within the context of a kernel, please ignore
that, and call it something that makes more sense (I don't think
"capabilities" make sense even in the context of clang, but hey,
that's _their_ choice - but we should not then take that bad choice
and run with it).

Sparse called it "context analysis", and while the "analysis" part is
debatable - sparse never did much anything clever enough to merit
calling it analysis - at least the "context" part of the name is I
think somewhat sane.

Because it's about making decisions based on the context the code runs in.

But I'm certainly not married to the "context" name either. I'd still
claim it makes more sense than "capability", but the real problem with
"capability" isn't that it doesn't make sense, it's that we already
*HAVE* that as a concept, and old and traditional use is important.

But we do use the word "context" in this context quite widely even
outside of the sparse usage, ie that's what we say when we talk about
things like locking and RCU (ie we talk about running in "process
context", or about "interrupt context" etc). That's obviously where
the sparse naming comes from - it's not like sparse made that up.

So I'm really happy to see compilers start exposing these kinds of
interfaces, and the patches look sane apart from the absolutely
horrible and unacceptable name. Really - there is no way in hell we
can call this "capability" in a kernel context.

I'd suggest just doing a search-and-replace of 's/capability/context/'
and it would already make things a ton better. But maybe there are
better names for this still?

I mean, even apart from the fact that we have an existing meaning for
"capability", just look at the documentation patch, and read the first
sentence:

  Capability analysis is a C language extension, which enables statically
  checking that user-definable "capabilities" are acquired and released where
  required.

and just from a plain English language standpoint, the word
"capability" makes zero sense. I think you even realized that, in that
you put that word in quotes, because it's _so_ nonsensical.

And if not "context", maybe some other word? But really, absolutely
*not* "capability". Because that's just crazy talk.

Please? Because other than this naming issue, I think this really is a
good idea.

           Linus
