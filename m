Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1599F313E29
	for <llvm@lists.linux.dev>; Tue, 24 Mar 2026 15:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367311; cv=pass; b=kDRL0ZZHcKp60jAAbcIVoCdfQJ9jwsafNpHonE+N9S+mpSUoDO/n61PDtvD0Iyc5M52rF7VepmBaN8Vzhoaxd8KiS5J1494AhfoExf0KlrblOLXGqrqUWCVBhyISokBSesBIjYE5tzU2YCyHeaxkQvB2em0/nlf5MOqnvB70VLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367311; c=relaxed/simple;
	bh=tJPxU0Gg3Dyf943OK62CjG33u0vQFjzQ1yhEmWLl/24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qiGjBg84m1ZUUCc6wWIl5eOunvYFNXulFnToVqxFmwcVUzr6Jy3HFVFXnQ2qCQwMxl5q/xM8EkUAGacM3H6XaB9MrO3qf3CGhQKy17ub/Re7lZHiT75RiN0rw/QKaBC09TywPd8qPLAJC7A+/FXUtdtoh/HD6av6MhkBKoC9zVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OihaZYp4; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OihaZYp4"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-667365131b0so12888a12.0
        for <llvm@lists.linux.dev>; Tue, 24 Mar 2026 08:48:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774367308; cv=none;
        d=google.com; s=arc-20240605;
        b=jh1Zyhx9ofBOu5V6M2ON1CRK9jEyNly3ORoBPfmZah7qw+q6zWxVN9OFzDmvOWAewk
         tZT5PKsG/6Xa3iRPnHtwAmBSoJWYBvWPLVS8MWZBcO9Hqk/Ub4w3m21QrHNyUE+zNFd4
         MPBhdqF16u/QvhPkFBcKS7PEd2HPmHLi/18REZW7icmL23etdkggV/p3FBZpGd4qoLSc
         Hm8pYXMygUWXsOWQmb1pggUAI/gwij7mJiDYQQHAJxN/Gowo42IW9NlygEOzUHC2TI/k
         vusUeMVhCGmfTXeMtyKyL0WXE3fDTiLp7EEmNN/hjecKYzDepL802d60hp44iHddu5TB
         2VBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wK0GwFw5xGkP6qesBY1xpEPNZBozvuFve9qGb/f0LkU=;
        fh=LNetYzd2jtNBsleRq+jynnLaewH29Y+/MqOaHm3vRbk=;
        b=LYJkxWiIVqVZFQyfV7yorwzutADaT/tsDkgb94IXLUN+rp+0tDm2bQOb4MS9w9vZXi
         OBZWoYm2GYtYkWy4Bm3EHTfSshYiyNoPSSr5TL1OG84iK11l0cMOMWW8dtWEnvGqhIoq
         iFClprhD/laAF/hAkS95sDzZWL+mjAkjHDQsB9rmZrXFpp31TbeWzy7mLZPZBg5oh/oo
         JpM5xi1Cz0abWJMDIDOmCxHu6GdCTP9Xa2hsZtEtlpygmBA1KdsUYSgCK3n/Tm9FJ+1u
         TwNV+rDcHf0pQ80faf935obgqXAp78vL9aFEg/f8/yoS/kVF3B5vj28JfTacKheyJPdU
         NRdw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774367308; x=1774972108; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wK0GwFw5xGkP6qesBY1xpEPNZBozvuFve9qGb/f0LkU=;
        b=OihaZYp4I4Icp5vu2WWxWfHvYu2mmZyTMqFkxWLb0NOOaNjRNppdvYF4z0xcpA5IhI
         UtuMOMXDmRuLVglfYkQyZfWbOxTeOgA3V8//kQH+uGa1buikvgGi4bPYdyvSlSUqONDe
         E9oYCxhaVDX6lLXmK6yuWs7V2CyHkF3/ssRhxtuTDl+R7z2izun9Cbl3b1QGh6pjUL08
         aII2FG1Y68PT0KJz3Ij5G2qwjs+o1qDDEX3rDU2beZvONjitYy1Y4ZlZIPiUyqDZhNrm
         VRT3JNID7tOjjDHDNHUd4E4b61GaDGh9boyIrAHctaAHkj72eWAHrzPys4SHvmnaK7mu
         4XVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774367308; x=1774972108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wK0GwFw5xGkP6qesBY1xpEPNZBozvuFve9qGb/f0LkU=;
        b=b3zFDDgUbRon0OnHhJKk2PRBmxQHA5v/f+7kmvqmhB8umCznQfjUzpvAhDCX36FoFG
         wbTy/UaRC7MCbGITkZqwiPlG/FW04/VSnJixNJKNWJooo+7DnW0+CSY1bGD+9oKfYgVv
         8gd9kNmSAcqXGoIqGlJVtbrZ3x7fsl6AYdTbacDaiqCJrgebTc7hrUGyS0EkuVII2yop
         HBFBXd3hyL8Ef0M8ihAEhLBxa0Agf+4Kdb5rt5wVXm2YzjFpA8zplqhOUF64Wp2li8qA
         kWP1II6Kx0LVpXqrivyVOkOifjsgNSbOVLkEsozVVzN6u1CbTdcPKx6qnNWjhYqUEvvL
         HvbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8rUuM7S1pbNMa5gyElGMFLF7UhM8o20Pw4g/StpME9vPO2qORPf7e18GxL/XKY3Y0iTpi@lists.linux.dev
