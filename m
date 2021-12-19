Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A99173
	for <llvm@lists.linux.dev>; Sun, 19 Dec 2021 13:48:50 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id y22so27679803edq.2
        for <llvm@lists.linux.dev>; Sun, 19 Dec 2021 05:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BDw8C0oiQt8krM7GPl59F/SHmEkDcuvz/QP/KiGHzGc=;
        b=tDq3jJ0Jfjv8roeqADo2cS65CRt1dPQigjxyfk9BrR4WFccgqyTkjbJ0da4Z9Mdtb6
         wEyiQETEG6qJ3wGHzbXQcQtsp/CSVWGm2Jj8w+v8lIUZ1TGJZUiSYSbWzzct6R/vdaKS
         h3bLapiirIA8xg2x/QLX5ubCks0y0f2maBRgbwDxR0aVyNBG2zoqkirJ1G8pG4UXdgqi
         fAn9CBg1kVz/zGMYu/xt6JUxJJ0dA9VFdPrBQRwRbanuKgN2fkjXaLcwwgzrTvvvS1uj
         Y4DeI0Z8G+3KnVQBQWzvdcUVhdOtAD/2bZe1qu+SU23LeTv1aATkay4zQhEFRykw4Mi5
         X0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BDw8C0oiQt8krM7GPl59F/SHmEkDcuvz/QP/KiGHzGc=;
        b=S0z2EkmlKzqsgkR4NgN/rq0e1c5kHU8o2B0QH5HZ1Uoy64IlQpsveMdyX/zTjZhI2C
         onw1qPwfX5rzFBIGX6HsqFclCs4JVFeASi1fyUHTRI/4Vx/HFXrFw6y97ieVV9M8gXmy
         vN6MgGSuVQVajJJX8MZ3EIcRooJnExO24R0ByuLQcw99GIugk7uBDzScoYlm+75C2D+m
         PexvZcrvEj85qiutQMUrSBC9Yrg2DbQy1ZjPuskm8u56dIHcaSCfZ0IQp16V42z0KMWh
         LhxGOFcNJvMKVus9y2N8PuwsvS5Q/WC3t0cSyjL7fNlUL7f1UR8/v592cG6dry44Szp9
         bXQQ==
X-Gm-Message-State: AOAM5307tNJkh/eS+wWwbkR0Ka70xP0wdrPUSF8H/rRKpxOlXtmgtbrW
	y8X8a0vImY6IT1dFXhvzgP8JeNCljoSb/B8Nq8AFJQ==
X-Google-Smtp-Source: ABdhPJzRohxotF39Bs+wpTjUL/P/dXK8VIR3E96T8ZEEXKcZ19/PnOSHQCC5M5ao7RmwWjnw+f+CBnuXdx+VvzpqGKc=
X-Received: by 2002:a05:6402:51c6:: with SMTP id r6mr11474208edd.365.1639921729252;
 Sun, 19 Dec 2021 05:48:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211218152712.2832502-1-trix@redhat.com>
In-Reply-To: <20211218152712.2832502-1-trix@redhat.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 19 Dec 2021 14:48:38 +0100
Message-ID: <CAMRc=Md5xqpu1vkipN+boN-=SnC4MOkHz=Cj3UnGnvr_Qv+21g@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: fix uninitialized ret variable
To: trix@redhat.com
Cc: Linus Walleij <linus.walleij@linaro.org>, nathan@kernel.org, ndesaulniers@google.com, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 18, 2021 at 4:27 PM <trix@redhat.com> wrote:
>
> From: Tom Rix <trix@redhat.com>
>
> Building with clang returns this error:
>
> gpio-sim.c:889:7: error: variable 'ret' is uninitialized
>   when used here
>
> ret should be the status of the call to
> gpio_sim_make_bank_swnode stored in bank->swnode.
>
> Fixes: 83960fcf4818 ("gpio: sim: new testing module")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpio/gpio-sim.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
> index ef6145f51c8ae..bef00dcc4dc8f 100644
> --- a/drivers/gpio/gpio-sim.c
> +++ b/drivers/gpio/gpio-sim.c
> @@ -886,7 +886,8 @@ static int gpio_sim_device_activate_unlocked(struct gpio_sim_device *dev)
>
>         list_for_each_entry(bank, &dev->bank_list, siblings) {
>                 bank->swnode = gpio_sim_make_bank_swnode(bank, swnode);
> -               if (ret) {
> +               if (IS_ERR(bank->swnode)) {
> +                       ret = PTR_ERR(bank->swnode);
>                         gpio_sim_remove_swnode_recursive(swnode);
>                         return ret;
>                 }
> --
> 2.26.3
>

Applied, thanks!

Bart
