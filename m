Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F02936D4EF
	for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 12:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769774733; cv=pass; b=mLzoe+zVxAD0nVooLCueT9YoHLdlapj5HH7wZlWSNAGoXDNlgUSjKXjbFSaSeKhdkJbAzH+nsCHCJ6nk3kt+CHP4cjcGHgdMzZkkTXogHyspR1JeotLipO/IA4E52e6K5X4zsoV+UkJhF0Ae74TdshJD9OqMWQ+MQDEbY4iIgbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769774733; c=relaxed/simple;
	bh=QbV5ZM+xXUpBx7Dyu2SFGPdnLdCzZf39HnqRtAhIgcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxZ5iDT/AeTIgFIkPT2LTkoxj44pgNOUraV8gPIHFXBk1HBM4gO/awt/j56m8G6eq6nFSVFW4HWf/PMPf5HQx0eXql9v8HxSqL2YaxtTjd+gAcNHJPaEYh9bxTYf5ADxKGSrpzgcNkckf572jAmI2CySoRIf+rTricZdjD0EPE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AjlF7AfP; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AjlF7AfP"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1248d27f293so2523358c88.0
        for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 04:05:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769774731; cv=none;
        d=google.com; s=arc-20240605;
        b=KnC2X2220WNJqgnOAk+kJ2L/wLhT4NxUCD7a87GotC/cCMY/4Xacv3K/lw70yBm4e9
         ut7iIOoGmivUoL5UO52LsVBbVGxZdTmAjyXAWIEOXyA1+J7o6b0bd5vl8t9kXs9QJEH1
         BoeyoO7wiHAYBduoD2orgm+SpJDB16fL3mb7/WnTppgVJX4MQk3Eud12uUhn1FmwzUMz
         Y4GTsdf1SlJpE+C3P3Z9K8rw2GH/fLu3ItZTVb76yYYDc+Ld/RQ+l78aoVVbJ6nw11aM
         EaDTnB/r80BCdTr3Qg/4RvAdnAMx2Zu3Y5XfR5xNNC3B2GpeWwcpya801h5rtakSxphD
         6Kdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XQjNjAE5Q1B5SU0KSLnPGrt3o0FUeKh5OiAeQmMY6aE=;
        fh=wO6TQY2xErEBsTgr7h/JLk+WFsj6KFy+LyCrHnykhKI=;
        b=TSKjE9Dam62ShByQkJ8Lv3qRUlB4ba4ljqlRpGUfJGTAxpShcLPLk0ZiQ960yXj5ES
         5kJ3wZBoELmcN3x9kvvh48yJmknEwaGa/GmNRXCQsVPlllYol25olei6ZNvDjjSZwCZa
         eSUoASzv5ukwz4FLldqX6ofbYxDRD8p2fN8Gnvv9878jqlxucFYlxMlOIC3gzb477oyw
         djoHq1kqen9R7NsR0+mevIMIvOC6P2pDPPPZeW76h6ECcrNcEuEBRsPhgI8DbTUjDj1i
         ku0Y/LyihO2+iBrbDNEniRmzYz/AbIPiVCxgREzRIBQVnO6gYo/ZKwyzhYnXpy5lj4Pd
         w0gg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769774731; x=1770379531; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XQjNjAE5Q1B5SU0KSLnPGrt3o0FUeKh5OiAeQmMY6aE=;
        b=AjlF7AfP6vChQ/p+IHKrXvwzjCPCVoW5t7E/Nsw2wPEkeTQJCs2g1m2eBmvyrC9MZu
         ymy+9TPMqkMRG8Aq/Lg9CWcc/sdqdKUweU09wJYPwsIvseF+4t6rOwYUnP1vYGK97b/8
         SmaOqwjqSA5lx3jMyxiUaiaAFUaOsCGC5rEAtawvRIYIpKdMKRcqfNVLcOIxpgd94UTF
         Cz9jUs4aCLlrtMc8lDyj34+tN+jroyw+U6w21bndoZB7SiCXeQRzY0w7hGPIH5jUyp5N
         AN6NlFO9x6Yz3K6VLwmoUYXjM5eGM1/2g60wLAlaWjF+wmIxNs1pWRkF+6E9nfzRZKXN
         gxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769774731; x=1770379531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQjNjAE5Q1B5SU0KSLnPGrt3o0FUeKh5OiAeQmMY6aE=;
        b=X7+Rnq3UwLlYfMUuUl2aFlpcW5U0uLpjhCvNErMmh4W7maEP1o2ETaQkc887kvDwa4
         hhkweYB4jY9py4bwEEAWvP1vCJGZSvRZOWEc31F+mbkwpUTt3dXkV8OcrkrcZ+KfTPJk
         8TzV3RGZMrJdCrtEg9BctYR2Ut1uzT3x5AplhlLTGMsB19jOFEXn2oPw5hC4nanNqv1M
         BpA3XsGIPO2Cxh5i2vsFhAqsVW28bnSVqNffGYlGWinhwG6iHowXIj6cnTUt+hGmForO
         L6YYg4mbfinKE/9RDjMpc+9YK6QZtlkVaZ12w+DdN3bkKkTKGYqsgb/Dvf6lGaNKmMog
         uXHw==
