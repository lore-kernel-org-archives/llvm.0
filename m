Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B8A1FECCB
	for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 19:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740167244; cv=none; b=uiGeEunMK9rBIw0vogNhSRiAPS1lwx7P8cBfMlSmXuHcjG18T6unY9yoCUKrySP22uBhSU4mokB0dI26ocwv2CkPaY32ibijWF1LC+2SF68CkfhAf4J99N8rcgP/yXYpIMhYuMr79XxwQiMlbzP3fADRGyewrcjtIiA6jKwlr+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740167244; c=relaxed/simple;
	bh=ncoDsRKjh28vVH6GzAvugCMHO3v1MHxTwR6FKJOs+vU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBrQ4CYRvshivktVwMqNvS0wlejoWaTwFjGfgIxf6o9nOs2n08CC00S098fI8p8dZjGcR0zwo8BZB5h+5RxNPiEs1mX2PRrQru6IBb6Vxhb8RnSRD0KkrzRh7oExhVm9NKh3muwwOV0mk1xotMn336MFE054cA1hL00TQJSowK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W+fWtloL; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W+fWtloL"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fc0bd358ccso5158895a91.2
        for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 11:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740167242; x=1740772042; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ncoDsRKjh28vVH6GzAvugCMHO3v1MHxTwR6FKJOs+vU=;
        b=W+fWtloLpl9zHki2saO8+14obVtvt2vRbSbllrYT75jzCRjfTNeAleTSMK4dIhd8bP
         9FmU0PtVaNd5ja0Z35cLgKdHQLzyslj8dXNTkL7p9SLwM2vcUfvjwJarMddo3JRKoSDs
         Jf4p/kpHC+pbuajQMxR9ct8TA0AD57pFVW0gY0pZ0pb8SKYNVycb4b8uTayBk3eEp7b5
         2AV3WG8e2BrzMH2LfK9yNGLjR0xw4HZqI8/Q0lfqFW6SH30CzFmH4aelbcdfI+28FdJ1
         UJAaqnc2bmvk49us2Xnol3sZo+/g0KV15dQvY7ng++mWu+xLQC/rjK/ZrvPmtQys5V2W
         lY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740167242; x=1740772042;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncoDsRKjh28vVH6GzAvugCMHO3v1MHxTwR6FKJOs+vU=;
        b=Jt1AeZmRrh619WeqAhRI19ghzHHztwsQgXAJf6Emuw7oGN4A/taSmlP2gJ9gwmAMNg
         jVcqAzwo4aPetGezEp8FZ6wJwVwN4vOyJ1r8tuLDJUc69cHsiudwRBnTZRS9jM0p38Y9
         a3rrGDdeO1lPWevwNTP0riC2IEc2pzfVwsc/gdkItt7RYZ249LsoODGNVcQJHbRuv3W8
         LDpRlOb8YALzYgB0LET4dEJknExPTRnvCMbw8tU4cFQM/ACOdPHBTiAL+D6OmtIFZbSz
         wDVMTutRH2aq9VfGPKQrhL32GRRlsfbqjp+m0E2MeM7G9eQ/1iDlRixl7AgOieC/TE1b
         0OJw==
X-Forwarded-Encrypted: i=1; AJvYcCWK0gUsagFcHSAqfFFor7EiLFQCkCRqEMKNEiIeh5pQ17kzvJ5rfk17fXZRXmEZdK2llm7L@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5+ex4Os6IK85QAR5WJbyGOd6N4D2ni7uVv/kUkeV74lRj9QrH
	A0B9f6no6jtEnvpUO6btuVWir+R7cJTGQEUN2QN5dv3+s7/zYGQNrzcWNwcg/PJu02Q2ZdaiUW+
	eeAJTkAGk4IzKkET9OZ+6K3ejFI2/8lhHXecy
