Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466D9248873
	for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 10:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758191874; cv=none; b=ZRJt7oFzZiY3ks/oXYZO0wEDvEgbMZuHdZaXTnda1trdBryK+JVnp4+Z3zCwE/JSGJPROC9wu0gLpiX0icyD0TPm0bDxDytnv7rM96y8hh8Yx8QDtCWW2ttQ9F5BI1rzFRt92yOHRGshQV4Iw1MT2LgWh9Rkgdadag/4aAsl5ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758191874; c=relaxed/simple;
	bh=6um3slmi/UdRhqyHUh0hJjwkZIZcZX5qZx7ZUYl8ZFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIGPknOGoAYSHdFEH86BkQ7b6Ojv4KAESsk0oJi4NSc3Rbrnq1kkzV5CMbt1JAIkjjr5mvuGrKZKRumqySU92ea3rCc+xXL9IT/iOf3XfqN+19cNHb6NAOD6noZVO0u9vCkWJhIJNe0O4i2zsYY9ychCkshrrdrhC6Cx86QRtX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XYEpig45; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XYEpig45"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2445824dc27so8072235ad.3
        for <llvm@lists.linux.dev>; Thu, 18 Sep 2025 03:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758191872; x=1758796672; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kgfdwVKOLx5vigvC1jyt2vWTJInjLO17ulCBbkvDr7E=;
        b=XYEpig45zQGWBWRFk333fefhpCk5aa11wE8RchHHW+nVFtMxsHJwdq0zx4AVWqFjPe
         jW1m40S77HoLNysUWlL+ps7Iz0Gpw9ttkq3AHsT/DPV0EW6l2OjDX3yihGyPc9pTZqh/
         EGGGIQZDlrehUIGxd35wLEFjuT80r12GpoW8bJSSQYmVGHgiHAStAzE+lI2FWhKbbPXm
         r60OqHMsfnKlg17SxNGWmXyWuD+wJK1jWvZX3dU2a+zuYyisL+TtI8mp2B1WIODAFnlz
         vLpTTxoLE5NoPVe2kLN0Alk6v9RGL7zDAJjhLXNKK77u6Q/iuCxBSrDUGo5Q9ak5ymB1
         1Baw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758191872; x=1758796672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgfdwVKOLx5vigvC1jyt2vWTJInjLO17ulCBbkvDr7E=;
        b=Jr9Jf3cSUsOW+HBxJfLGczqndNroPwmXlMfmTVldzFSW4Go41H8R/6xEGZDINl2LRn
         QRQbxOuMZ9DWtpsoH258BoUgzAH8RGLXK2UsT0Na901Fg5Lb16QpPwSXwc5ItaEeEign
         RWv++B+xJh5EttYmez5NZaWcl6LuLLx/4yj2QjHYQJximCSMGuHoLj0e3WtBVJTONokt
         duLAV0T+VjbBrZePZLF0Nu92igoWkKEhXZfR58YMgb/JKdCuBFn9dsdqXLH2Wdz7TaAi
         a+7zb4Ag0Et5++HhlZgGrlQC9wmvQPK8rArXQU/xr8OdLmYgVm+w0tQo2ChjEOTk5BN7
         BmRA==
X-Forwarded-Encrypted: i=1; AJvYcCV1NQF/QaT7T9Fj3XQYlS4VQtTYwPls9wBemYPPWFMrkQy5aI8Um9XYBfyJRl/OkD2QwGI1@lists.linux.dev
X-Gm-Message-State: AOJu0YxlJX0MXmIaZwgwT9k5lg5KWmjx6IQv73ImS59D6COwEY9Yu5hu
	FzrblDPejLdj5yso/5b+bvI8naGuusBnk1lcqkMpCGTiINjpjEeIsl+upvxcAksbhmW/unlatGf
	2+QZWt3NrYpN8SzFQ+thSDSGajBqTvZsbDDFXo79a
