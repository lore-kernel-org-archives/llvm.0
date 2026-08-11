Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8FF364E9E
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786471399; cv=pass; b=qfvsxcJ0OD61D13Z54THZrDLrhr1duWED5oB9R8J9s6K+mVHL8T9Q4OC2RDbgUhUYOTeL7TxGxfrof1d2lBS48OiOUamCxaMe9MSSIDa5WoIZsRQrRQv84pOWmgTKS0W0GUCuVmTg23knfMTE07dTPQu1U6aUSu2M2mU/ZF80BQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786471399; c=relaxed/simple;
	bh=MoIAe+r/nMy5HKj2wea0IFKWy0S7HugyLhHKg6BcVm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaHaEMofx7gk6I/2PuKAx0skAc3PrqSGnPYGF0I2Q9tEurR1929wfLO04XKEmm3WKdqrP6x++h7Yask5oj6fhSXWycvRray5KlP2ASQJPzHsxCfyFahinGmtMDHt9vWAQywJkisJJIjeZmA9EeCuQCkUk/oE5PAmWcCMvK5Tuck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qyQ+m59m; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyQ+m59m"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b2aa3be376so108189e87.0
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 11:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786471395; cv=none;
        d=google.com; s=arc-20260327;
        b=F5Xig60EBG4ZaONXRY1d+9hk389pDCz1CMQ8GXkfsfD7xCxIITbxL4rNs1Dd5JFJdb
         qd1o1hO/Zv+ZMh3dgip71aS2MltYU3GIxsN0ex8819c7uqQlQCl8cGwoDk8pICgILPEN
         O+qBdJaaaNG+K494Oxs/dqbSKycGrcsh7yfltVjIbRQ+mBgsDg7j7cq3iQcOvA+OBhpZ
         eS8CkLxNUZecB3NbWTVpMI6TQ06QtxUhbyFIZWQTe1r55A6y6MJBhOLbmLpi5kKnAgWf
         cNcafRlzC57Mh0tHMl6fy2yxvYnaqdpWgKCP07R3YdKi8EJZwneNT+SuxyzYslW82+Pk
         jIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vjd/fAmD0D3XwcSyeIvZ8+6EDq9t9quZRoVQ7xFbSro=;
        fh=f2stvRQQc+GSyi63mu2P5+AOkuXDkff3eHQTVJRwhKs=;
        b=ALnKagw+4hwGUnK4yK9lJHzxtsHlr9Zbu78f7Hh7NlD/cQzU9mCgee1A+9p/khOhQl
         sZ0bZOj+7hGPT2DvXsyp3eJI4BIXCRZtL4or1Ggb43LIFwejF7fGKKjsBmaav83m01H/
         YMdXemQNen879te89DdBPDkFZcN8TFzskDHTWVR9UrjmblOiYqDjvvsFoKzIn4X4Sf+J
         pzhAnxKGEDNK8RF3vnFmLmXz++O0HYEwOVSkKle1Ha3oenNdZIqTKdE+v8mdEhDyRN+L
         1YKYdF8+qv45W7w4Oatw2bFPVdVxed+W+5yzX7WZDC/ryFS9UErC0R14t3JVjw8G+74p
         drew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786471395; x=1787076195; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vjd/fAmD0D3XwcSyeIvZ8+6EDq9t9quZRoVQ7xFbSro=;
        b=qyQ+m59mNFwCS++451odBxvSaVHjPG9P7HvH3skyoBb+PR6oVrDryGpKNTSxI/vT3N
         v5p3mFw0Rvelvyy7BwsC9UQpcCAioujTJ0GFKm0TnZZC2KHPtHTJzSyFB18b+ycgvv55
         MgpKCESOVyEp6EbXgi3NKvLt+aTKyEI8rTHuTivUWWZv4tRcJwHvZ+5tn+7QCkH3Y6By
         9KWEcWobEIv3zIJUy/J+pM6jb1nkvUIy+S/5Fwfpf2qa3el1fYRaEA4SHWQ5Lc4dXW7M
         hHdcdl4ENWIP/aKbH3a2x1jZZ7zRCMQo/yl8CQMTiFBbpg2YBsfnfJCmfTkQq9bBjuP5
         o75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786471395; x=1787076195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjd/fAmD0D3XwcSyeIvZ8+6EDq9t9quZRoVQ7xFbSro=;
        b=MjZli42xKBQfLca3ByiQVC1aciZ7oC3GVFpkD9+Z58fpAp0TFVyYbcGo3sVeGHZDis
         Nen4tnpHZbyhLeZTgGuEGo/adaWzVz54HcjBRMZi7L5MNqjHXcrRJUfAe9EIcenashxK
         /f70jfSMp3l5zbdB/Vv/tCSloThBR0lWH1yapMIottucbTPVJiTg9Z7fG58Opab/Q6PA
         y17WPeopQh8MJeZD7DiJL4z4qiRI2AJF1EXAIqSRSua7mZSZOD0GjgMBWCFMO0qkaGL8
         B6fQoVqxasqiotxOhPK6PZL8o1dNa9qj9Yi/YG8VvJKMUFxxSo8v/nlmnY5w16JW/idK
         4upA==
