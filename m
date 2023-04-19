Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA1BD2FB
	for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 21:38:58 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-63b50a02bffso341075b3a.2
        for <llvm@lists.linux.dev>; Wed, 19 Apr 2023 14:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681940338; x=1684532338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JTmCaotOfaV1h3IJ4HXf1DbWD4RGkn54H++l5fDUFo=;
        b=vBA1djnPdRjKpD0HfWUTj2hCplrum/V+5d0zSFrtPLd2LdhYtQ2OHn20SHD3inoKqr
         3KKqRaD/9yUaN5No9d2GC8CTFBsk8IOCJFkhd6f+vNY4g6YOQYFWSznS1cMK4sw9glyB
         /mmOiJDR88Dy6+dDo6gn94HYVqtyVHBAgZsMwjQaFcnEERN7P2TYxkzT0QBKXC4rD3CI
         UYzzSPJXp8fP6lQc3SmnGDOc+aLEWTa5lMe/mvDzg7O/R2jL4tlOGMayWp4gW2fSjGai
         A/O+sw3KFDkrzGH2Gf7nEiUSsckSgPnIC5mhsUBOjzBvTbldexfuM+QRJ5oFKjIxXAjf
         i2sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681940338; x=1684532338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3JTmCaotOfaV1h3IJ4HXf1DbWD4RGkn54H++l5fDUFo=;
        b=BDvM2Zm4INMuIBNmX2kAWaXU45m68PVO+l/0grz9pTaxCgkaBLY61mS+XSq/7r6tm6
         w9y4Sl7aAs8jdvj4TORXydOQ4iHdGsDPxVv0svlJmHRfWp2EYTFVybgYkEo+OzkTH14O
         7D3+c78RqMvPW+rD+NX1RAlDUFZHpqP7cqgv09XNnQatZbeaLcsOz7cLWmdBh2cq07F/
         UuQheLmgBqdKfWEgVkne3bqG0G1NBGA8wiZYlnwjhwlDXX8aEdjh4Uf56NiW5HoJJmpb
         4gorirXLMCNw6v+GdNDVYC/qQHoUyvxYRx21kJaCuoasd8754qq/FXAzkPFmc8ay0Tr2
         z9Xw==
X-Gm-Message-State: AAQBX9fxrqyyPQx1fDOw0aMY+dIk0FJHfhS95iqD0iYD4Feu81RD9CaG
	k0vm+yNUxSHdNiKcr6CsN+CYEgqRAhT9iwgolwAUNT2QjFLjsjglUp7PYA==
X-Google-Smtp-Source: AKy350aeCvguQTHacMmVbQ+LzVKb3qsWKtIf7u2pYtp8gaB6jm6VD9QRkfZ+klN09A1KDxxr4QoGVmLzolsiqjlGYIE=
X-Received: by 2002:a17:90b:17d2:b0:23f:3539:d326 with SMTP id
 me18-20020a17090b17d200b0023f3539d326mr4239408pjb.0.1681940337754; Wed, 19
 Apr 2023 14:38:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
 <e1fed875-059d-bf98-f9da-09c51f362be8@i2se.com> <ZD+rethobzN+rONr@kernel.org>
 <CAKwvOdkKACfOvZ4BcG9NcO1Kh97vqSx0y7ZBc+BOJnHUpq8qWw@mail.gmail.com> <20ac24d6-4d94-4003-9203-d852714e1a46@app.fastmail.com>
In-Reply-To: <20ac24d6-4d94-4003-9203-d852714e1a46@app.fastmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 19 Apr 2023 14:38:45 -0700
Message-ID: <CAKwvOd=kShNVxFvjODEghrHGXK7Gekwcwb3cEFUgEBhZcOHC_Q@mail.gmail.com>
Subject: Re: [PATCH] staging: vchiq_arm: Make vchiq_platform_init() static
To: Arnd Bergmann <arnd@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	llvm@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 2:35=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> On Wed, Apr 19, 2023, at 23:21, Nick Desaulniers wrote:
> > On Wed, Apr 19, 2023 at 1:51=E2=80=AFAM Simon Horman <horms@kernel.org>=
 wrote:
