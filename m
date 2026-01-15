Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4873C1981
	for <llvm@lists.linux.dev>; Thu, 15 Jan 2026 17:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768499952; cv=none; b=AiHrOLcqKh2VBIC3D3kVFFQ87ynGJfYBf2XyCP5vNd5LIY8gXtiWtg4b9i/0aUuqDgTjExmrHXDib/SKQwYY1mj6JH3YSeYDlvWp/ajQLRCdZFgk/DPfc0vMuheYqk6GulMXkxJrr5TDcTZ7hkVKy1jPk3YtsxDI89RUuFwF5SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768499952; c=relaxed/simple;
	bh=NsBDYooLKE6NeEiuyPxKwgQZEl1NDo0JaFDK/ak2BcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FinvspxjkxRAaoxT3yEgzI1kHDxDpeg9dOPoJv6NftAraYS/id2n0feC1K39tfK4t0DSqq0A1YTWtnlouddVHGz4rawYhWHcqzO1fq4d/PSLdcEn1Sy6FwblI1BgKTlIViULe0kMCX9WNeIYTx/RLeJURkaJ5RQWfHZPAxTxEcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GYg7Qb5+; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GYg7Qb5+"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-11f36012fb2so1824657c88.1
        for <llvm@lists.linux.dev>; Thu, 15 Jan 2026 09:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768499950; x=1769104750; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5J7FpoDsTG3GOj5yHxIG+LKeTzQKEioq9V+WurN7V4E=;
        b=GYg7Qb5+zdeDOGqX7pi+1i5mZG9xLFinb2XqcJ6kA1OGH1adnlDhqGW/nBLiBb84NX
         dnIf35oGJj49ofdRrzhG1S9DvfhpTAm4l7cBGSLLc+nexXGDZnWTNevd1yMlW6sTMiTh
         lvnlYkqrXOu9GWeGT4oyZfKe5Ks8SGPopb2XDrKkW2E8FiwMpH1WoWC0PtEy08Ovwj9N
         Y1hGkzAlMVrUGofcTyi4BMBYU20ZH4OCF1CEZFQqJhkX8UlsUvCTDwIkcfjamScuU1ZW
         gf2PFjt75E0BNsfNTUnxUUVGKq0i99hrIkYpt74wm2o4hi1RsSlVL9H3n/E60Rb5mD24
         mRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768499950; x=1769104750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5J7FpoDsTG3GOj5yHxIG+LKeTzQKEioq9V+WurN7V4E=;
        b=GBiPIn5OHsItCDpXTzfgq8zVa3OlzZaQPytJ3zkTM2ooHAWxYXLFcx7zyRZtwOTWsB
         EAhKAW11AcoGcdUUI+E3HnFJiTb4n7rgzasa6n0jbStt1yBwilycpkDS0muIN9kQv2PH
         8CkMIu17ZoEicw+Ibeo4DgnBU7JaX1FWHFJaCu5v3iuXw2iL+7EXwiOigIo6XjCgUr/b
         tJC/o8IAfuBvJ3ol0TlF2HOqfq6XXsigpdCDJrf5KHNLC870I5p/nD+suFDKd5qEkXor
         BS6FHoLSfRBNX6RIvyWOZPlmXKqrvns3s0AF6thffnPQhkIdCQNrnjS/rLpoiY9AfoYs
         AHXQ==
X-Forwarded-Encrypted: i=1; AJvYcCULkRcE3LDnLfI4l45fawTJ57nYxQc2z4r/TWgaAP/didluKfeg018bIT9RDZPDaiLad+JX@lists.linux.dev
X-Gm-Message-State: AOJu0YxwbdtFTwNPhzsS47oYCN3zMKsmfEpwLv9cJQHNc2UB/OfKkQmM
	ZEqzBBEV0UDr9Fk4Tuq0Qv5ElztIJF2Z6jDTcbVWCttHBhXu3ZMEP2h2WjgFzK4oWbjaKv9kT8P
	jU+1Uk/TcL+5RjshRrEHVMA2hSYVEeBwzB1+F8VDT
X-Gm-Gg: AY/fxX5+L4noDJsm/YBqe/pdznoUZlaZ05+zD6+QHVgggXFauZGGQj0JErnfz/5C60e
	2yUGSQX0XUctD6+o6DRR8ZlhilrVEriyX/N/xR6xlSC43e1E4pdM4+KNMCxi7PLYlDCD8C2d0Jb
	9/8hobyW42AiBEXJYNsTqiCEbE/sI3e/WCquUQBFtxO7Nz92oGR8r8J5w9dXAD9nTU/wJg1hY7N
	O2w1gqdiAvtjXpCFXhIoG8Wv1ksT+H0fJQkgeZdgSWitW1z2NxFW7rZfZlHYkuMwfXJTavTkAJq
	HvyDd+6+fd6W4lp+h0rW2Ida2sc=
