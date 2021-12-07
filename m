Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5A52C9D
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 19:01:03 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id z7so471740lfi.11
        for <llvm@lists.linux.dev>; Tue, 07 Dec 2021 11:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SupVShNTJXevij1EjwBsA50LSidShtjCg/jXRot9bjo=;
        b=r3DyYrLKfSQMsfPXa31vjOKwQh2BCyUHk/ALY7BiaifwGaT4UGUmiNmjvztyRKLNWr
         S+yen2gW1+z5FuFYaeXS8KFz/bg2gq1LFLuNWj22DKJHEUebD+oPYu3OOK3CNn5JpDj+
         d9sN4Zx32FnSjBrQVAnSSx93kLiX+Rm/o5XnK606mauTydScUqvPkpOFJv/OLNOEL/kc
         mQvvvSS7oU58jh7wVNHRG5yHZyIFWiezcZosFLUBV9NVe+2FsR+x43qbYNLAVjH5ps59
         ZnR340Wofoz25vQQ10zcZqRTURu1XwrKOcbdtv/vKfa7suRPRMfHPL5Mv1sBi9wMOyiW
         M2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SupVShNTJXevij1EjwBsA50LSidShtjCg/jXRot9bjo=;
        b=iH8tIwMFOCP2O+PuQm7QmYDfMEL2kGNhZ3++zmtP6mPi0U1xVSRq1K3pJhpw83fLMh
         SMS0CfRXfVPvJqMzGAS6vf8x209LZ1YfRq9mv40CQHFNQbgKGiNeHol6D8BXzXG+W8b3
         r91kzeEEqeDbqBbofQJjpRiEZ9uhc3MkBq0UYANc0Ar5Y8uTKjbYz/47c545V2L+dstz
         MWVWQDujqGOlCBuZupwwD4wPiwescslDG5AT8EDs0y3HlMiJJFrg9uf1/gB1VrHcTj+c
         iPibEDiofE/XvDQBFM11qEnm6ORlYUUJ7r/45o7dkcVkMkeTAyTqbue06bhQNZP44vOC
         kmPw==
X-Gm-Message-State: AOAM532sJK41nz+iovnnc8DUnjLNFphyfNxPeSx3nNNtxX4Q1vJX0D6S
	EE0YIFrWfwyDPyMeYf/6vv0C73PrreXEOsKynA8DUsG7ZJc+Rw==
X-Google-Smtp-Source: ABdhPJws1M5JeOEGcy41V2RcswPp254QO96BxAPTUKc20NHWJL5bam2X9XT3xWRLxCoy1rPVWr5hd+t+GrwApmkBD1g=
X-Received: by 2002:a05:6512:607:: with SMTP id b7mr43740531lfe.489.1638903661109;
 Tue, 07 Dec 2021 11:01:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211204220249.591482-1-arnd@kernel.org> <CAKwvOdnZSyfZaa1crQ15DGNNj8JBspnM0xxOF3D2mTt96Ftfgw@mail.gmail.com>
In-Reply-To: <CAKwvOdnZSyfZaa1crQ15DGNNj8JBspnM0xxOF3D2mTt96Ftfgw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Dec 2021 11:00:49 -0800
Message-ID: <CAKwvOdnH9tV3PK4k+XEnjo_Le88o+Jqt-H-_C2VnsKiiBUAW9g@mail.gmail.com>
Subject: Re: [PATCH] power: reset: ltc2952: fix float conversion error
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, =?UTF-8?Q?Ren=C3=A9_Moll?= <Rene.Moll@xsens.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 7, 2021 at 10:41 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Sat, Dec 4, 2021 at 2:02 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > clang-14 does not like the way this driver converts a 'long double'
> > to an integer when the target architecture disables floating point
> > support:
> >
> > drivers/power/reset/ltc2952-poweroff.c:162:28: error: expression requires  'long double' type support, but target 'x86_64-unknown-linux' does not support it
> >         data->wde_interval = 300L * 1E6L;
> >                                   ^
> >
> > Turn this into pure integer math and make it more readable at the
> > same time using the NSEC_PER_MSEC macro instead.
> >
> > Fixes: 6647156c00cc ("power: reset: add LTC2952 poweroff driver")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks for the patch! The change in clang-14 (ToT) that triggered this
> has had another patch on top reverting these diagnostics.
> https://reviews.llvm.org/D114162
>
> That said, this change is still worthwhile for the improved semantics, IMO.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1497
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Ah, a fix has already been picked up:
https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git/commit/?id=644106cdb89844be2496b21175b7c0c2e0fab381

>
> > ---
> >  drivers/power/reset/ltc2952-poweroff.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/power/reset/ltc2952-poweroff.c b/drivers/power/reset/ltc2952-poweroff.c
> > index fbb344353fe4..9fc88a9f244c 100644
> > --- a/drivers/power/reset/ltc2952-poweroff.c
> > +++ b/drivers/power/reset/ltc2952-poweroff.c
> > @@ -159,8 +159,8 @@ static void ltc2952_poweroff_kill(void)
> >
> >  static void ltc2952_poweroff_default(struct ltc2952_poweroff *data)
> >  {
> > -       data->wde_interval = 300L * 1E6L;
> > -       data->trigger_delay = ktime_set(2, 500L*1E6L);
> > +       data->wde_interval = 300 * NSEC_PER_MSEC;
> > +       data->trigger_delay = ktime_set(2, 500 * NSEC_PER_MSEC);
> >
> >         hrtimer_init(&data->timer_trigger, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> >         data->timer_trigger.function = ltc2952_poweroff_timer_trigger;
> > --
> > 2.29.2
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
