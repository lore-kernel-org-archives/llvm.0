Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBED1B3930
	for <llvm@lists.linux.dev>; Thu,  5 Jun 2025 12:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749127486; cv=none; b=CFboG+EYHYKdnXlBDR7cS7yu22lDfn+TTrXcXn3jdKZpWwVREA6xkDGPdFZC0cVhBc9uxBgzg+qQzrN8wh0eQJw3NWm/hkijI5BO9kzi09Wz6x7lrAP1Uvhn8MnpyZj11ShNP2HOre8bWWuaUnPDH6YOPmfq5kHnwFhTXJ5Gw/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749127486; c=relaxed/simple;
	bh=LPjSqd1arO3ae+RE2dI6IlsG2/fm+cR8j1uycGYsSxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNLolQpzS1+OdAkV9AXTrkPVmozqOBFTjfCQGv2l0z/lvyNXC2RYHruSmtlJxB7lHbrmVSLJVn5rlLz3xDawZ8evT/j0dP+fJxMAmvsJ1cWFfeXYiFnTMX9yzEifPLYMz7hYfhKzX06167ATKQJXk8Kj7p8eIQfUXCTTdv0W0v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CLNll78i; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CLNll78i"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso686069a12.2
        for <llvm@lists.linux.dev>; Thu, 05 Jun 2025 05:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749127484; x=1749732284; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RmtZfxKybWvYJ6qI7WFSQXtodHIM/sbfg14YLjJ49tU=;
        b=CLNll78iczdi8xQ9rb/ukBAd1MqKJF2zODvKHaxOTRgyE7x96jfJO7HoCyZtxW9ClT
         XDZ1/nX9OssSlWO4a35BCGUMkZ4Wt66Vz9DddmhCANjX+DhpfA5x04qeloNUUUziLv55
         XCnYFfAvFLPzArWmBwhi79770rPdbenn3oQPewvi7ZocMW6QYIk1HAhlgE/WuZpVyyqv
         pudcqunsxuOdPu9zJlkHx22h7scv4301Yr1dK1kjOZE3OFCuX1BAzLFdpUiwmE/tXADb
         14Jm93Q5jAeRfsMth48nSdeg1vrOH1wpSgjK96iJhVDxwDIegYCXgxuDc8nEdKZ1Ss9+
         6+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749127484; x=1749732284;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmtZfxKybWvYJ6qI7WFSQXtodHIM/sbfg14YLjJ49tU=;
        b=sKX3KtHorNTegVRvRI4RVq6MVYalrmutNs/FmRURT5X5arotTM62jVO6gdvL71Vbva
         /TOti8Pe/WdBEcAbE1pTHo2NWYOUsMbWY9C9GBif81Ys8zKz0CnjF5KryDO1BwT9GUq+
         pQFlBrvxdtJQPMlE4VYynFya7sSqA/NfELsCDitTrPraldB1hWSvZmsIWXuYtxpqvdNI
         vICI75tR+aNsqDAuxx/F6wDcsIjFg10eO8UuJZSIU7U8A8WPYtBo8T+ePyR8Tqb6L1fJ
         97mOrFLWvz56azIudnlfZVVN3IMDGydiUbrhTmBGKJDHr+aIPkyRDLu3x9839Tvk+JkI
         EN6w==
X-Forwarded-Encrypted: i=1; AJvYcCUhbFK5XWJqdvyq50ezQ3n0NarXkkMQcAwJ9n1sQsnMzdVSnF9TOVDmcaNFyMtaFSSwvvEM@lists.linux.dev
X-Gm-Message-State: AOJu0YxE9d3MTlrrT9mkET3x+IQN5HZP3f7nEbxtw7XFmua6yevS2wEV
	GTIE5GZCIgpkZst0SsohVLFp74uhwzH3fCdC2aGSah1SbI3s9uDIjuAu6PpHGmCTFiTtTRDZo3y
	1yghyFWLv1WIV2k8grERwmUoxJylio5cVHR7eF8yI
