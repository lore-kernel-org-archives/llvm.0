Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9D17E792
	for <llvm@lists.linux.dev>; Fri, 24 May 2024 22:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716590631; cv=none; b=hYtla6MkPXQg18FCVRG3bIRA4nwsk1u5XvPvqcw+SHEMkED2nxe2UFjixsS6GPvDaS39APLUo4NnKmAK3bhSIkXZnUtRY53IOMM3FZZ7FGZDzZLcRay4PmXB6J80qhPhRpeSJOyQWWawVuijyvXHmuUJXG5vtto6xq2fVWZB4Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716590631; c=relaxed/simple;
	bh=ucFbGWz6mMVoDnnPzwBRuL8Yb/nGgWE428XQaqRqtRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mb+qHC18heam08TpwXoirYLn8i5E2y/eDCAXQiANd9xLS+lmri1FuVMjGF+rffaxGWC/6pEaRBeeXThn9gB5OVScWy69Ctd1p9w+XWKbDjSU9saF1G26CMkZ97IjfgP5ZBaHP80stnRTqtlSzEdnIVk6r0ihtEy2oOvHTcSuviY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kxfOZJs+; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kxfOZJs+"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-803279ed9abso695605241.0
        for <llvm@lists.linux.dev>; Fri, 24 May 2024 15:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716590627; x=1717195427; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymFK2RObdNjzPsJxP220O5+71BNflb8CNq7Wj8mqDgk=;
        b=kxfOZJs+yBvlbtsoVZxURppwJiPsLKcQVlsmA796h5SQtvMAj03a8E9n/Hq8NpC0K2
         LEkkYF0KnlQB/wKl9f4O8beD1aJuU4IdNfQNdWC1l9yEbdkdvFdAiwBCS1CpNsdMGtRE
         lNzUlpK82RHMqMqKW3Nftqp4aMixNmnKm2drDq5xqEY/pS8LgC0MVmAOq9seGhMNcxbX
         Qoorm6o0xa2wcRrWiMdJjURJiKdUEvmLImtfcJ7FwZ6l/gavGONSKI+DM6rg0nA8lqg5
         tBwX6kvgQxdSKXlES4ezpGb2gLbRPx0vBpSKej5QG100yq2O/bCUgS4QFsc9LUj8fABE
         TlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716590627; x=1717195427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymFK2RObdNjzPsJxP220O5+71BNflb8CNq7Wj8mqDgk=;
        b=YvIirIxoEtDE82/xuIK0Ey333KnxLOmGvjqWuGvobyOWWgIn2nsaARYfXNuq0RRM5K
         PjkTdkHN3IirxeAaBSDp3WBajZhEKy4SuIKrbmuRmKaDlSuyEuohflQkav+n6JCcSjQg
         AlSYf3r/8AY19C48kg0F26jRlUVEBMPzSdmXB6HpwmcafspBxXnCRh9mPiW9lCgSArO3
         NkJzcmpbA2AExyeVbGZfpK+IvDmvgwteX2Z9eF/Hz7mdi+//v3DGQd/rL6RhvQ+SkUun
         H/NQnhwkLdI8s06zR7v6VcWA5mpUzEUwFnBjXkHuLqpU8WJlFRYro3n6WKLVy5JyzU42
         YFAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXa2zAUSvdxgey/O0zTRITOBf4JjGtraCHl+7xsgkJM+JC+WC/tsvdF2C9ObOR9KRmrGWoI3D5Cccbr7TmMlr/zAX1p6A==
X-Gm-Message-State: AOJu0YwtOF6QmW133nPsMU8PAf6Z9mmYIM34dUKU6HNXRgBQEBTs6e0N
	29xDofTk8+AOX6FzXElLtJX3g26TSqvaOycHJNVKefn1x6Z3FRrB5YuYFZtA4cLY0xR+yRELMhb
	BkFT9z2/xat+pN8Bb4JqVdqfXCaDdPbJn1Z8l
X-Google-Smtp-Source: AGHT+IEUGTDNkD54qyJg80rQHwEyHmm7B9lB9DQteWkSaz9UWWF3L+6g5cloJy/CNjqKhEMoxrKZcnEAYLz5ilTnrYs=
X-Received: by 2002:a05:6102:2e7:b0:47b:f5ce:569d with SMTP id
 ada2fe7eead31-48a385134d2mr4040126137.3.1716590627119; Fri, 24 May 2024
 15:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240517-b4-sio-ntp-usec-v2-1-d539180f2b79@google.com> <87ed9re7i4.ffs@tglx>
In-Reply-To: <87ed9re7i4.ffs@tglx>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 24 May 2024 15:43:35 -0700
Message-ID: <CAFhGd8o0eFh0sqXtOcw=E+WBaKCTatpv18fA1Pzr_M1aC9OQ=A@mail.gmail.com>
Subject: Re: [PATCH v2] ntp: remove accidental integer wrap-around
To: Thomas Gleixner <tglx@linutronix.de>
Cc: John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	Miroslav Lichvar <mlichvar@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thomas,

I appreciate you reviewing my patches.

On Fri, May 24, 2024 at 5:09=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Fri, May 17 2024 at 20:22, Justin Stitt wrote:
> > time_maxerror is unconditionally incremented and the result is checked
> > against NTP_PHASE_LIMIT, but the increment itself can overflow,
> > resulting in wrap-around to negative space.
> >
> > The user can supply some crazy values which is causing the overflow. Ad=
d
> > an extra validation step checking that maxerror is reasonable.
>
> The user can supply any value which can cause an overflow as the input
> is unchecked. Add ...
>
> Hmm?
>
> > diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
> > index b58dffc58a8f..321f251c02aa 100644
> > --- a/kernel/time/timekeeping.c
> > +++ b/kernel/time/timekeeping.c
> > @@ -2388,6 +2388,11 @@ static int timekeeping_validate_timex(const stru=
ct __kernel_timex *txc)
> >               }
> >       }
> >
> > +     if (txc->modes & ADJ_MAXERROR) {
> > +             if (txc->maxerror < 0 || txc->maxerror > NTP_PHASE_LIMIT)
> > +                     return -EINVAL;
> > +     }
>
> I dug into history to find a Fixes tag. That unearthed something
> interesting.  Exactly this check used to be there until commit
> eea83d896e31 ("ntp: NTP4 user space bits update") which landed in
> 2.6.30. The change log says:

Thanks for doing the archaeology.

>
>     "If some values for adjtimex() are outside the acceptable range, they
>      are now simply normalized instead of letting the syscall fail."
>
> The problem with that commit is that it did not do any normalization at
> all and just relied on the actual time_maxerror handling in
> second_overflow(), which is both insufficient and also prone to that
> overflow issue.
>
> So instead of turning the clock back, we might be better off to actually
> put the normalization in place at the assignment:
>
>     time_maxerror =3D min(max(0, txc->maxerror), NTP_PHASE_LIMIT);

A saturating resolution strategy is one that I've taken with some of
my other overflow patches.

... but how about: clamp(txc->maxerror, 0, NTP_PHASE_LIMIT)

>
> or something like that.
>
> Miroslav: Any opinion on that?
>
> Thanks,
>
>         tglx

Anyways, I'm waiting to see how the whole overflow/wraparound
discussion in general evolves and, of course, how the local discussion
about this patch shapes up.

Thanks
Justin
