Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4F28F4A
	for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 16:27:50 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id n17so13037171uaj.10
        for <llvm@lists.linux.dev>; Wed, 22 Mar 2023 09:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679502470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcBh8LbgiZnRhxN9ZOExXV06VdRnER7GdJGafrPv3AA=;
        b=lLbOg/bI0Dt7zVFdc55ZLV/hefFjA7ho51BY5gzdLMX6Oyig4MrRdDK9z9blgXY5bO
         nuxQ0YLJFsW/vCWmqo22bc0rxCbKlPnqOmxyhuuCSjYyKI4Qz4pTH2nCNdDpLUvaqg5s
         GkeWJJ0gZynt+siiqozduL/YGDbrgyIkiVMLEzSK/KZ1ZsXCyDNH8f5JUNmeGpIE5+4X
         ROtBj8CelDicuOx9TKlP8rVfW4qCUWByDs1X3vfCz6UQYz6CMVUneVXA4nWQlFRIKIaR
         pe9EXYZNLwatGCN+mYjBhxl2EpARc3ka7ArZtYZlWC+mtONp0wmC14KjIkvA0TFJ5YEI
         ESUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679502470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcBh8LbgiZnRhxN9ZOExXV06VdRnER7GdJGafrPv3AA=;
        b=pi3H3Cy1oL+ptN98d2H4ETwj+mqw+xusyix0tj3jILh5KMCQBHxgmGKFD+kckaLCQj
         ha3GzmNmV6Egq/YSOMAz+uZw6EGOirstLF/8E/YkiyCQZnAw00N/S3xB9boFmIZvQSAe
         E1GJHkxiFPds4ueYIQg2zcbZP3Fy312gSolWGguE3jbm8CoGsodU0p8gHCB+j02EJCow
         tqsCzaUa0MOUgwbliRY9YQ4GYhHotMTUUSQCgupZrlOuaymWUcRmKtOfXME7stspmaZj
         MKFrHyqx2h4mbUy5qQ4cgHfsR9AxTrCXxtCydSIuuEH0RGwWQZ1hDXQrlyCO1MvfJjuU
         m8iw==
X-Gm-Message-State: AO0yUKURftEr9lLhawDqWLhwCnaw248U0NhDyzi1orXjYIadlpn01TBH
	mjHrPLTTHtO95PoS31S5wdo3xSAUYjue/Y8n/GojYg==
X-Google-Smtp-Source: AKy350apkN3Ok9m7z9C5n8gXItofIv4O6BGooPA8ZvkwmqTth2C+Qhld0DPukx24/DJ0VdX72givemdT/lEhKYvO67M=
X-Received: by 2002:a05:6130:228:b0:68b:923a:d6f4 with SMTP id
 s40-20020a056130022800b0068b923ad6f4mr3595319uac.2.1679502469910; Wed, 22 Mar
 2023 09:27:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230319143640.1704735-1-trix@redhat.com>
In-Reply-To: <20230319143640.1704735-1-trix@redhat.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Mar 2023 17:27:39 +0100
Message-ID: <CAMRc=MfMDLC1npyyjGe+Ph6fNwB_Wau7XDPMAnM-wPzec3_rfA@mail.gmail.com>
Subject: Re: [PATCH] gpio: pxa: remove unused gpio_is_pxa_type function
To: Tom Rix <trix@redhat.com>
Cc: robert.jarzmik@free.fr, linus.walleij@linaro.org, nathan@kernel.org, 
	ndesaulniers@google.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 19, 2023 at 3:36=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpio/gpio-pxa.c:174:19: error: unused function
>   'gpio_is_pxa_type' [-Werror,-Wunused-function]
> static inline int gpio_is_pxa_type(int type)
>                   ^
> This function is not used, so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpio/gpio-pxa.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
> index 1198ab0305d0..a1630ed4b741 100644
> --- a/drivers/gpio/gpio-pxa.c
> +++ b/drivers/gpio/gpio-pxa.c
> @@ -171,11 +171,6 @@ static inline struct pxa_gpio_bank *gpio_to_pxabank(=
struct gpio_chip *c,
>         return chip_to_pxachip(c)->banks + gpio / 32;
>  }
>
> -static inline int gpio_is_pxa_type(int type)
> -{
> -       return (type & MMP_GPIO) =3D=3D 0;
> -}
> -
>  static inline int gpio_is_mmp_type(int type)
>  {
>         return (type & MMP_GPIO) !=3D 0;
> --
> 2.27.0
>

Applied, thanks!

Bart