X-Received: by 2002:a05:7022:128e:b0:11b:d4a8:d244 with SMTP id
 a92af1059eb24-1244b322719mr67260c88.16.1768499949666; Thu, 15 Jan 2026
 09:59:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115005231.1211866-1-elver@google.com> <c708b1c5-1165-47e6-a93c-54b2928716b6@acm.org>
In-Reply-To: <c708b1c5-1165-47e6-a93c-54b2928716b6@acm.org>
From: Marco Elver <elver@google.com>
Date: Thu, 15 Jan 2026 18:58:32 +0100
X-Gm-Features: AZwV_QhqzCQj3XDT0v63LvoBq6hGt-bkYwg2GnYoMwUZyCExXAbTIY1O3rTEEJs
Message-ID: <CANpmjNPm5861mmHYMHoC9ErRfbLxmTy=MYwfsGC-YTpgP+z-Bw@mail.gmail.com>
Subject: Re: [PATCH tip/locking/core] compiler-context-analysis: Support
 immediate acquisition after initialization
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Jan 2026 at 18:22, Bart Van Assche <bvanassche@acm.org> wrote:
> On 1/14/26 4:51 PM, Marco Elver wrote:
> > To do so *only* within the initialization scope, we can cast the lock
> > pointer to any reentrant type for the init assume/assert. Introduce a
> > generic reentrant context lock type `struct __ctx_lock_init` and add
> > `__inits_ctx_lock()` that casts the lock pointer to this type before
> > assuming/asserting it.
> >
> > This ensures that the initial "held" state is reentrant, allowing
> > patterns like:
> >
> >    mutex_init(&lock);
> >    ...
> >    mutex_lock(&lock);
> >
> > to compile without false positives, and avoids having to make all
> > context lock types reentrant outside an initialization scope.
> >
> > The caveat here is missing real double-lock bugs right after init scope.
> > However, this is a classic trade-off of avoiding false positives against
> > (unlikely) false negatives.
>
> The goal of lock context analysis is to detect as many locking bugs at
> compile time as possible. As mentioned above, with this patch applied, a

An analysis that detects as many bugs as possible is useless if nobody
wants to use it.

> class of real bugs won't be detected: recursive locking in the context
> of the initialization of the synchronization object. Hence, I think this
> patch is a step in the wrong direction.
>
> Even without this patch there is a class of locking bugs that is not
> detected, namely unpaired synchronization object release calls in the
> context of synchronization object initialization. An example for struct
> mutex of this type of incorrect use of the mutex API that won't be
> detected even without this patch:
>
>         mutex_init(&mutex);
>         ...
>         mutex_unlock(&mutex);
>
> My preference is to remove __assume_ctx_lock() from mutex_init() and
> similar macros in .h files and to add __assume_ctx_lock() explicitly in
> the .c code that needs it. This will reduce significantly the chance
> that the locking bug mentioned above is not detected at compile time.

It's the fundamental mismatch between our philosophies here:
completeness vs. soundness, where I'm advocating for the former
(compile most code with few changes) and you for the latter (detect
all bugs), where one or the other approach trades false negatives
against false positives respectively. Our experience with kernel bug
detection and analysis tools (KASAN, KCSAN, KMSAN, UBSAN, syzkaller,
syzbot) has shown time and time again that false positives or an undue
amount of churn (in the form of awkward annotations) on developers is
not acceptable -- I tried hard to improve ergonomics and avoid false
positives of the current context analysis infra -- and the necessary
trade-off are all too often more false negatives, yet at the benefit
of resulting greater coverage.

For the patch in question here, I took Steve's comment [1] to heart:

> If tooling can't handle a simple pattern of initializing a lock than
> taking it, that's a hard show stopper of adding that tooling.

[1] https://lore.kernel.org/all/20260109080715.0a390f6b@gandalf.local.home/

A corollary of this would be "If tooling can't handle a simple pattern
of initializing a lock and guarded members, that's a hard show
stopper". So we need to support both: initializing guarded members,
and being able to take the lock after initialization in the same
scope.

And to give you a bit of compromise: As with other tooling, the more
pragmatic approach is to claw back soundness once coverage and users
have reached critical mass (months or years.. hard to say).

We have to walk before we run.

Thanks,
-- Marco
