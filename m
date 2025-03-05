Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42DA2E3372
	for <llvm@lists.linux.dev>; Wed,  5 Mar 2025 11:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741175285; cv=none; b=D8S/9gpt+EnNVGIzICTQJIwDoPHTSIwcAfqHb/6uUuzgon7rxspOBvHKg9Lw9sKgutouc7widgrlM/r6mXxRSJuG76Tk/Vopkdpo7ynPlv1jNGx7utHWc3enSYxJkmMfjndCClnktdg41aT1S0FWP9v990FQ5+KFDGTRoexqgFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741175285; c=relaxed/simple;
	bh=cIU0nfArpsRpIKpkz74h3a5tmvFu0rT15Q3fC147Xjw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=F3cPhdGEEX1dN0waHnC8XgExAWIxkl+CApPoA32gBIc9XbahSyLgbyECt79SbWvpPii04R5TJzidMthfZytc+/T+DpYP92F906ts6xTMAnCrxrUa4gXpodfMjdrBs/FSrgYtgea/xwcX4oD5YlTmBNb/VAYfm8VPH3kp/DyMLJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zR8UDAQ/; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zR8UDAQ/"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f9b9c0088fso1300277a91.0
        for <llvm@lists.linux.dev>; Wed, 05 Mar 2025 03:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741175283; x=1741780083; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vdpd8gGK1zQz01hX1RsvtziC0TuUsfrg4ftuuNH8zt0=;
        b=zR8UDAQ/MIjfa30+LX4dBvyVWUYN98vPMnDyYv3h8FlQNMSmIlsCSnaaG9tQukZ6xL
         oHqomEs3TnIIYfE6jJ/gQxLWIt2r0sh/TZWPEKvGWgu9tJFBY1xuQaLSeNZ5CQuJezbw
         VtzjN0N/+LAmOaU6moYzNdVKII/WFwwsf1A/vZns7wWzZ8oZuIML7xGjgDrZhJ5y25IN
         gYPmimXbWXjFO99hfOUeP2qW8Fb/Om5LwzWYdZMCD8taVx9f+lOylaQnN2G0nf31LE+m
         Wae23kIxxjosKlCb9KXwAt02rJGNIJKUY9oyiBIYkrVlJ3RoL/wsbTdtCjFax9EYyUr6
         8qNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741175283; x=1741780083;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdpd8gGK1zQz01hX1RsvtziC0TuUsfrg4ftuuNH8zt0=;
        b=VrgmP1ZHnsOLyA+Uj659T35iOiATHTM7nurYe+Iq2QKJ00h9qTl4PoqySVc4pPyczA
         oGtcIXDx0qX8KzRaA0WFx9FWrysk2oEZaQI0AiV7+yK4g/xHPQRywe98qhp/OUJToYqh
         0FLGoZMBcG3tDiSbG+AGuw8kFHqGb/otu3R47OltX8fLJE2u99mxBPEP3G8tC+VhLxuc
         puhta4H5c3LXndEnfa7m5sb2HR8uNBv2tyjpU2YLtt+bEj2djHGq2JrTAHNsJZ+b+xRg
         Zbx/YvAjoKRGhBpX3UHDBrSp7xfi7RdcvZcMNv/nuR5wB2YdUJX07jLnfjroVWPR+c3z
         j4nw==
X-Forwarded-Encrypted: i=1; AJvYcCXT4OEyTnPjQUScmXE3AQhRVR8KGLCu8qa/AiW6meV795KNhM2EERc+KLubWeMAjyC0Jv98@lists.linux.dev
X-Gm-Message-State: AOJu0YwPfod+g83UFuriyoOaXs38IrNJzHZuqdGB5FS00Gpm+awyokos
	tTu0ytorpKwrmiKffQsULMQPBTdEwTg+XkccWm4IPqGJuHYgW0+S58nPi1RW9DgwmbXTEIgUhId
	b7OFtQLkQBiXsNCRVx9rxuOH3IecOwPe/Svln