X-Gm-Message-State: AOJu0YzFyQJkuK1zTx0e0eDk4rbsI6EdscmCZaS8XCelMjvmMuz0IM0b
	X7bQBzjIVyj3HeNRBf0lTjJ4CsfbwUE0YgCM3N2hMQfj28v8FuJPhKpKKF476FiDXJB/VXqTnBq
	h1asrEBhnkisivk3gJ3ZMjndYbq+hcgRn/20EPSuL
X-Gm-Gg: ATEYQzxSFZIMNO/4hi9pVNiX1mHtEMMm4Wwe2EZN24Icolu11DM9qu5ZmwGD0UMBIhw
	9kRNSH3P0URfkN/sqB38up5Oynvzq8ImAI2pZ6qv47Td4D0LYCzfz6HrzxacZfPqzKvusJFrsv0
	rnFA9gT+fpkgAVPuP7UoatsRpRHDH34xdXhucfFOwduQjN4c3p398LL0p8T/ScrdNtZ4Z7MAMOq
	wLXdEi++UXUSXyjxVH6Nl8QDpwt6RU0LIVjQlL96JqHTNdUL5W5Rz6SHsue01g4vH65BJMr90ha
	nHqlKAEQvsp6z5gGVUPQHAUXUUSqH4UXNQPlnQ==
X-Received: by 2002:a05:6402:b2e:b0:664:d536:82f with SMTP id
 4fb4d7f45d1cf-66a36f30244mr40660a12.9.1774367307926; Tue, 24 Mar 2026
 08:48:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260318-kcov-extrecord-v2-0-2522da6fcd3f@google.com>
 <20260318-kcov-extrecord-v2-1-2522da6fcd3f@google.com> <20260320221051.GX3738010@noisy.programming.kicks-ass.net>
In-Reply-To: <20260320221051.GX3738010@noisy.programming.kicks-ass.net>
From: Jann Horn <jannh@google.com>
Date: Tue, 24 Mar 2026 16:47:51 +0100
X-Gm-Features: AQROBzD0DnglHVb8-ByMtnVNT5Ct2AVAffTes8sa6Q6hl-dUpIrA65aAUcBh-G8
Message-ID: <CAG48ez1W_iJsfF0nrJqtV9sBvnxG9VHJ0zhhRi-6+kKiwyWemA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] sched: Ensure matching stack state for kcov
 disable/enable on switch
To: Peter Zijlstra <peterz@infradead.org>
Cc: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 11:10=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
> On Wed, Mar 18, 2026 at 05:26:58PM +0100, Jann Horn wrote:
> > +     /*
> > +      * This has to happen outside finish_task_switch() to ensure that
> > +      * entry/exit records are balanced.
> > +      */
>
> That's not exactly right; the requirement is that kcov_prepare_switch()
> and kcov_finish_switch() are called from the exact same frame.
>
> The wording above "outside finish_task_switch" could be anywhere and
> doesn't cover the relation to prepare_switch().
>
> > +     kcov_finish_switch(current);
> > +     return rq;
> >  }
>
> That said; there was a patch that marked finish_task_switch() as
> __always_inline too:
>
>   https://lkml.kernel.org/r/20260301083520.110969-4-qq570070308@gmail.com
>
> Except I think that does a little too much for one patch.
>
> Anyway, I'm a little divided on this. Perhaps the simplest and most
> obvious way is something like so.
>
> But what about compiler funnies like the various IPA optimizations that
> can do partial clones and whatnot? That could result in violating this
> constraint, no?

Ah, good point, bah. And commit 0ed557aa8139 ("sched/core / kcov:
avoid kcov_area during task switch") explains that we also can't just
keep emitting kcov records throughout a context switch.

So options I have are:

1. In the scheduler: Try to put enough magic annotations on __schedule
to prevent any such optimizations. (Probably "noinline __noclone"?)
But that's kind of invasive, I assume the scheduler wouldn't want to
have that unconditionally on a core function because of a niche KCOV
usecase.
2. In KCOV (without touching the scheduler code): Keep track of the
current and minimum stack depth while record generation is suppressed,
and emit those values when record generation is reenabled. That's a
bit more complexity but keeps it contained within KCOV, and I guess a
way to suppress events might be useful for other stuff too.

I guess I'll probably go with option 2...
