Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD115F4FA
	for <llvm@lists.linux.dev>; Mon, 15 Jan 2024 10:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NyqKSQR6"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4b8e5d64a4bso1144839e0c.3
        for <llvm@lists.linux.dev>; Mon, 15 Jan 2024 02:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705313540; x=1705918340; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zn/IBVOWpMMRpEDU1Op72zgW/plcgEu56p6VAHHMjqg=;
        b=NyqKSQR6QurVtgf3oXhymqQdD5YO8X6ngR1LI87Lt7khm95FNNqIwQRwkq4AY1bARZ
         qQ7aQAeinshl3oDo2euDYNZ0CZs0TRN915rgRhYAhTo8eP9jW74oLgMUc2iViapLqwyI
         47w/9KZ80d9EN1nVyD3e+aWX8rHfqIR9EELYPVVNcs65MpXtPdXjODHG7MeaNaZbnFdC
         YdSMAn4jdIel7tfNBv61OfBErxT6Nrp0Fjmo6tciHa1HQsRV1VTEFmbqnCYf1uVS4GUZ
         uHiVuOojMwWVmIePBrXlUuBcQYju6zeQqKRwBJEwlUzt0uzNrgEwY3K+naxuzlNgFIbj
         szzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705313540; x=1705918340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zn/IBVOWpMMRpEDU1Op72zgW/plcgEu56p6VAHHMjqg=;
        b=HNW+eGdjO/GDcbZfxfw6mVIzMUozxpr7mp9YEtHv7XvfoJBeohkh2fRZ6U5wS3vU50
         SMi8Q+Mx5/Z6rM8U9cMTA0scQoYhGESK78Kwl3jG5tJabbCfD5s5OgRnWLEWCh88RGY0
         XKRp/HYqUlZnTmjt9czFbg8KWmyxqdtfffSe+AMCf8DtotbAfRAA+IxRhJyKltAXx62n
         z7GnSqA3gfhHPVINmbBZfZ146M9YmQE+t8XZC/8OHOqUfZ144kAW7ZTdUBix43lzhKxJ
         glFd7aczAH+Pt9mDupX9+yXu1BwHArHn18g8VcsZeFIODdNBt4tn/ZsQM+y1rPlQRAZx
         l5mA==
X-Gm-Message-State: AOJu0YxXcGWhp9wCsldYTaxpY1kiGymEgbXwfyfnyRJh3R8FPQaLn9Pv
	mQrPsvwi3UGLEj35+ty7h8MSPtInYawlA9r3WmIQsBDBieoYmA==
X-Google-Smtp-Source: AGHT+IG+6FfSJ/63KIfkM4DCBfQbaFiAAhpMVZ3g61Gxu6cr4QzwOSBvdT0o3Zf1lAyRS5xN53QYacrHnUdaf0bd8wM=
X-Received: by 2002:a05:6122:4304:b0:4b7:386:e209 with SMTP id
 cp4-20020a056122430400b004b70386e209mr1919852vkb.14.1705313539903; Mon, 15
 Jan 2024 02:12:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240112042403.3940316-1-suhui@nfschina.com>
In-Reply-To: <20240112042403.3940316-1-suhui@nfschina.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 15 Jan 2024 11:12:09 +0100
Message-ID: <CAMRc=Mdx0OcvDN3rjjSe_K69xzEewe+JyR0639R1jOS9uhp1XA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mlxbf3: add an error code check in mlxbf3_gpio_probe
To: Su Hui <suhui@nfschina.com>
Cc: linus.walleij@linaro.org, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 5:24=E2=80=AFAM Su Hui <suhui@nfschina.com> wrote:
>
> Clang static checker warning: Value stored to 'ret' is never read.
> bgpio_init() returns error code if failed, it's better to add this
> check.
>
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/gpio/gpio-mlxbf3.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
> index 7a3e1760fc5b..d5906d419b0a 100644
> --- a/drivers/gpio/gpio-mlxbf3.c
> +++ b/drivers/gpio/gpio-mlxbf3.c
> @@ -215,6 +215,8 @@ static int mlxbf3_gpio_probe(struct platform_device *=
pdev)
>                         gs->gpio_clr_io + MLXBF_GPIO_FW_DATA_OUT_CLEAR,
>                         gs->gpio_set_io + MLXBF_GPIO_FW_OUTPUT_ENABLE_SET=
,
>                         gs->gpio_clr_io + MLXBF_GPIO_FW_OUTPUT_ENABLE_CLE=
AR, 0);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "%s: bgpio_init() failed",=
 __func__);
>
>         gc->request =3D gpiochip_generic_request;
>         gc->free =3D gpiochip_generic_free;
> --
> 2.30.2
>
>

I added the Fixes: tag and applied it.

Bartosz
