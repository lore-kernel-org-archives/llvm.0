Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C1D1350DD
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708109954; cv=none; b=LCRYfeZ8TEkI6BDaYYRvp1oVWNhrJMXm60BDgHrVZwZjs89v9SNdoc1za6EN7lH4h9kkKtisLbxpSzEmhmSzIujdeSEUSuz+fdT3Pmk3+6Ifa+lD6JoDkVgWs5r8uqY2IXROgBbZNboPdEWQTQ5uY/dZ3MO+PmmVPGDt/aoD+/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708109954; c=relaxed/simple;
	bh=2grfByF3ve3Ig9RbIPNo0Mh4tKTJI+lUin+Kymx8HRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qYURURO3oJZs6VR9qsX+njG2Vax+0D3Z0XCxQUm69QJMQ40H6DnTvToyvEL8+LDr06NrKDQB4oHkIGd/mzAk5/dqe+NOc5+9GYxiWMFJvcYcmjnVjCHvkXpLy0nv6xP3PkXPY19WidPDWzw2XxNx6exWtD8hXw/Gp9MTGVJ+DRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1ZyYm+2S; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1ZyYm+2S"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55ad2a47b7aso3391039a12.3
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 10:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708109951; x=1708714751; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bq17W6SIJMVFiVDQxckTnzA5OE2gedi1A5TqO2suh2M=;
        b=1ZyYm+2Sh9tLjLWnFKwKVhsBYWdI0AwLbh7AkqucC6+rOmn5QvYVtSJSFQGRBxrqJ5
         4KYfTDWIYAPB/YY26B7wI5lEwRnJQ6pJ+3EV/LoVvsu9KXvt9+auK58NY3liEalAlNLn
         hXf9yoprYEwa7kyt4G3/3k0oKHcNjh36xyMtjYYy9xNOphzcX541bq8AeqRxZiSyBQuZ
         9u4RA+Q1q2D5rAtFv8/V1CQE2Bc/kBwaBBxq5xtnLXuwrgPqvdIsisdBISFUWINmVZEl
         cL17og/ydeYD2mPDPpkq2aeoZVT/4PFYWPAt0e6bes90j4g1gk3jg6GUKN+e/gCm9CGp
         9PnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708109951; x=1708714751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bq17W6SIJMVFiVDQxckTnzA5OE2gedi1A5TqO2suh2M=;
        b=YPOM4OD7xCzt4gX5l2gh6YXXJvXVTlY+C9tPYjX/QO9e0TyeFwco5LYYSn5q3zsGDR
         aLgOhiIRKnIduVGeEIecl/z+YPXbz4jVhu4XwohkOkkokD+6wwFlFxBJdCxyRJ0qeunM
         GBl1JL++vt28AB97ugGNz7Haqajf+E8g9p8BkN5Izfirvi1t/tKHdyXQsIiIXTgwW9Ot
         hLBDqkTp9oWPN/BAsARdUcOf5hOjHgxr0C5+EqDtDE7ZEzD0kTPm2c20vpm+ho/z9psQ
         GZyYY/F85OqYPMANO84EzvvzG6NKcxjQF4yun2KQPPgk1yhBj3HLY9bkMYPEcxx/bbCX
         OOTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVv325s3AxiTtHY41m8NDuE93KnocK9QTwe2vqtpYHuhfLsYA+F1FKg6R05pxWZmWYFSfPjG7yJUICYGdf4QmYFtmceZQ==
X-Gm-Message-State: AOJu0Yxzzg2+tgMwSRRUlt2dblsqdIXhAL5KXd8RlqZvLq6yAFXev619
	YAGGlbjyLz6H9N20Jj44MVH8Lr7IiFl54u1leDn1aEFj8+iTtgjv5JQVMtP5OVLvkeU5a6lvYST
	rxeemZmsVbhvYNA68LwvAdIW6Tmy/nzVXI8Wq
X-Google-Smtp-Source: AGHT+IGqVIJex1/G8rhzXDwOgZM0k+G8zaMETshLR4ChT1MwR+ecSyTyIFpwrDlkp8s4NBTPZn2zLT6t8B3cVj9KN4Y=
X-Received: by 2002:aa7:d614:0:b0:55f:f2ae:20ed with SMTP id
 c20-20020aa7d614000000b0055ff2ae20edmr4226097edr.16.1708109950725; Fri, 16
 Feb 2024 10:59:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240213142831.3069049-1-jbrunet@baylibre.com>
In-Reply-To: <20240213142831.3069049-1-jbrunet@baylibre.com>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 16 Feb 2024 10:58:58 -0800
Message-ID: <CAFhGd8oQ5jh21U4SG3aN5eZJ5h+Ywk4WLFa0yPz8bquFmA1mag@mail.gmail.com>
Subject: Re: [PATCH v2] nvmem: meson-efuse: fix function pointer type mismatch
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 13, 2024 at 6:28=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> clang-16 warns about casting functions to incompatible types, as is done
> here to call clk_disable_unprepare:
>
> drivers/nvmem/meson-efuse.c:78:12: error: cast from 'void (*)(struct clk =
*)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-=
Wcast-function-type-strict]
>    78 |                                        (void(*)(void *))clk_disab=
le_unprepare,
>
> The pattern of getting, enabling and setting a disable callback for a
> clock can be replaced with devm_clk_get_enabled(), which also fixes
> this warning.
>
> Fixes: 611fbca1c861 ("nvmem: meson-efuse: add peripheral clock")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/nvmem/meson-efuse.c | 25 +++----------------------

I love negative diffs                                    ^^^^^^^^^^^^^^^

>  1 file changed, 3 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
> index b922df99f9bc..33678d0af2c2 100644
> --- a/drivers/nvmem/meson-efuse.c
> +++ b/drivers/nvmem/meson-efuse.c
> @@ -47,7 +47,6 @@ static int meson_efuse_probe(struct platform_device *pd=
ev)
>         struct nvmem_config *econfig;
>         struct clk *clk;
>         unsigned int size;
> -       int ret;
>
>         sm_np =3D of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0=
);
>         if (!sm_np) {
> @@ -60,27 +59,9 @@ static int meson_efuse_probe(struct platform_device *p=
dev)
>         if (!fw)
>                 return -EPROBE_DEFER;
>
> -       clk =3D devm_clk_get(dev, NULL);
> -       if (IS_ERR(clk)) {
> -               ret =3D PTR_ERR(clk);
> -               if (ret !=3D -EPROBE_DEFER)
> -                       dev_err(dev, "failed to get efuse gate");
> -               return ret;
> -       }
> -
> -       ret =3D clk_prepare_enable(clk);
> -       if (ret) {
> -               dev_err(dev, "failed to enable gate");
> -               return ret;
> -       }
> -
> -       ret =3D devm_add_action_or_reset(dev,
> -                                      (void(*)(void *))clk_disable_unpre=
pare,
> -                                      clk);
> -       if (ret) {
> -               dev_err(dev, "failed to add disable callback");
> -               return ret;
> -       }
> +       clk =3D devm_clk_get_enabled(dev, NULL);
> +       if (IS_ERR(clk))
> +               return dev_err_probe(dev, PTR_ERR(clk), "failed to get ef=
use gate");

Wow, this simplified nicely and doesn't make any new helpers (like
Arnd's version).

Reviewed-by: Justin Stitt <justinstitt@google.com>

>
>         if (meson_sm_call(fw, SM_EFUSE_USER_MAX, &size, 0, 0, 0, 0, 0) < =
0) {
>                 dev_err(dev, "failed to get max user");
> --
> 2.43.0
>

Thanks
Justin
