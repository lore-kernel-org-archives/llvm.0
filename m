Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A92352022
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 17:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786470909; cv=pass; b=kIjlO1dG6NYncHzPlxOqipwS1NfO5w7uBH2fm84y10VM7Nc2Nbm9ePV8VRddTIm99hG1R0zpQ+M7I9BPvWEd6Sv119qpYd81pfrETUPJFcTJNuAvcVs2lnlfZtq1hv8rZAYwYeXTFZfX0A8bGYdnskiRtLxI7nKT9ZzQZmAbeAY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786470909; c=relaxed/simple;
	bh=fk3cj3bj08mSlvA6SO698MI0UqKOknXv52CFioKh+/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSpGwkchmBQojRaMJMB2pM2ai7H4/+KLlRmuoizcpQVWMEedwPRxAhNyCClXW0EnPIj7sHO3Byn5uGTZHM7P3kVBJ2oVEBWqtHmb7Dh4q9kQZ0pZJfz01Fn1K4+ahpx71vTE2QkUzHZBgVAYn7QMytAuTOeHmb9kW8F2rkHXdIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zd9r/EJ8; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zd9r/EJ8"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c1c4c7ddaf6so11257066b.3
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 10:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786470906; cv=none;
        d=google.com; s=arc-20260327;
        b=TlIXlye6qL/Hn0t/xt8HTnzbF/x7OqCStopi4Njq6bNHwNmQTzemw7JV4QXmTpFh4M
         ErANZBolprGLyj35eAM2ms3z9YAAQJLtIy3T4CsI75hBYYF4c3mFlaZx3yrO3INlWqDV
         5+6x8/Uwv3iBm7yGbinisiM562ca5CD07A7A4CkHaiAMSWAwerzHa3Ec1F74mi3L9gDq
         +DqSfS799YuSjaZZ6SM/NujhmsLrZYgvRPAN2nkhjAZDt6soaz2RVx+U3EcL2lWgdC4n
         CJF7sYZQ9Ze9Tr0aqOHjfNpz69bc/eCwXYR9ir+lsw0NIj+9pT+yzaMsRZzwfCFd7zep
         DqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s33/23a4ORZv3N7HYPVzxR1l7OBRJzVtzzr7ljH0lXw=;
        fh=p7YanW855hssnxW9sMnvhVheObX94byrMuozqvfrgDY=;
        b=jZkabtkawrbVDUjHbVvEJS6RAZr0+yjBe8wBMfYki1W+WBDhKxC5Jh9N81Fk6zqlrd
         Tj66Zy7ujs+S/MCH+LIGuryfnsGhoL8ceN34lwsR2/CQUOPMkWJ5wfYzlxksNGqGyidj
         iCi+VdKt6RvM1dekZKIr+WnMHM9TRuwPQtRVHh4rNIQM2mxmvzwK93DE4LlQZ9BX4gfX
         njgIXJ+uZTbZcihs7gOrbcGbJN8xJj/dXoTHBh2qGZNemWHd4kSAQAzpItIKjgsktPIq
         AKLG4WCnIU7Hu4hcTJo97ZLnavJB2jbPNRM1Z3xSd13jW76iTyf/nnOkneqykCAWKppk
         /67w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786470906; x=1787075706; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s33/23a4ORZv3N7HYPVzxR1l7OBRJzVtzzr7ljH0lXw=;
        b=Zd9r/EJ8EWCnHFIDDFhBQTBjk8i3NNP4zkNwrFTgLtnsP88rbnGaE75pJ5wo9URfdo
         jALKuk3rttnWOwOH1KEpyQK6QHKaIBf+ZlcbzIXiEdet6u3FqMZObcNp1cNyXjuetZaW
         llRA96hLj0OzqF60gYk930kP4VSQXeRJeWxb4sWC0eUYzAexh2DiWeOFq1mMyU6Jf/fr
         K4Moxbc6j/pMiSwqgrwFo5T8qYrZOTWydfKnpt22igsyMjCVAnpuz4JJ3GnS2BNqt4wg
         X+cUi5VYlM8wvoP6HRhjInxvCF0QewaAaqmO7rU2mVw4a4Zii59SoCslZD0izp/AjpKV
         tR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786470906; x=1787075706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s33/23a4ORZv3N7HYPVzxR1l7OBRJzVtzzr7ljH0lXw=;
        b=YLg2vlYQMW6hfF580cRyERUk5MV02/iCJNRXNqLBNFWUMhakJJMum1DgJ8bM3AsKmE
         mPlZ8Tv8a5qxy/0IdVZlonDIHzLNN/CR5UGHG3cw6LNI1ZIP7mbaoEC2be/i0h+uegVs
         E58gwgAHX5sM+desp0p6+9cxxP2Q7kUfnGXSA42RRGijlZTdFhK2GVH9OwLIXJhCwM7X
         vyM5O2hfUOCVEr4NY3OhxzLuwFRdK2eLKZPdv3CuvCeesbgM/it9WSZ0X67RsE/6f87b
         r3UXr1fh3EsnhzAWWrtN3wGDsh1U8NoCrqLdIoJ8jLXmV2HhLRvNUMjPflrDOhQExWV/
         apBQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUR2o4Ux+ZfACaA6A1EGyH4aOpQlioIegvoDWq4cuxmpdK7AAs1YwT5grctydS7bYegDok@lists.linux.dev
