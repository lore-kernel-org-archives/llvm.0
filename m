Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EB34C72
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 23:48:13 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id m18so150910lfg.10
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 16:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pv/kMkRXLTmjNlh49xKQLUzHkabn6pqCOnhb5uu/n7E=;
        b=Iqd/944B5JiBG7p6ksdmO0GUZ4qrnQMi/cOZtevlIaX7we0yVtFSiQV6u/gVu87PVu
         iSdor1XOrotUAnhOBPJnkHwpepagsDEG7xfH1y7+7UwJnJHrhiBpn0rqcXVAv/btO3ko
         t/fEV8xFM8pDS3IaDHC5dcc6c4kMMjBwu8a7Pk4HB0XtW03UwVqZ0acr6lq97X7/9MSn
         OMtrHoVJgmuF8/yNZnpIA9Ko+0UDIRksYUoZE0w5bgsaI68L0hszdNPHfh2zTm+Ll9Vi
         ycVv4QI8zAXSdOBrYxfw3A5x3VjJnvrw49gQM+Eh+dFXuNmCY8NK0u5F5M3HFGYNuyT9
         eTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pv/kMkRXLTmjNlh49xKQLUzHkabn6pqCOnhb5uu/n7E=;
        b=OQxRBypDkLa/+8ylWL44I/oLqOX6iIsX3f7Ztv3Cexi7e83V5iI1U/ofFAT3k87vvy
         73w5U2nPCQRrLAOvI2UiXl/VPMAnOOg2Be8AIc3E3EjOR+8t0PDAWHjGYwfGroacdjxb
         kcm/qnPE844ko1d3ydW1vIU97WPhp8wxySxDurSwPtr3mquqCL5BAn4tud9/UWX8WKvv
         VYXbB2R7nrSY8p/rsqlRJK+sOfsODseiPS1FGt8mSkVtZEWpPFg8mgjf8hHjN184p8T7
         gytMwcEIBDhvMCi+Bt/As0ZLRhGEGlildGWLBox4ahCv5OMNbDXpNzOAGUR1Ux9bJtZv
         BRkA==
X-Gm-Message-State: AJIora+I+xFgFF0WZolsVBeah2MT1HCHqXpIN/QyP6gdwrDG3yOBZtJQ
	+EzJ+LOiC62IdmXduCw/zENEfpIBD0Kok1LZ9Y5lcQ==
X-Google-Smtp-Source: AGRyM1uoxri5xBzbkCOkKoBGRKW38ISN7unT41Wp5JJBP9Qk62V89Vj/Xf1lfVnuMPdipiZkscI6YtbzhbxPPQIRiaA=
X-Received: by 2002:a05:6512:2623:b0:47d:ace7:c804 with SMTP id
 bt35-20020a056512262300b0047dace7c804mr3937905lfb.647.1657324091178; Fri, 08
 Jul 2022 16:48:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220708232653.556488-1-justinstitt@google.com>
In-Reply-To: <20220708232653.556488-1-justinstitt@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 8 Jul 2022 16:47:59 -0700
Message-ID: <CAKwvOdnhzwg0OswLc+RwgX0=Z4beF6EEO09w8Ezdhg-YyXQeJg@mail.gmail.com>
Subject: Re: [PATCH] amd-xgbe: fix clang -Wformat warnings
To: Justin Stitt <justinstitt@google.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 4:27 PM Justin Stitt <justinstitt@google.com> wrote:
>
> When building with Clang we encounter the following warning:
> | drivers/net/ethernet/amd/xgbe/xgbe-dcb.c:234:42: error: format specifies
> | type 'unsigned char' but the argument has type '__u16' (aka 'unsigned
> | short') [-Werror,-Wformat] pfc->pfc_cap, pfc->pfc_en, pfc->mbc,
> | pfc->delay);
>
> pfc->pfc_cap , pfc->pfc_cn, pfc->mbc are all of type `u8` while pfc->delay is
> of type `u16`. The correct format specifiers `%hh[u|x]` were used for
> the first three but not for pfc->delay, which is causing the warning
> above.
>
> Variadic functions (printf-like) undergo default argument promotion.
> Documentation/core-api/printk-formats.rst specifically recommends using
> the promoted-to-type's format flag. In this case `%d` (or `%x` to
> maintain hex representation) should be used since both u8's and u16's
> are fully representable by an int.
>
> Moreover, C11 6.3.1.1 states:
> (https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf) `If an int
> can represent all values of the original type ..., the value is
> converted to an int; otherwise, it is converted to an unsigned int.
> These are called the integer promotions.`
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Thanks for the patch, this fixes an instance of -Wformat I observe for
x86_64 allmodconfig.  I thought you had already fixed this file up?
https://lore.kernel.org/llvm/20220607191119.20686-1-jstitt007@gmail.com/
which was merged. I'm guessing that was from a defconfig, while this
was from an allmodconfig?
Seems like there's a bunch of config ifdef'ery around the definition
of netif_dbg.

Either way, thanks for the patches and

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> For clarification, the first three parameters given to netif_dbg did NOT
> cause a -Wformat warning. I changed them simply to follow what the
> standard and documentation recommend.
>
>  drivers/net/ethernet/amd/xgbe/xgbe-dcb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-dcb.c b/drivers/net/ethernet/amd/xgbe/xgbe-dcb.c
> index 895d35639129..c68ace804e37 100644
> --- a/drivers/net/ethernet/amd/xgbe/xgbe-dcb.c
> +++ b/drivers/net/ethernet/amd/xgbe/xgbe-dcb.c
> @@ -230,7 +230,7 @@ static int xgbe_dcb_ieee_setpfc(struct net_device *netdev,
>         struct xgbe_prv_data *pdata = netdev_priv(netdev);
>
>         netif_dbg(pdata, drv, netdev,
> -                 "cap=%hhu, en=%#hhx, mbc=%hhu, delay=%hhu\n",
> +                 "cap=%d, en=%#x, mbc=%d, delay=%d\n",
>                   pfc->pfc_cap, pfc->pfc_en, pfc->mbc, pfc->delay);
>
>         /* Check PFC for supported number of traffic classes */
> --
> 2.37.0.rc0.161.g10f37bed90-goog
>


-- 
Thanks,
~Nick Desaulniers
