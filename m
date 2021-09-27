Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677D772
	for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 09:51:28 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id bj3-20020a17090b088300b0019e6603fe89so11388823pjb.4
        for <llvm@lists.linux.dev>; Mon, 27 Sep 2021 02:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SRePW3/TNCc7XAOvX2Kj8B2CrMxOQEcmgec1IIbW5Bc=;
        b=Kv0CFzwqmrmNCeq5ie36LnoFoefO3upoJO65nED9HFSLpOR8RWZrEybbVYO7On51L+
         yDr5vWV5JZQBK6y3B+w9GeG8IYVc4uzKBgVSguCCkzT3hUli/9zvA9HXvMzYD9YSwuB+
         Ed9zJmWD4L6tMMshbGjdANvnABU4nNzy3YaG9twfYmOKTHpbOq5XVOQFouj30mAUlZTi
         H3oFHfOM+UR1UEd4iPmH7cyAmNzYhkNgma7rk9envMghYIk6IYIK/UFa+wcf+L51zh/9
         gKntTZE8Te8MSY2DqGPODRBkP7dg8699MLXvo+eU1rfvJ38sNCJ5Bs9rSHwMJHQjaO73
         BLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SRePW3/TNCc7XAOvX2Kj8B2CrMxOQEcmgec1IIbW5Bc=;
        b=wlWxJEZqlinCNdkQkl+kBx8ohDvE8spHmITDEOLsrCWInhfJiIoP7Kj4mn1K478cLb
         LIbfRcem4YWhMnTTBSVdwJPvAp08HDXL2P0rM3m6A6i63mkbUDWF1/msfGg7eyT0Q5S2
         YYCKKPNvi8UgnW9lkflXfu01ydF3V2GMBh7VVq736CA4gpuPPrQXSC0HyOieo/6BW9iv
         eG+OHfXeCYp01VXPoxW2W6kS9EkokQiHWvUVPYxyMvCnmgWkmm1SUy3yI6dilb/bjafC
         tU40uv0acIDmBXNsPJteKRFk5O9LhYMHlASpfr4q2MpKS85csl8SEt23Xi+Ux1pZCFWm
         cALQ==
X-Gm-Message-State: AOAM532gDknm4QfuL18lDSjWorovHIjhAPcbOBYfU7iSEX30Muz2mCEd
	ZBfEopdO3Kz6S1J7ClkG9UQvSN6zti8X1NVKYAsQGw==
X-Google-Smtp-Source: ABdhPJy8qcfslrU6xWthqnTohHRpxrn9aUuU1mGA/gd6Rw6vxMIxAEKfecnkKiSEsHRjsb3BAljBhVwwKX2poMkSz6U=
X-Received: by 2002:a17:90a:f293:: with SMTP id fs19mr6467832pjb.137.1632736287919;
 Mon, 27 Sep 2021 02:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210927094327.644665-1-arnd@kernel.org>
In-Reply-To: <20210927094327.644665-1-arnd@kernel.org>
From: Martijn Coenen <maco@android.com>
Date: Mon, 27 Sep 2021 11:51:17 +0200
Message-ID: <CAB0TPYGWXAs5t_bG8BMs_9xvOmfsJiy1ejM0WoJC3Ts3yC6E1Q@mail.gmail.com>
Subject: Re: [PATCH] loop: avoid out-of-range warning
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, 
	Dan Schatzberg <schatzberg.dan@gmail.com>, linux-block <linux-block@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Mon, Sep 27, 2021 at 11:43 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang warns that the sanity check for page size always succeeds
> when building with 64KB pages:
>
> drivers/block/loop.c:282:27: error: result of comparison of constant 65536 with expression of type 'unsigned short' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>         if (bsize < 512 || bsize > PAGE_SIZE || !is_power_of_2(bsize))
>                            ~~~~~ ^ ~~~~~~~~~
>
> There is nothing wrong here, so just shut up the check by changing
> the type of the bsize argument.
>
> Fixes: 3448914e8cc5 ("loop: Add LOOP_CONFIGURE ioctl")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Martijkn Coenen <maco@android.com>

> ---
>  drivers/block/loop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 7bf4686af774..51315a93b399 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -277,7 +277,7 @@ static void __loop_update_dio(struct loop_device *lo, bool dio)
>   * @bsize: size to validate
>   */
>  static int
> -loop_validate_block_size(unsigned short bsize)
> +loop_validate_block_size(unsigned int bsize)
>  {
>         if (bsize < 512 || bsize > PAGE_SIZE || !is_power_of_2(bsize))
>                 return -EINVAL;
> --
> 2.29.2
>
