Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AD48F4A
	for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 12:14:02 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id b18so5455147ybp.1
        for <llvm@lists.linux.dev>; Thu, 23 Mar 2023 05:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679573641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CBcr6rGUQpq73pjYT7vRUWqGDW5Dr38jLB7HJdT5cIo=;
        b=voEb/826RcZ3kwUnJrKKb5X0HAbeEHDo9gxIa7fYVS2TgYVRFp8uQLGPf5rqZHl+hL
         Q/TNwsas90BLJQRUYzSmNUUVS1mlzjMMyIrkLWAYkIFqrjIX5nNAqZzEX6SwnOjt4tiz
         Lt3fG2Sx0aV86xTqdDs4TZZsEveXVz9psGjGoSLn3Uo4f2v0FRGNfLff+FeaGmdlHkiN
         fgA8epD3GnmWQDOPB9sJtcPHg2XvO/2/LrRw/UY9Pn0KdQZikvonson8U2c4q4ZFEqRk
         hbgu+3nxxqgPSw7s/Ajwzp/0lb9xvCHwZKVkXItCgf1MMGU6p8GmU6//bqu4XYYJVixI
         Bgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679573641;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CBcr6rGUQpq73pjYT7vRUWqGDW5Dr38jLB7HJdT5cIo=;
        b=A4oZKvOb2sQL4IYZnnZjrq5buNll6yFx7+7enANX4qkwBDPm89/JfW5J8sjiRRcy3G
         FkS/H5LyI6ilAt+Eu+PS2AWcVkt/e/6hVw46E1LxPuDhDIyLqyDiF5RJSrXIrz7Tm4X9
         pIw/5+y9ssr3h8e97UQjJKPZ/D5xuKKo6pB1SHLek8Dq7Trxze3wbbCQZlppp5yr63bm
         ii8UP23Jn1cSIywe1XGrM5apUZIWNLW0h82H4IlSVnxKPkkdYQ5ZeTHngUX5V8XoozTO
         B21r7ki86VAhVR1jgHZelbMeVAh9HEFfjgROGFWyKa50jpDB3jXJPxAW4eXnrxm8f6Hu
         BUrQ==
X-Gm-Message-State: AAQBX9ehb3pLWv5qwkNWJrrv3L67LTxLZmpWVpXj0HJ+AvkooktB7erU
	nU0p556RpOfLpJ6Wvc21OZazwh5P4LkXDKJPGRABkQ==
X-Google-Smtp-Source: AKy350a5HqJ3Do5D8FQMtsU4FwpW2pRvPpCLBVv/YVEXdN/L2HtAIv5Arz6/7Km/jGditdZo9mvd1J5GFyhyQUTw4+I=
X-Received: by 2002:a05:6902:1689:b0:b75:8ac3:d5d9 with SMTP id
 bx9-20020a056902168900b00b758ac3d5d9mr948334ybb.3.1679573641152; Thu, 23 Mar
 2023 05:14:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230319164744.1707169-1-trix@redhat.com>
In-Reply-To: <20230319164744.1707169-1-trix@redhat.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Mar 2023 13:13:25 +0100
Message-ID: <CAPDyKFqfdYKXwaCbT6_hBsX1ZxeVtNivZBQmh3gA8554F944hA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdricoh_cs: remove unused sdricoh_readw function
To: Tom Rix <trix@redhat.com>
Cc: saschasommer@freenet.de, nathan@kernel.org, ndesaulniers@google.com, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Mar 2023 at 17:47, Tom Rix <trix@redhat.com> wrote:
>
> clang with W=1 reports
> drivers/mmc/host/sdricoh_cs.c:104:28: error: unused function
>   'sdricoh_readw' [-Werror,-Wunused-function]
> static inline unsigned int sdricoh_readw(struct sdricoh_host *host,
>                            ^
> This function is not used, so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdricoh_cs.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/mmc/host/sdricoh_cs.c b/drivers/mmc/host/sdricoh_cs.c
> index 76a8cd3a186f..57b8c1a96756 100644
> --- a/drivers/mmc/host/sdricoh_cs.c
> +++ b/drivers/mmc/host/sdricoh_cs.c
> @@ -101,14 +101,6 @@ static inline void sdricoh_writel(struct sdricoh_host *host, unsigned int reg,
>
>  }
>
> -static inline unsigned int sdricoh_readw(struct sdricoh_host *host,
> -                                        unsigned int reg)
> -{
> -       unsigned int value = readw(host->iobase + reg);
> -       dev_vdbg(host->dev, "rb %x 0x%x\n", reg, value);
> -       return value;
> -}
> -
>  static inline void sdricoh_writew(struct sdricoh_host *host, unsigned int reg,
>                                          unsigned short value)
>  {
> --
> 2.27.0
>