X-Gm-Message-State: AOJu0Yx069gHVwKDNZ385IW1hYJcRMPx1uWicaNSb6F0Bp0kxNoCSkgI
	PBMS7f6cFwQWI025ekIH/6sZLrp/IBV6mGKmGvgKGK8qBeRySyANMVTmNE2AMcwLkKg869798X8
	VavW9Cx8n5onx6tN+RJyZsJqEd6h6yeY=
X-Gm-Gg: AR+sD13ZRNFzXj5xTZ1NRUS9ig3uXQdb/CihK4VgSKJ1s3b8pxH2zQ6V0jVb4fDgRYy
	M9NRoC7WE3/hecdS1jxUX/pNO4NikwRcwCG9OIMnSV6MPHYpGORgRMQ2+zVXunybXvTUJ3rLJxI
	8Juy+dxsRzqGUa2Sb1+pF5zhVL4Ne1hN2tYqMcq6+4a1qYeKHw453e9OpTi24u5EJshmpUSrraB
	htxQbN442txrkWNt5883mYqRh9yjQz6xbMhYHHXsJYTdyhgriaVidV1aM3Z7zDWPMldzoWX8wH3
	iLQIh9x+sV7vkNhtZaXHMAg0jRkQZinaqN3KRnvocgQIytTWK8FdDR/bcHgSYLKXLJltV6S0NZb
	KsVdBJfAbL03ZlIC6+bc+HouojwFv/w==
X-Received: by 2002:a17:906:99d2:b0:c16:29eb:e81a with SMTP id
 a640c23a62f3a-c20e62ab2fbmr267443266b.29.1786470905900; Tue, 11 Aug 2026
 10:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com> <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
 <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 11 Aug 2026 19:54:53 +0200
X-Gm-Features: AUfX_mwmYRsPi8HwxaB-iZ7wFAEzdikDqU9IB7Vfrv62aJ3SgXEP-mOrafoo-HM
Message-ID: <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Magnus Lindholm <lindholm@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:10=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Mon, 3 Aug 2026, Magnus Lindholm wrote:
>
> > > diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> > > index 7631129ac914..5b4f1ae2b74b 100644
> > > --- a/arch/alpha/kernel/traps.c
> > > +++ b/arch/alpha/kernel/traps.c
> > > @@ -925,7 +925,9 @@ void
> > >  trap_init(void)
> > >  {
> > >         /* Tell PAL-code what global pointer we want in the kernel.  =
*/
> > > -       register unsigned long gptr __asm__("$29");
> > > +       unsigned long gptr;
> > > +
> > > +       __asm__ volatile("mov $29, %0" : "=3Dr"(gptr));
> > >         wrkgp(gptr);
> > >
> > >         wrent(entArith, 1);
> >
> > This looks good to me. The explicit $gp read and use of
> > current_stack_pointer avoid relying on the unsupported local
> > register-asm behavior.
>
>  It could have been worth mentioning in the change description that no
> code quality regression results here with GCC:
>
> --- arch/alpha/kernel/traps-0.dump      2026-08-11 11:57:59.895247441 +01=
00
> +++ arch/alpha/kernel/traps-1.dump      2026-08-11 11:56:31.788713285 +01=
00
> @@ -2223,8 +2223,8 @@
>                         1b70: GPDISP    .text+0x4
>      1b74:      00 00 bd 23     lda     gp,0(gp)
>      1b78:      f0 ff de 23     lda     sp,-16(sp)
> -    1b7c:      10 04 fd 47     mov     gp,a0
> -    1b80:      00 00 5e b7     stq     ra,0(sp)
> +    1b7c:      00 00 5e b7     stq     ra,0(sp)
> +    1b80:      10 04 fd 47     mov     gp,a0
>      1b84:      37 00 00 00     call_pal        0x37
>      1b88:      04 00 00 c2     br      a0,1b9c <trap_init+0x2c>
>      1b8c:      08 00 1e a6     ldq     a0,8(sp)
>
>  Also I think our coding style would rather see the asm written as:
>
>         __asm__ __volatile__("mov $29, %0" : "=3Dr" (gptr));
>
>  Otherwise:
>
> Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>
>
>   Maciej

Hi Matt,

Given Maciej's comment on the inline asm style, do you want to send a v2
of this patch, or are you happy for me to fold the

__asm__ volatile(...)

to

__asm__ __volatile__(...)

style change in when I apply it to the Alpha tree?

Either is fine with me.

Thanks,
Magnus