X-Gm-Gg: ASbGnct6MEjut943n2pcyPc9NOeZMg9bNDbsduJs6k8Pd1TPSxmEQo9coHjTef0SvzZ
	DvYt0EK0Dqcg6NUqTIDguiVWJcGor0AZCrySk6t7jNPlYNKQ4lJiF2q/H/bSEoVJmeUqc/icli2
	gKKd+jRDQK+Iz9Qx4n3bzLxwgQQxf5iCUI04Hhwjw12QRE7G7TX6vePAlpiqhaXtLT/43/irEMn
	T1A+oIL2N1OCx1l7BCIWT9M43QXsv47mKfznVXK/U5JjYn4O1VMvl0pyMLxOxMH
X-Google-Smtp-Source: AGHT+IF9AFujoQJxb+PAa8fyz2yWwvYWPCX/sV+NQ8jVRYzLV+2M0J1MCtW5jba2ZrnIW/CqF5F33CiuWVJMMxSyRiI=
X-Received: by 2002:a17:902:e74b:b0:260:3c5d:9c2 with SMTP id
 d9443c01a7336-26813dfaa52mr65420955ad.48.1758191872178; Thu, 18 Sep 2025
 03:37:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <CANpmjNPRgUz9oX0H8kza2sB847Bai4rLtqfOnUSLmqt2Zm_pqA@mail.gmail.com> <CANpmjNMCY94VxH1Qo802pPjZ6X5i22sL9CO0ChFLS=q3Rx4CAA@mail.gmail.com>
In-Reply-To: <CANpmjNMCY94VxH1Qo802pPjZ6X5i22sL9CO0ChFLS=q3Rx4CAA@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Thu, 18 Sep 2025 12:37:15 +0200
X-Gm-Features: AS18NWBDsBvxf6yzeKUtIN560fE_aXC2hprKlmwGhSN_8WK6azuQlNwYDO-QSkw
Message-ID: <CANpmjNPVBApJDUEX8kEkdBHRKODTTTotEsoif7tJemDRfPtW1g@mail.gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
To: linux-toolchains@vger.kernel.org, llvm@lists.linux.dev
Cc: aaron.puchert@sap.com, Aaron Ballman <aaron@aaronballman.com>, 
	Peter Zijlstra <peterz@infradead.org>, Bart Van Assche <bvanassche@acm.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Jun 2025 at 14:44, Marco Elver <elver@google.com> wrote:
> On Mon, 5 May 2025 at 15:44, Marco Elver <elver@google.com> wrote:
> > On Wed, 5 Mar 2025 at 12:47, Marco Elver <elver@google.com> wrote:
> > [...]
> > > 1. Re-entrant acquires: rcu_read_lock(), preempt_disable(), etc. are
> > > all re-entrant locks. My proposal is to introduce an attribute that
> > > can be added to "ACQUIRE(..)" annotated functions to indicate they are
> > > re-entrant. Release-count needs to then match acquire-count to fully
> > > release a capability.
> >
> > FTR, reentrant locking support is taken care of:
> > https://github.com/llvm/llvm-project/pull/137133 (should land soon).
> >
> > But I think we need at least #2 (basic alias analysis) as well for
> > things to become tolerable for the kernel side. And that one looks a
> > bit harder to implement in Clang, so it'll be a while.
> [..]
> > > 2. Basic alias analysis, e.g. when storing a pointer to a lock in a
> > > function-local variable. [Complaint in:
> > > https://lore.kernel.org/all/569186c5-8663-43df-a01c-d543f57ce5ca@kernel.org/
> > > -- quote: "Fix the analyzer instead."]
>
> There is hope: https://github.com/llvm/llvm-project/pull/142955 - but
> it turned out to be "too easy to be true", so who knows if that'll
> stick.

This got merged and it seems to stick.
Intel test robot's bleeding-edge Clang version also picked it up
already, and if I expose it to this tree here:

  https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=cap-analysis/dev

It seems happy.

> > > 3. Ability to refer to locks in returned reference/pointer. For example:
> > >     struct foo *ret_lock_struct(void) ACQUIRE(return->somelock);
> > >     struct foo *try_ret_lock_struct(void) TRY_ACQUIRE(1, return->somelock); // locked if non-NULL
> > > I expect this also requires basic alias analysis to work so that
> > > assigning the returned pointer to a function-local variable and then
> > > later use in an unlock function works as expected.

I don't think this is going to happen, but with alias analysis we can
emulate this with a macro (see __acquire_ret helper).

So all in all, this might be as good as it gets for now from the Clang side.

Patch bomb away?