X-Forwarded-Encrypted: i=1; AJvYcCX4esV/RhmY9SBqjE7QvOFufFw81qUb/6pjSdqCuNak1kEYNSRIRMSfs1V2PygvY1FbSnI4@lists.linux.dev
X-Gm-Message-State: AOJu0YyiBk5s1fdFgrKksiq5SGSadEF3I2Ma6RTg22F1g3gmHtV4BtbB
	TKP05QnjWoEwRbW3fMRsfsqLE9j4FdWspZthG/Ga2mOU2ljHMwFOfm/8E5osjgN0YjbgjiTnE5a
	HLTtVTwhUGlOO4f7cRhkXdQTtDEoV5wtKcgsRNqcJd7CNiJGtDTdx17V6
X-Gm-Gg: AZuq6aIQdaJHpmz2oLuEg8M1fvuPj2onIpEoBkyV/okClEF8KqjN+0p8LQMvu69bRKw
	BwvYUJHtseYQRicsGyTbNSL0x+gA0tjHBXPAEVDj8fKMo0BYqRWnedLrU6JEE2IobOFfn/vBffZ
	6ecVCDCQBc9naTW+XxgZQl+Ve3jX/98cs1V+PY/XWgikKuc75FN5WyCnyxYbVC7Vp/yXls/dXH4
	k6ZFzWgDIS98F28Prbxi56prQE936j96i6zbsPM3lwJFsRxCiqkTUPBXLD3Lt027k19eqytNNvU
	hck1V2u0jLriw6nRV9cSw6XsHCA=
X-Received: by 2002:a05:7022:660a:b0:122:153:d161 with SMTP id
 a92af1059eb24-125c0fa713cmr1267052c88.17.1769774730831; Fri, 30 Jan 2026
 04:05:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260129005645.747680-1-elver@google.com> <20260129005645.747680-4-elver@google.com>
 <20260129095219.6a3b8dc8@pumpkin>
In-Reply-To: <20260129095219.6a3b8dc8@pumpkin>
From: Marco Elver <elver@google.com>
Date: Fri, 30 Jan 2026 13:04:54 +0100
X-Gm-Features: AZwV_QgCEUOQyaM6FamGIBtoY0m3tlb8ivndN86S9L9oQ2RkXeS3PyM7AKCtSe8
Message-ID: <CANpmjNMMueMWBKXEyu8Bj69Mdj3CAgnu8DiSW2PY8MWmUap=Vg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Jan 2026 at 12:31, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Thu, 29 Jan 2026 01:52:34 +0100
> Marco Elver <elver@google.com> wrote:
>
> > When enabling Clang's Context Analysis (aka. Thread Safety Analysis) on
> > kernel/futex/core.o (see Peter's changes at [1]), in arm64 LTO builds we
> > could see:
> >
> > | kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> > |      982 | }
> > |          | ^
> > |    kernel/futex/core.c:976:2: note: spinlock acquired here
> > |      976 |         spin_lock(lock_ptr);
> > |          |         ^
> > | kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> > |      982 | }
> > |          | ^
> > |    kernel/futex/core.c:966:6: note: spinlock acquired here
> > |      966 | void futex_q_lockptr_lock(struct futex_q *q)
> > |          |      ^
> > |    2 warnings generated.
> >
> > Where we have:
> >
> >       extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
> >       ..
> >       void futex_q_lockptr_lock(struct futex_q *q)
> >       {
> >               spinlock_t *lock_ptr;
> >
> >               /*
> >                * See futex_unqueue() why lock_ptr can change.
> >                */
> >               guard(rcu)();
> >       retry:
> > >>            lock_ptr = READ_ONCE(q->lock_ptr);
> >               spin_lock(lock_ptr);
> >       ...
> >       }
> >
> > The READ_ONCE() above is expanded to arm64's LTO __READ_ONCE(). Here,
> > Clang Thread Safety Analysis's alias analysis resolves 'lock_ptr' to
> > 'atomic ? __u.__val : q->lock_ptr',
>
> Doesn't the previous patch remove that conditional?
> This description should really refer to the code before this patch.

Will word-smith this a bit. But this refers to the state of where the
original issue was found that spawned all this.

> > and considers this the identity of
> > the context lock given it can't see through the inline assembly;
> > however, we simply want 'q->lock_ptr' as the canonical context lock.
> > While for code generation the compiler simplified to __u.__val for
> > pointers (8 byte case -> atomic), TSA's analysis (a) happens much
> > earlier on the AST, and (b) would be the wrong deduction.
> >
> > Now that we've gotten rid of the 'atomic' ternary comparison, we can
> > return '__u.__val' through a pointer that we initialize with '&x', but
> > then change with a pointer-to-pointer. When READ_ONCE()'ing a context
> > lock pointer, TSA's alias analysis does not invalidate the initial alias
> > when updated through the pointer-to-pointer, and we make it effectively
> > "see through" the __READ_ONCE().
>
> Some of that need to be a comment in the code.
> I also suspect you've just found a bug in the TSA logic.

Adding a comment. From a soundness POV, yes it's a bug, but I think
reassigning a pointer via a pointer-to-pointer in the same scope is
just pointless, so I'm willing to keep this as a deliberate escape
hatch (might need to add a test to Clang to capture this and discuss
if someone wants to change).
