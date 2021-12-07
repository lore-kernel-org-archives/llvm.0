Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0837B2C9D
	for <llvm@lists.linux.dev>; Tue,  7 Dec 2021 18:41:36 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id t26so378436lfk.9
        for <llvm@lists.linux.dev>; Tue, 07 Dec 2021 10:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sNKguMW+u5SvzONn4ivanKXtsjFVQkC6LMddUtJSEUk=;
        b=aDIAN17BKGq0GIN+YPIlQpFEpU4IUGBEknSlUTURp1gnh6I71NueXG/IAR3kdGGdnb
         LXMkE3sM3iS1y3vT4KBCqNdcAzBh0GwpFSY5BZemA+TV9dieQBcMWd4/UUeLInNlkuQW
         Bf+QMp2p6J6HDkVKgrVYIl6fLaEjWgoqLxuWNHZp7QGVxyaXHU2M2pLj7KRcT6w9jvpe
         O5LW/kXKV27CBR25kEBseIpFQxdPcpxkMwlMKja49bqU9dOWidyseQGcyzsz6F4R1qO8
         wHM04ZWGdvFpC4HyJWrMHKaz3QULjsP6DkWcM+Q/H1pkgRGltpi1JaMR6nA+D/q3r45P
         tNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sNKguMW+u5SvzONn4ivanKXtsjFVQkC6LMddUtJSEUk=;
        b=fdEzfw9uzAHKzEJwYec8kjeuyroc6jS5PxL5Ixa1ux4W5j3UzsExVofrCdIuBEQZxZ
         x7tbTk0c53TNelcYRzRkZeLgHAXatqwDkScZ+IoVKfs+qQLp0fq19R8OYer9s4Upvj4v
         8UpjElU6Vn09PYf77cWuQFa6eU7ychhcia5S22+hjNsID3EpsiOsYg6UJJm/xsaYtCTG
         D5zuox261/a6H/hVhqnxUFQotQNlpnpGcIiVi4Gd9w1Dl2eWjaIOe1E42CIXINEV2ZsR
         0MRyFGTAwCwMXRF6JJpOCzKjcjgwtjycnmARYcISNDMn7/WOKhSZt650+AwEnZQM6nw8
         J9nw==
X-Gm-Message-State: AOAM531/zfI3CZ50QKwsqhDboI3KIyPt9tI03A+2WCwwQVidmmDl3Ore
	+yOHo//v6Vig8S72B0pCZepuPCCtdQL1GKok/PsYug==
X-Google-Smtp-Source: ABdhPJyeHj3lrlUlDby3ennl3ufCpDgdCUvs6c7j5SLDxK90H6tLe6REyxb4vxCtSTv4FGgP01zjRMahD5LyaHn+DeQ=
X-Received: by 2002:a05:6512:3d16:: with SMTP id d22mr41550500lfv.523.1638902494780;
 Tue, 07 Dec 2021 10:41:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211204220249.591482-1-arnd@kernel.org>
In-Reply-To: <20211204220249.591482-1-arnd@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 7 Dec 2021 10:41:24 -0800
Message-ID: <CAKwvOdnZSyfZaa1crQ15DGNNj8JBspnM0xxOF3D2mTt96Ftfgw@mail.gmail.com>
Subject: Re: [PATCH] power: reset: ltc2952: fix float conversion error
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, =?UTF-8?Q?Ren=C3=A9_Moll?= <Rene.Moll@xsens.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 4, 2021 at 2:02 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang-14 does not like the way this driver converts a 'long double'
> to an integer when the target architecture disables floating point
> support:
>
> drivers/power/reset/ltc2952-poweroff.c:162:28: error: expression requires  'long double' type support, but target 'x86_64-unknown-linux' does not support it
>         data->wde_interval = 300L * 1E6L;
>                                   ^
>
> Turn this into pure integer math and make it more readable at the
> same time using the NSEC_PER_MSEC macro instead.
>
> Fixes: 6647156c00cc ("power: reset: add LTC2952 poweroff driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for the patch! The change in clang-14 (ToT) that triggered this
has had another patch on top reverting these diagnostics.
https://reviews.llvm.org/D114162

That said, this change is still worthwhile for the improved semantics, IMO.

Link: https://github.com/ClangBuiltLinux/linux/issues/1497
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/power/reset/ltc2952-poweroff.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/power/reset/ltc2952-poweroff.c b/drivers/power/reset/ltc2952-poweroff.c
> index fbb344353fe4..9fc88a9f244c 100644
> --- a/drivers/power/reset/ltc2952-poweroff.c
> +++ b/drivers/power/reset/ltc2952-poweroff.c
> @@ -159,8 +159,8 @@ static void ltc2952_poweroff_kill(void)
>
>  static void ltc2952_poweroff_default(struct ltc2952_poweroff *data)
>  {
> -       data->wde_interval = 300L * 1E6L;
> -       data->trigger_delay = ktime_set(2, 500L*1E6L);
> +       data->wde_interval = 300 * NSEC_PER_MSEC;
> +       data->trigger_delay = ktime_set(2, 500 * NSEC_PER_MSEC);
>
>         hrtimer_init(&data->timer_trigger, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>         data->timer_trigger.function = ltc2952_poweroff_timer_trigger;
> --
> 2.29.2
>


-- 
Thanks,
~Nick Desaulniers