X-Gm-Gg: ASbGnctLB4ImtJ7cvXP8vhE+R+5enXm7QROyzLeej2h9Ubp705IaSUyNyBMPIOWQq39
	UQ2AQmpP1SD/HGRfQr3XCthSVnb6TzbEwDe+WFcaRq+OXVdl2Qpx7B05dQc9RhaoZRiOtMQY3qH
	tvEoeYFATQAM0L6nexms283AaisqVqoHEnSgBVTgBenCCn1SIqQiwRcLw3
X-Google-Smtp-Source: AGHT+IHzOYHy0ovf+YXeayBM1BLjip1zwGH/AC5bjIDdXdU/UjOswc06Yv95htFOjsYgsNTwZdGKmUnvg952MsuY1PM=
X-Received: by 2002:a17:90b:1643:b0:2f6:e47c:1750 with SMTP id
 98e67ed59e1d1-2ff49ad5eb2mr4764468a91.13.1741175282760; Wed, 05 Mar 2025
 03:48:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Marco Elver <elver@google.com>
Date: Wed, 5 Mar 2025 12:47:26 +0100
X-Gm-Features: AQ5f1JogQdsQnocEC1TB9MHFRKr5Q4YwSRg6aeQTJT_LtU5IpbBBcQ2bRl9Qxb0
Message-ID: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
Subject: Thread Safety Analysis and the Linux kernel
To: aaron.puchert@sap.com, Aaron Ballman <aaron@aaronballman.com>
Cc: linux-toolchains@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	llvm@lists.linux.dev, Bart Van Assche <bvanassche@acm.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Aaron ^ 2,

[+Cc a bunch of folks that were involved in discussions.]

After sending v2 of the -Wthread-safety / Capability Analysis patches
for the Linux kernel [1], a number of concrete improvements to
-Wthread-safety will be required sooner or later. It is unclear if
they are blockers to the Linux kernel's adoption because the feature
is currently designed as "opt-in per subsystem", but it's clear the
current state of things is not ideal.

[1] https://lore.kernel.org/all/20250304092417.2873893-1-elver@google.com/

Peter Zijlstra's feedback:
https://lore.kernel.org/all/20250305112041.GA16878@noisy.programming.kicks-ass.net/
-- much of which led to the below requests. Peter also managed to
crash Clang, but that's probably unrelated to -Wthread-safety
directly: https://github.com/llvm/llvm-project/issues/129873

More straightforward requests:

1. Re-entrant acquires: rcu_read_lock(), preempt_disable(), etc. are
all re-entrant locks. My proposal is to introduce an attribute that
can be added to "ACQUIRE(..)" annotated functions to indicate they are
re-entrant. Release-count needs to then match acquire-count to fully
release a capability.

2. Basic alias analysis, e.g. when storing a pointer to a lock in a
function-local variable. [Complaint in:
https://lore.kernel.org/all/569186c5-8663-43df-a01c-d543f57ce5ca@kernel.org/
-- quote: "Fix the analyzer instead."]

3. Ability to refer to locks in returned reference/pointer. For example:
    struct foo *ret_lock_struct(void) ACQUIRE(return->somelock);
    struct foo *try_ret_lock_struct(void) TRY_ACQUIRE(1,
return->somelock); // locked if non-NULL
I expect this also requires basic alias analysis to work so that
assigning the returned pointer to a function-local variable and then
later use in an unlock function works as expected.

More complex requests:

4. The ability to deal with conditional locking with return values
that are not just true/non-zero and false/zero. A concrete case here
is that a lot of functions return error codes, and if the error code
is < 0, no lock is taken. If the error code is >= 0, the lock is
taken. [ Source:
https://lore.kernel.org/all/569186c5-8663-43df-a01c-d543f57ce5ca@kernel.org/
]

5. Better control-flow handling. Basic understanding of conditional
locking, which is explicitly ruled out in:
https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#conditional-locks
- however, if there's some way to even get basic support, would vastly
improve things for the kernel.

Some of these are more complex than others, and any hints how we might
go about this are appreciated. I'm happy to try and implement some of
them, but if you find that you already know exactly how you'd like an
implementation to look like, rough drafts that we can take over and
polish would be very very helpful, too!

In general, the Linux kernel has some of the most complex
synchronization patterns with numerous synchronization primitives.
Getting this to work for a good chunk of the more complex
synchronization code in the kernel will be quite the achievement if we
get there. :-)

Thanks,
-- Marco
