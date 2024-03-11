Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D0F41C7F
	for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 15:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171324; cv=none; b=jEAnwsRzbVvUYzz6KPFTJsH0GW4agGBlBMhwSFePoZGqVM5g2s04K6LXG3WZYb62BqlO6Y5RUHPI6jRV0wik/2/xpDkfLrylMqdRM327lhPZfTPgRiQ0Kz7Z4bSGuxQGvBCj0Bm75+vNZpz4/VgMpdjalcZaYmu3qI/J5xYDdrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171324; c=relaxed/simple;
	bh=yKZsPRglr0ZQ1yZL1/IqHRaa49+uMoiCC9xWSQW9lNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZ9JMKx5FZUCvCCiaQVIMyheXkpoNOJVsZ1B2HISz/KdZ68832OOL+jFtiVq29FUVXHf7sfUhCL3uUAxHDHV4cX02tchVT3k9ygCyo5IVTGSkKOoiGF/FI0Jj3JrOHNLaSeA74UUPiBLn+DT9JaS1s9Ya++bon4x9/G34EJ5XbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IPKqqpLo; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IPKqqpLo"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5a1f24cc010so860226eaf.1
        for <llvm@lists.linux.dev>; Mon, 11 Mar 2024 08:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710171322; x=1710776122; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tK2Wb65W8iaksfA8u2I5qSZ+Jq94YjuxrhXdJ1n7aDk=;
        b=IPKqqpLoyRXTtyA2itvZtG38YAMpTyZy5zAgpR4kQUDmkYE2G2QDGS93CWMNQYykdW
         krXc15vZTPvY8ledK+pyrK5SzRDFC8TNMcdEHIwTtdstlU19OIVjDrJ6joFYD6ytspjE
         svMk9+CNKe8BTZhH02XLDFHC1XY/jWd0kJoR8zbHOS8kaS1qkufeHLPU6DC7KKBtOAO2
         mfGEs/DOF0LchiuUVDbJqD0j6BaG0emH/M9HycIyq4iwO2djGvnseo9xvgidK9tkQyRM
         UzIbgLqSe8evIE+UMfCxdijC7HOHfff/pwFQBDJe4TONUHJgSVcC2LZSt60i/30+xoGi
         5ofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710171322; x=1710776122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tK2Wb65W8iaksfA8u2I5qSZ+Jq94YjuxrhXdJ1n7aDk=;
        b=BvzK7bf56f6QXiRx9wL4SgfxgkDzaie0qy8WwQrozUlKPyH1sLgyIiRoOXKq5x0Pdc
         2k8i7pM3qz1E9YaXO5c8Ijvt8pAU8it1CNR4pJbhIAIO/75XhPH7LpXOC0Hh8OyHmxda
         a89facxqe4jHfGrp56VqLFrAVfgo7LwH1OyV8XtsxJEbez4keMBgAAa8ikfRad7EOo2S
         NrapSWeSojFu6legC4qlYURzvkUi+U5fTLcM0OsPcE5RuFijLzvlVkoUFmrPzeNjgJjC
         DKIbEI9PznjB0TokfVArDgjMO9WhtlCgAdI8zzE8r7WTjxAnP8/Pn2GY9f/FeJ7dWquh
         KrGA==
X-Forwarded-Encrypted: i=1; AJvYcCWIpy9w5QCQ3rrhzFm624DNyltOHrpNvHqYJY1J6OJLPSQIm0Z3+J3lnvE5y8VNX2/sfsRmOkJjtaxAgzfFdK4PnrqbfQ==
X-Gm-Message-State: AOJu0YxoWrsHFI0ICdUOAu7EG3QLNDZuVAlUmI/t39wQiMEdmAJFTdn4
	4BAmZJ1zL2fcJRab5iyRjxFiI+IN4mrenhx+C/J0+z4ZPeEr+uWfQw+nLZNSd1pxzvM7Z+wlma3
	oNkQk3QbtxNdq2rh081hCYkLlejFcontdJk39
X-Google-Smtp-Source: AGHT+IEIubRui/XU6YMndbo7JLmvQK+Rbcj1zFggb5dwn5HyKdCMWYgbSkR2C9UJAFOKL3ziJ+M+3N4cCaS5MeiBMbA=
X-Received: by 2002:a4a:9d50:0:b0:5a1:d715:483d with SMTP id
 f16-20020a4a9d50000000b005a1d715483dmr5257022ook.7.1710171321776; Mon, 11 Mar
 2024 08:35:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240311-arm32-cfi-v3-0-224a0f0a45c2@linaro.org>
 <20240311-arm32-cfi-v3-2-224a0f0a45c2@linaro.org> <Ze7RNalwiZbceFxX@shell.armlinux.org.uk>
 <CAMj1kXHNK+peQUjO4dRnQmLDF+4of0F7cOTSoMPKucMT6NiGDw@mail.gmail.com>
In-Reply-To: <CAMj1kXHNK+peQUjO4dRnQmLDF+4of0F7cOTSoMPKucMT6NiGDw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 11 Mar 2024 08:34:43 -0700
Message-ID: <CABCJKuf6CWw5Ff955H5qD1Nva-j3WJZ-5A7Rb1TyBwCaEd3E2A@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] ARM: tlbflush: Make TLB flushes into static inlines
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Linus Walleij <linus.walleij@linaro.org>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2024 at 3:04=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> wr=
ote:
>
> On Mon, 11 Mar 2024 at 10:39, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> >
> > On Mon, Mar 11, 2024 at 10:15:39AM +0100, Linus Walleij wrote:
> > > Instead of just using defines to define the TLB flush functions,
> > > use static inlines.
> > >
> > > This has the upside that we can tag those as __nocfi so we can
> > > execute a CFI-enabled kernel.
> >
> > Why? This seems to be brain dead.
> >
> > Why can't CLANG cope with directly calling e.g.
> > cpu_tlb.flush_user_range? Why does it need a static function to do
> > exactly the same as the macro does?
> >
>
> I had the same question, so I played around a bit with the code.
>
> What I think would be better is if we could add the __nocfi annotation
> to the type, i.e.,
>
> --- a/arch/arm/include/asm/tlbflush.h
> +++ b/arch/arm/include/asm/tlbflush.h
> @@ -205,8 +205,8 @@
>  #include <linux/sched.h>
>
>  struct cpu_tlb_fns {
> -       void (*flush_user_range)(unsigned long, unsigned long, ...);
> -       void (*flush_kern_range)(unsigned long, unsigned long);
> +       void (__nocfi *flush_user_range)(unsigned long, unsigned long, ..=
.);
> +       void (__nocfi *flush_kern_range)(unsigned long, unsigned long);
>         unsigned long tlb_flags;
>  };
>
> This works for some function attributes (e.g., __efiapi is used like
> this), but the attribute specifier to which __nocfi resolves does not
> appear to be usable in the same manner.
>
> Best would be to annotate the asm code using
> SYM_TYPED_FUNC_START/_END, so that the CFI machinery is invoked at the
> call site to validate the function type of the destination.

Agreed, ideally we would annotate indirectly called assembly functions
with CFI types and avoid __nocfi wrappers.

Sami
