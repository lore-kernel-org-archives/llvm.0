Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CF31E7660
	for <llvm@lists.linux.dev>; Fri, 23 Jan 2026 20:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769199339; cv=pass; b=ZZIeffk01nm4+OAh+VDB19/u6fqmMgc8F5BxmTEuybsukWEjJLIr+cg117wXpUmzg/oNhJioo24d+8Nx1yR9KZfJ/HzZFM9xalcaMKq9T9h/gm/XosEQgP8lr66xKtftrPYex+e6AkngnJ598EKJc+ALqI6cPyKwOxoweMNkeY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769199339; c=relaxed/simple;
	bh=Nstqx2mleEMHW56c5TwsoYsuaQ5VRZKbEQS1mvG6bo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NWfWvbdCbxRF006OxBLDUbQcktRpjTLjXmiwGJTKmnKuJEfWMs15HP1V7f0hoqD1sVnxIRINm5D8ImnTHD4NmWJDyuvkqS/aIKqALOLCKAvw5Ha5v8DdqS3/ehxmd6gwh9DUk8h0NDIy7cHS9SRKzG4sFL3dZEdQTkhrzikb94Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t5Q9YzVb; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t5Q9YzVb"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12336c0a8b6so3068724c88.1
        for <llvm@lists.linux.dev>; Fri, 23 Jan 2026 12:15:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769199337; cv=none;
        d=google.com; s=arc-20240605;
        b=gqTN/YJTtRgDZZ6NvLpR+vw9bg/A0lEAx2U5H7GshU1v7g3A5XTM1JKVgZzgvTwBAC
         0qhnQzaMxi0PKYzmNSjj+DEHYH++E7PkMkRHJswf65j8r74e0/3igvUuzs7po/MMfVw/
         5XjzN+2HeIOM5RHsM+7q5WeH3UUssSY4toFzw4pXv6qOkBHnOz1eUfzJTxA+IKbHfC9b
         xHRzKGZh11mxStYCkYoIZCE+Q3h9HTBjXaUI2U9SaZFJYSyEjbUY/EFohMJlKFVyVr+E
         /xrrcR+o/v0c4wmGvbcqrBO1yBoC+f4A/ulXiLzuUkDP8xz0HJP3Zd396QHfyfkBkkGL
         gjng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RdhsOKTYvI9TN+V3ve2ZG+zs0DWizRQ8NcwKAeAdnzc=;
        fh=yhis4l2hryMNH75joP6jTWm3XDCKmnra4lG9yq7qhAk=;
        b=HGe83D7uqjTXo7VJPPBngcMV/5K2+meJ93/7VXG8on/ksWRVrDlzrXltWWlbkxBcSo
         CrBdn7wMniCjoJJoqbHgihegKqBfaWjtx4ABnBD/AMlXzIWoknZTOpPe5xYkcrXqvAPn
         +5KJZ08iRoy9lGSfaRfvsT/42U2+yHw1dVHNygCgOZWNHkd+0FgvztezLsXbikBDtqsI
         yGJEVEQ7YWg4TLvH1/7boK0X4lnjYx9fvTj9l5XTdgvucqXPbujK41UWqzFzI3wggWWC
         FNDgy8fszfKYPh51HSpT8TtUsTS5HrnGpwnu6QqI9XVOWmn2ow/o2oZmEEWHT3qgYmdr
         ZmCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769199337; x=1769804137; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RdhsOKTYvI9TN+V3ve2ZG+zs0DWizRQ8NcwKAeAdnzc=;
        b=t5Q9YzVbBObaMdobT5HwWKe9EUGzhhYuLmwDQRAAlORP3Cy+7wc33P5slhBEp4jqlq
         SKxoASwa8oabFMXio16CrcZ/oGAS0dTBcvZ3SEro3+y7M871HX/cYlwQp9tvwEMApoXl
         mWluwJaI4ah/lawuHY2qNgPVxHWk4vN2F96Q/yTf77Gx2BksbXNxPjl8EPuegnB8xbg6
         XX/temS6qgTjNeBjgWqg5lsKfsDRuxWGWecJb8Mqvhydtxa8XeOIDU603667Ae2uYw7B
         EQc7R7CbaawHYTR0gUo/IhX4n1Qh5wbX7CpyRVVOV6DVM4Ga2SRW37otzyhGgA/Ljrm8
         /mDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769199337; x=1769804137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdhsOKTYvI9TN+V3ve2ZG+zs0DWizRQ8NcwKAeAdnzc=;
        b=caB9UbdcaVQ8LjD3VmVQm8jnUH5CwdjbCvTMTptZjSIZvS03/YZ33gWRaWLHzv76d4
         S4XXt49QEKeXili8g4j/QLDXh+L65/YEYe9S299Nzpm/U4Q2nDMUlq5Z8HWIcnJzf5Q+
         dAkgh+7Ik3Tv5yozjicpRW9CK+QG+oMURf+yUP7BxKbAuVbQDmfNlfkGFEoRCEBgIl/4
         pZLearmhT50+CeyyN6b8Ct2eI3kseygFtFQNieJha7YDazfYYq0e2eChKyH66GehOq72
         JeoOxD/8wlzqCJxa64s49RzLaDXCYbMWGrGj05tbPym7ImmOPHbUzoXQ9U9xhQcyo2ay
         nYYA==
