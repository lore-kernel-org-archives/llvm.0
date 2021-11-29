Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC46572
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 10:19:30 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id y68so40776348ybe.1
        for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ppG/ZLMPwOtn6jb5uz3xg0bkyKQKbtFMdorf6y+f5O8=;
        b=fH0Z+H11NlvR2Vo3lKedItgHqleYX6iHBY+IGVtYaZjg+fDnsbzHXbPU+hxwM5OZzD
         /wRycMore58LZFi2gM/Hvc3sgfqq1hU9GP7q2sNcSRNIqIneoCJcaTcAs2INj8VXI/5l
         9M1fdnpMcVoWPRukw7kMFMIMOwcOk5cOb+lYzZBvubIjXuhmFIQpFfLlyyV7jKaXyq/X
         0J+bGNT7h7wcZ9azbn3Nov2S0Z/8RQQdGfxNz9tRnuMFCTHTdHHfRdT1TzWRJDAo9ytt
         DLTxXQu4VIXN6HIvp60bjA2OtOG5h0dwdLfc9bVIn2dsCCwnq71bsrDdJUAZEoypEWYj
         qKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ppG/ZLMPwOtn6jb5uz3xg0bkyKQKbtFMdorf6y+f5O8=;
        b=oJ+LY9WTTvvyH3C68KxQkieTmXVIgmOZDIKY2r7EfOykgzSC1T2RARkv1s5EsLdZpL
         +SJAesC3rPhndle/moRWH7bpMP1s0j+xkfHjrNRldwu+3MnJmaa0455KvbtKNC0vORRP
         eflp+bEPiFr44aTIw4Z+NVN3DufC7DZsUoOqhCKRM0rpE9IuiBmKNwzm37oAbJaKPtQC
         +gsPyE+AGuq+Heze/cY1H2JSJJEnSAeLrXBlzqb8M+KpIV6MWD3pP3eb/YXLZkv6nvIj
         r4cgt5y83JGNGbzA/S/BLbLHIgOt+EFzFtiGXg//LePJWop7t9hhJpAyS4eAcX2sWeFU
         ZzZw==
X-Gm-Message-State: AOAM533SoX1mj0LiaULTHuZfhGf/MJFtcS3zPy9iZKZN2oCgxzkdxdut
	uy1QFbU67YdX1zcR9nu24Gzske7wy7ohNvOLeJg=
X-Google-Smtp-Source: ABdhPJzG7Lik7bR0zFFLYlNQEHnT5wMALB0Xeav5csPj+MAzakqOJjCvBkEbkO/PqI3cA8q0BuWMFqAVoWf0kx9DPEY=
X-Received: by 2002:a25:abe3:: with SMTP id v90mr34015526ybi.315.1638181169899;
 Mon, 29 Nov 2021 02:19:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1638179135.git.mchehab+huawei@kernel.org> <0c086fea0d3f0771f6c8627e99edb719e282a49c.1638179135.git.mchehab+huawei@kernel.org>
In-Reply-To: <0c086fea0d3f0771f6c8627e99edb719e282a49c.1638179135.git.mchehab+huawei@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 29 Nov 2021 10:19:04 +0000
Message-ID: <CA+V-a8tDNmNDoOGyt-qD13Rk1ta8_EqNBydSpvGW_X-LcD76BQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/20] media: davinci: vpbe_osd: mark read reg function
 as __always_unused
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, LKML <linux-kernel@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 29, 2021 at 9:48 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Such function is currently unused, but could be needed in the
> future. So, keep it, marking it as __always_unused, in order to
> avoid a clang W=1 error.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>
> See [PATCH v2 00/20] at: https://lore.kernel.org/all/cover.1638179135.git.mchehab+huawei@kernel.org/
>
>  drivers/media/platform/davinci/vpbe_osd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/davinci/vpbe_osd.c b/drivers/media/platform/davinci/vpbe_osd.c
> index 91b571a0ac2c..32f7ef547c82 100644
> --- a/drivers/media/platform/davinci/vpbe_osd.c
> +++ b/drivers/media/platform/davinci/vpbe_osd.c
> @@ -45,7 +45,7 @@ static const struct platform_device_id vpbe_osd_devtype[] = {
>  MODULE_DEVICE_TABLE(platform, vpbe_osd_devtype);
>
>  /* register access routines */
> -static inline u32 osd_read(struct osd_state *sd, u32 offset)
> +static inline u32 __always_unused osd_read(struct osd_state *sd, u32 offset)
>  {
>         struct osd_state *osd = sd;
>
> --
> 2.33.1
>