X-Forwarded-Encrypted: i=1; AHgh+RoHPiYIax2By4Scwatp92WxCqPk3wrgCaL24Wlw2ZEVWtGxTU34T+gZapa4kWx7iAwf8LE6@lists.linux.dev
X-Gm-Message-State: AOJu0YzVmy7YaCG091nefPJIeU89ywmg3ep+cnJ9Qa2x72582ZUhvDyV
	lmCFZHNYGnfCGbeV1xk6qdhq4PSpPD2CCsUUqSVkHvqW/eSwy8ySsMnYOxfQB8pawTJkB4xEujB
	+m4HtF4lJr2CZaq/MoN2WEiqUYPNLFXc=
X-Gm-Gg: AR+sD10SJvpnncQmNhOb8kR5DoVXAaV3R7ZHMugo+WleJSd7Yn8dQIbo18XooselF4G
	BXEot8tvUDwR2HgvIgl6HeEWz5EeeKBpA+bz93mmCbmFIaqTGHCeVmInf4EAMk4oXUGE5xPCOyr
	yAQ6yuayo0SOP1/qrE10/L8CisY+oWwalCiHup7i/KJ1ovpDS/42L8JuJTMiiGTmliZr3ln1SWu
	ycmEMBAdTIOoD7vHTAlWZ8VJ2+Lz8LnBpRL9Lde6nPTOmZmccQ4jx83+4wJZW45z3pr7SU7Mems
	B5l2T7ZKW43wgrNAhZAZ3luEzRbqH7LkG8jIWo9tsj7EONtdGBvfKj78EB+RGPygwXyLxQKQI1r
	57w==
X-Received: by 2002:a05:6512:39d3:b0:5ae:aeeb:e902 with SMTP id
 2adb3069b0e04-5b448610878mr788811e87.13.1786471395270; Tue, 11 Aug 2026
 11:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com> <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
 <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk> <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
In-Reply-To: <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 11 Aug 2026 14:03:02 -0400
X-Gm-Features: AUfX_mxmnN3UxyDqTnGPQ9KikRs4pBRLxD5kBxPrAo3ScWOdRlFNN1zZtW9p0HA
Message-ID: <CAEdQ38HmrYhR2z1TjrWFOrv5gJoXYk0HCeUoPPZ7vvghnwLVUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
To: Magnus Lindholm <linmag7@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Magnus Lindholm <lindholm@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:55=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> On Tue, Aug 11, 2026 at 1:10=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me=
.uk> wrote:
> >
> > On Mon, 3 Aug 2026, Magnus Lindholm wrote:
> >
> > > > diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> > > > index 7631129ac914..5b4f1ae2b74b 100644
> > > > --- a/arch/alpha/kernel/traps.c
> > > > +++ b/arch/alpha/kernel/traps.c
> > > > @@ -925,7 +925,9 @@ void
> > > >  trap_init(void)
> > > >  {
> > > >         /* Tell PAL-code what global pointer we want in the kernel.=
  */
> > > > -       register unsigned long gptr __asm__("$29");
> > > > +       unsigned long gptr;
> > > > +
> > > > +       __asm__ volatile("mov $29, %0" : "=3Dr"(gptr));
> > > >         wrkgp(gptr);
> > > >
> > > >         wrent(entArith, 1);
> > >
> > > This looks good to me. The explicit $gp read and use of
> > > current_stack_pointer avoid relying on the unsupported local
> > > register-asm behavior.
> >
> >  It could have been worth mentioning in the change description that no
> > code quality regression results here with GCC:
> >
> > --- arch/alpha/kernel/traps-0.dump      2026-08-11 11:57:59.895247441 +=
0100
> > +++ arch/alpha/kernel/traps-1.dump      2026-08-11 11:56:31.788713285 +=
0100
> > @@ -2223,8 +2223,8 @@
> >                         1b70: GPDISP    .text+0x4
> >      1b74:      00 00 bd 23     lda     gp,0(gp)
> >      1b78:      f0 ff de 23     lda     sp,-16(sp)
> > -    1b7c:      10 04 fd 47     mov     gp,a0
> > -    1b80:      00 00 5e b7     stq     ra,0(sp)
> > +    1b7c:      00 00 5e b7     stq     ra,0(sp)
> > +    1b80:      10 04 fd 47     mov     gp,a0
> >      1b84:      37 00 00 00     call_pal        0x37
> >      1b88:      04 00 00 c2     br      a0,1b9c <trap_init+0x2c>
> >      1b8c:      08 00 1e a6     ldq     a0,8(sp)
> >
> >  Also I think our coding style would rather see the asm written as:
> >
> >         __asm__ __volatile__("mov $29, %0" : "=3Dr" (gptr));
> >
> >  Otherwise:
> >
> > Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>
> >
> >   Maciej
>
> Hi Matt,
>
> Given Maciej's comment on the inline asm style, do you want to send a v2
> of this patch, or are you happy for me to fold the
>
> __asm__ volatile(...)
>
> to
>
> __asm__ __volatile__(...)
>
> style change in when I apply it to the Alpha tree?
>
> Either is fine with me.
>
> Thanks,
> Magnus

Hey Magnus,

Feel free to just fix it up when you apply it.

Thanks,
Matt