X-Forwarded-Encrypted: i=1; AJvYcCU4itdjJWN8qbxkhmU2ZbVAiNEgbRwmt1J2JlQm6gx7DttV04PMzWY8N2NSv7DOQIIu4FhK@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx4iC2pmcMtLpYGpOu8oKd+K9TfMmEuXGqxqgMFaOQVuCA2rUD
	8tki2H4pf00hVxFwFQujRPUChkRVGGCOXcALWc1bS4rFe98MWwpvKIAifHhydkPXwtGBXQeZ1Jx
	0sHAO/O6iN9TheTrYAUDKLM4N+FZgjh72riDz4seZ
X-Gm-Gg: AZuq6aIkwFOsy1OZaEJ5eUkQOkbmCYTcNTZJu/GbNYoQSwLIJMLsRjebWcefYi69UsS
	otyHqLaglvqOSxYb6ls04MCP3oks79IaeD++7PzIrNSQivWeNWeGmFGEzBYxGl/wn4z4BNEpvZU
	vp0kPZwCGoM7Q7kf/E3mH/iQv33OlprH7YKOKmcfQpNWQGOVL3UST3RWpGyDisIJYwg5bBmf+eL
	290L4acJD1wLaBp3DzYiZDBlmHaymGeCV82+0nMzQGJ8E/F8Tvu806tHPCv33Iy2hfeZBp5hjcj
	AJ2uwCP194y5GMrk09b1yeS/LrjSi/9F3rJnuw==
X-Received: by 2002:a05:7022:787:b0:11e:3e9:3e8a with SMTP id
 a92af1059eb24-12481a50be0mr1675949c88.49.1769199336823; Fri, 23 Jan 2026
 12:15:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121110704.221498346@infradead.org> <20260121192349.GM166857@noisy.programming.kicks-ass.net>
 <e1229c44-048b-4e42-b545-18a8c716b5eb@acm.org> <20260122090402.GD171111@noisy.programming.kicks-ass.net>
 <d399e354-6d42-488e-a0b7-fe8d08b9bf34@acm.org> <20260123111523.GO171111@noisy.programming.kicks-ass.net>
 <f4f688ba-8953-4cb6-a749-94dad74692ed@acm.org>
In-Reply-To: <f4f688ba-8953-4cb6-a749-94dad74692ed@acm.org>
From: Marco Elver <elver@google.com>
Date: Fri, 23 Jan 2026 21:15:00 +0100
X-Gm-Features: AZwV_QjEDYTKPTyuS4xGKAbbrAz-nfGSXjlIEhG6bXF_of2gSn7h0p5KVA8g2K8
Message-ID: <CANpmjNNGwkb8p7Mo1sgEVg2ttRtmOOeSrHSmnHbQijpYnL7Y7g@mail.gmail.com>
Subject: Re: [RFC][PATCH 0/4] locking: Add/convert context analysis bits
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	bigeasy@linutronix.de, mingo@kernel.org, tglx@linutronix.de, will@kernel.org, 
	boqun.feng@gmail.com, longman@redhat.com, hch@lst.de, rostedt@goodmis.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Jan 2026 at 19:58, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 1/23/26 3:15 AM, Peter Zijlstra wrote:
> > --- a/include/linux/rtmutex.h
> > +++ b/include/linux/rtmutex.h
> > @@ -41,7 +41,7 @@ struct rt_mutex_base {
> >    */
> >   static inline bool rt_mutex_base_is_locked(struct rt_mutex_base *lock)
> >   {
> > -     return READ_ONCE(lock->owner) != NULL;
> > +     return data_race(READ_ONCE(lock->owner) != NULL);
> >   }
> >
> >   #ifdef CONFIG_RT_MUTEXES
> > @@ -49,7 +49,7 @@ static inline bool rt_mutex_base_is_lock
> >
> >   static inline struct task_struct *rt_mutex_owner(struct rt_mutex_base *lock)
> >   {
> > -     unsigned long owner = (unsigned long) READ_ONCE(lock->owner);
> > +     unsigned long owner = (unsigned long) data_race(READ_ONCE(lock->owner));
> >
> >       return (struct task_struct *) (owner & ~RT_MUTEX_HAS_WAITERS);
> >   }
> Marco, shouldn't lock context analysis be disabled for all READ_ONCE()
> invocations? I expect that all code that uses READ_ONCE() to read a
> structure member annotated with __guarded_by() will have to be annotated
> with data_race(). Shouldn't the data_race() invocation be moved into the
> READ_ONCE() definition?

Unclear, guarded variables accessed with READ_ONCE() do not
necessarily imply access without said lock is safe.

Second, a READ_ONCE() paired with another marked primitive never
results in a data race, and using data_race() actually prohibits KCSAN
from detecting real data races if any would be introduced, but we're
not expecting any.

In the above case, if there aren't actually any data races, the
data_race() addition does look odd.
Perhaps context_unsafe(READ_ONCE(..)) would be more appropriate if
there's no actual data race. That will signal context analysis this is
safe, and if there are any real data races introduced here (e.g. by a
concurrent plain write or such), we'd learn about it if KCSAN detects
it.