X-Gm-Gg: ASbGncsuxENQe+/XyS8Zjvsb9WOHqwXmAawoCvCC5UEBU1zP2UtPw4w0NZsFwpLNUMl
	pH/Sq7h5+o7Klvz1xNg7ug86KAnVq5tINw6sfd5VlVytVdLkWRF/qyi2POmq9IdRDKRV0fFSUp+
	/8gqeX4aLtJqUVM0NOBGwdhNCK3GqOVXutyKBQvfyWfdvoOdN0w80omBI2+l7Ks118X9mkZ24m
X-Google-Smtp-Source: AGHT+IFrgP9X9ALH2S2djXK6f+vb0Dbemd6I7i8tj8MWm6LWG8Gqeabg5N2rlzpVYabY7V+2PYpkeB6rtMbEMrIrjoY=
X-Received: by 2002:a17:90b:48cc:b0:311:2f5:6b1 with SMTP id
 98e67ed59e1d1-3130cd3c193mr8192812a91.22.1749127483946; Thu, 05 Jun 2025
 05:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <CANpmjNPRgUz9oX0H8kza2sB847Bai4rLtqfOnUSLmqt2Zm_pqA@mail.gmail.com>
In-Reply-To: <CANpmjNPRgUz9oX0H8kza2sB847Bai4rLtqfOnUSLmqt2Zm_pqA@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Thu, 5 Jun 2025 14:44:07 +0200
X-Gm-Features: AX0GCFttp5SAAv40grFvfCdhHPY0bJ6ZOySNqoem4diDwmODqns97rIqyF8XWIo
Message-ID: <CANpmjNMCY94VxH1Qo802pPjZ6X5i22sL9CO0ChFLS=q3Rx4CAA@mail.gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
To: linux-toolchains@vger.kernel.org, llvm@lists.linux.dev
Cc: aaron.puchert@sap.com, Aaron Ballman <aaron@aaronballman.com>, 
	Peter Zijlstra <peterz@infradead.org>, Bart Van Assche <bvanassche@acm.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 5 May 2025 at 15:44, Marco Elver <elver@google.com> wrote:
> On Wed, 5 Mar 2025 at 12:47, Marco Elver <elver@google.com> wrote:
> [...]
> > 1. Re-entrant acquires: rcu_read_lock(), preempt_disable(), etc. are
> > all re-entrant locks. My proposal is to introduce an attribute that
> > can be added to "ACQUIRE(..)" annotated functions to indicate they are
> > re-entrant. Release-count needs to then match acquire-count to fully
> > release a capability.
>
> FTR, reentrant locking support is taken care of:
> https://github.com/llvm/llvm-project/pull/137133 (should land soon).
>
> But I think we need at least #2 (basic alias analysis) as well for
> things to become tolerable for the kernel side. And that one looks a
> bit harder to implement in Clang, so it'll be a while.
[..]
> > 2. Basic alias analysis, e.g. when storing a pointer to a lock in a
> > function-local variable. [Complaint in:
> > https://lore.kernel.org/all/569186c5-8663-43df-a01c-d543f57ce5ca@kernel.org/
> > -- quote: "Fix the analyzer instead."]

There is hope: https://github.com/llvm/llvm-project/pull/142955 - but
it turned out to be "too easy to be true", so who knows if that'll
stick.

> > 3. Ability to refer to locks in returned reference/pointer. For example:
> >     struct foo *ret_lock_struct(void) ACQUIRE(return->somelock);
> >     struct foo *try_ret_lock_struct(void) TRY_ACQUIRE(1,
> > return->somelock); // locked if non-NULL
> > I expect this also requires basic alias analysis to work so that
> > assigning the returned pointer to a function-local variable and then
> > later use in an unlock function works as expected.
> >
> > More complex requests:
> >
> > 4. The ability to deal with conditional locking with return values
> > that are not just true/non-zero and false/zero. A concrete case here
> > is that a lot of functions return error codes, and if the error code
> > is < 0, no lock is taken. If the error code is >= 0, the lock is
> > taken. [ Source:
> > https://lore.kernel.org/all/569186c5-8663-43df-a01c-d543f57ce5ca@kernel.org/
> > ]
> >
> > 5. Better control-flow handling. Basic understanding of conditional
> > locking, which is explicitly ruled out in:
> > https://clang.llvm.org/docs/ThreadSafetyAnalysis.html#conditional-locks
> > - however, if there's some way to even get basic support, would vastly
> > improve things for the kernel.
> [...]
