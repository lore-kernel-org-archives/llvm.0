Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E0113AA54
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 22:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711664551; cv=none; b=LkihYx4yCg7JN2kjJ2cm5LnQsSH8ueQdDr+iS/vDakxsYFJ9g9/0LiFsM4RgvkcptFIVHk00O8hewpn5uvYuU56i1px/a0qDPigMufdGVKeXEKkMGcmfKyXRAe4Skq98+boef1Fn+ST9sbdki2l9wW/EfCyOE1ME/hpi8XZJz7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711664551; c=relaxed/simple;
	bh=pgT/xSr/q7YOUPevv2EeewjHySxRn4YCFK6IyZ/aNb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bfve7uxVTWhfr8+1/bKBU8ZRDAKViJW9TfgaxaidY9lCLYViNMBqy7442AzsdJv+LLPtGiRixhOxZBYdYzmHTjO/QEDPbpDKqAxLBJaotBsl3/wH3slBr/h3ZFqcI8b+Tu2PcCorE0LVUSu6qgtq30Oytf/+MjvTZjr06iGeQfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cELou1Cz; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cELou1Cz"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56c147205b9so2594717a12.0
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 15:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711664548; x=1712269348; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/OjdkXwLEp7mczzswJbuZjPn4dGgroiJ8sIvpa89YE=;
        b=cELou1Czh1mF+S9/XdIALn0hf+AO77/ZLPkZxAol6EA4+fG7vPgTmfU8/QE1LbBEb+
         SPI1ewzAU7vGFTbbzV36lLBH2ffIPPJNIUfRgU4yIVCqOTLmyeslDTcfUDEYDPuVnoQb
         0E26tRxw+CxG7rJ8V3H8aXaW7GHTfB+J7qZJvZ3cUZ86JpoHMdqVBCVQHia+bdJ77jRF
         tAGGyXa7ZmGZjrmqXKKThcsKphQeao8rctEppCRL20W/nvhu/INLWfzAy3qsOl+EEzqi
         /evLsnUqME+EV4gt4tApdhI+s92F6I1BnA8/L83tqE4eMkBQNMy03jDamONd2OtPdiCq
         eTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711664548; x=1712269348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/OjdkXwLEp7mczzswJbuZjPn4dGgroiJ8sIvpa89YE=;
        b=lCdD6yM8S5uPdzNIy8FEAGfuBFKOMDed9/RGcfcT5K8BBg0aBYAUbcu2XAyD70qewr
         70mhh3OLBuv4BHfEiOPWT6JfgNNgeBpeBIt0fgNlHmEwh7sbKQZ5R8ztDwF5YrHU0a6X
         EwBGcKLg5S5oXP6j5E6sRIK+Q9uj/AqbR1RXDQBbm4Cc0g9A10GUuqWuWiUbXXlN06NA
         D4hEBZ0mj3hZKNC0UlK8qK1bzeUeGtcDngxidozzQmzXwpf0OgwnxEv5HpwNQlys11tX
         EPKuzEhWzce9Y1IEHp1pfDUCA9cDVRoVN0r1UHZexsSrwe23NRUhGyfS6Ci52COEeDDo
         ZpOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXgSmNpKYagUuZMYRXh9+vw6JvMHIemdIiQdAaVUR8hKzNWOtkqnlc9hIbgdQxZjuYtcf9tRICmvgRz8ZwwnYd8cTPAA==
X-Gm-Message-State: AOJu0YyjBn+L/6FGSJH94YwWLvImrBNh6C2U545Vo2uL1lCy/al+ajbE
	6yaFr2rbFs97gxoGalaxapR6PNz6iUOk8NhcF3CulTpbI33jsyUcxvnC2rx2VVybk1KCIVSy8BE
	0wrL7NgHBE9AI9nn0JhbaipVQxSffu6YdrHm4
X-Google-Smtp-Source: AGHT+IGxckfdewYCc6Tjhn2/sl6SaRBJ+pS/iXe46GfGkpDclyLzmNtDvyladQRwAYhZrkyCk/zHbrjCjRNd7FWr0Ac=
X-Received: by 2002:a50:9feb:0:b0:56c:53b2:9e32 with SMTP id
 c98-20020a509feb000000b0056c53b29e32mr527053edf.13.1711664547964; Thu, 28 Mar
 2024 15:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328143051.1069575-1-arnd@kernel.org> <20240328143051.1069575-5-arnd@kernel.org>
In-Reply-To: <20240328143051.1069575-5-arnd@kernel.org>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 28 Mar 2024 15:22:16 -0700
Message-ID: <CAFhGd8qDCMkP6rZ6A6i3b7DuJ0Rzem=V0TxAkvmMTsZM3NH43A@mail.gmail.com>
Subject: Re: [PATCH 4/9] kcov: avoid clang out-of-range warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Andrew Morton <akpm@linux-foundation.org>, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 7:31=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The area_size is never larger than the maximum on 64-bit architectutes:
>
> kernel/kcov.c:634:29: error: result of comparison of constant 11529215046=
06846975 with expression of type '__u32' (aka 'unsigned int') is always fal=
se [-Werror,-Wtautological-constant-out-of-range-compare]
>                 if (remote_arg->area_size > LONG_MAX / sizeof(unsigned lo=
ng))
>                     ~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
>
> The compiler can correctly optimize the check away and the code appears
> correct to me, so just add a cast to avoid the warning.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
>  kernel/kcov.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index f9ac2e9e460f..c3124f6d5536 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -627,7 +627,8 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsig=
ned int cmd,
>                 mode =3D kcov_get_mode(remote_arg->trace_mode);
>                 if (mode < 0)
>                         return mode;
> -               if (remote_arg->area_size > LONG_MAX / sizeof(unsigned lo=
ng))
> +               if ((unsigned long)remote_arg->area_size >
> +                   LONG_MAX / sizeof(unsigned long))
>                         return -EINVAL;
>                 kcov->mode =3D mode;
>                 t->kcov =3D kcov;
> --
> 2.39.2
>