>
> > Marking something as `depends on OF_DYNAMIC`. (Not sure whether Arnd
> > meant that for BCM2835_VCHIQ or BCM_VIDEOCORE).
> > Perhaps try that?
> >
> >>
> >> I'm a bit surprised as I didn't observe such a thing.
> >> But I also don't dispute it - clearly my testing was inadequate.
> >>
> >> I'll try and dig a bit deeper into this one.
> >> Perhaps starting with the report from the kernel test robot [3]
>
> I have this in my randconfig build tree, but it looks like I never
> sent it out.

What else have you got hidden up in there? ;)
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>


>
> ----
> From bb01f96d7dd66fc437302785f623a3ab323d486e Mon Sep 17 00:00:00 2001
> From: Arnd Bergmann <arnd@arndb.de>
> Date: Mon, 20 Mar 2023 11:33:52 +0100
> Subject: [PATCH] staging: vchiq_arm: mark vchiq_platform_init() static
>
> This function has no callers from other files, and the declaration
> was removed a while ago, causing a W=3D1 warning:
>
> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:5: erro=
r: no previous prototype for 'vchiq_platform_init'
>
> Marking it static solves this problem but introduces a new warning
> since gcc determines that 'g_fragments_base' is never initialized
> in some kernel configurations:
>
> In file included from include/linux/string.h:254,
>                  from include/linux/bitmap.h:11,
>                  from include/linux/cpumask.h:12,
>                  from include/linux/mm_types_task.h:14,
>                  from include/linux/mm_types.h:5,
>                  from include/linux/buildid.h:5,
>                  from include/linux/module.h:14,
>                  from drivers/staging/vc04_services/interface/vchiq_arm/v=
chiq_arm.c:8:
> In function 'memcpy_to_page',
>     inlined from 'free_pagelist' at drivers/staging/vc04_services/interfa=
ce/vchiq_arm/vchiq_arm.c:433:4:
> include/linux/fortify-string.h:57:33: error: argument 2 null where non-nu=
ll expected [-Werror=3Dnonnull]
> include/linux/highmem.h:427:9: note: in expansion of macro 'memcpy'
>   427 |         memcpy(to + offset, from, len);
>       |         ^~~~~~
>
> Add a NULL pointer check for this in addition to the static annotation
> to avoid both.
>
> Fixes: 89cc4218f640 ("staging: vchiq_arm: drop unnecessary declarations")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 90a3958d1f29..aa2313f3bcab 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -415,7 +415,7 @@ free_pagelist(struct vchiq_instance *instance, struct=
 vchiq_pagelist_info *pagel
>         pagelistinfo->scatterlist_mapped =3D 0;
>
>         /* Deal with any partial cache lines (fragments) */
> -       if (pagelist->type >=3D PAGELIST_READ_WITH_FRAGMENTS) {
> +       if (pagelist->type >=3D PAGELIST_READ_WITH_FRAGMENTS && g_fragmen=
ts_base) {
>                 char *fragments =3D g_fragments_base +
>                         (pagelist->type - PAGELIST_READ_WITH_FRAGMENTS) *
>                         g_fragments_size;
> @@ -462,7 +462,7 @@ free_pagelist(struct vchiq_instance *instance, struct=
 vchiq_pagelist_info *pagel
>         cleanup_pagelistinfo(instance, pagelistinfo);
>  }
>
> -int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state=
 *state)
> +static int vchiq_platform_init(struct platform_device *pdev, struct vchi=
q_state *state)
>  {
>         struct device *dev =3D &pdev->dev;
>         struct vchiq_drvdata *drvdata =3D platform_get_drvdata(pdev);
>


--=20
Thanks,
~Nick Desaulniers