X-Gm-Gg: ASbGncsHZbDUUhLjYgMv+eRtMGNaj7cP/wRzoAk9e+RljSkgWeW2mqpEHei65nyAN6d
	lBgO1o09UNfPZoLeKxIS0eDJ9o6CVtoeMOviSiPdriG7kI8NDUkJvHMiljBwzK2CB4fB0L9lD+c
	1aYG30CYc3gW3rgnIFXyMauTeR3BlzaxLVPmE2XWQ=
X-Google-Smtp-Source: AGHT+IGtec9D57fNEpwTOF5VC56kG+DMvBkePfQGlMMOOM8lBQqp82lJKRrsNscMiVitOb/6ZYzBRGWC+K08kh5F0Y8=
X-Received: by 2002:a17:90b:2252:b0:2ee:9b2c:3253 with SMTP id
 98e67ed59e1d1-2fce7b26274mr7182179a91.30.1740167242446; Fri, 21 Feb 2025
 11:47:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206181711.1902989-1-elver@google.com> <20250206181711.1902989-16-elver@google.com>
 <a1483cb1-13a5-4d6e-87b0-fda5f66b0817@paulmck-laptop> <CANpmjNOPiZ=h69V207AfcvWOB=Q+6QWzBKoKk1qTPVdfKsDQDw@mail.gmail.com>
 <3f255ebb-80ca-4073-9d15-fa814d0d7528@paulmck-laptop> <CANpmjNNHTg+uLOe-LaT-5OFP+bHaNxnKUskXqVricTbAppm-Dw@mail.gmail.com>
 <772d8ec7-e743-4ea8-8d62-6acd80bdbc20@paulmck-laptop> <Z7izasDAOC_Vtaeh@elver.google.com>
 <aa50d616-fdbb-4c68-86ff-82bb57aaa26a@paulmck-laptop> <20250221185220.GA7373@noisy.programming.kicks-ass.net>
In-Reply-To: <20250221185220.GA7373@noisy.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Fri, 21 Feb 2025 20:46:45 +0100
X-Gm-Features: AWEUYZkA99crBxIegh1gRRcMrAoKxxzyxwRGmWJRS2whchm4-Eofmj8EM7dMgko
Message-ID: <CANpmjNOreC6EqOntBEOAVZJ5QuSnftoa0bc7mopeMt76Bzs1Ag@mail.gmail.com>
Subject: Re: [PATCH RFC 15/24] rcu: Support Clang's capability analysis
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org, linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Feb 2025 at 19:52, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Feb 21, 2025 at 10:08:06AM -0800, Paul E. McKenney wrote:
>
> > > ... unfortunately even for shared locks, the compiler does not like
> > > re-entrancy yet. It's not yet supported, and to fix that I'd have to go
> > > and implement that in Clang first before coming back to this.
> >
> > This would be needed for some types of reader-writer locks, and also for
> > reference counting, so here is hoping that such support is forthcoming
> > sooner rather than later.
>
> Right, so I read the clang documentation for this feature the other day,
> and my take away was that this was all really primitive and lots of work
> will need to go into making this more capable before we can cover much
> of the more interesting things we do in the kernel.
>
> Notably the whole guarded_by member annotations, which are very cool in
> concept, are very primitive in practise and will need much extensions.

I have one extension in flight:
https://github.com/llvm/llvm-project/pull/127396 - it'll improve
coverage for pointer passing of guarded_by members.

Anything else you see as urgent? Re-entrant locks support a deal breaker?

But yes, a lot of complex locking patterns will not easily be
expressible right away.

> To that effect, and because this is basically a static analysis pass
> with no codegen implications, I would suggest that we keep the whole
> feature limited to the very latest clang version for now and don't
> bother supporting older versions at all.

Along those lines, in an upcoming v2, I'm planning to bump it up to
Clang 20+ because that version introduced a reasonable way to ignore
warnings in not-yet-annotated headers:
https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/commit/?h=cap-analysis/dev&id=2432a39eae8197f5058c578430bd1906c18480c3
