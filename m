Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D057B
	for <llvm@lists.linux.dev>; Sat,  9 Jul 2022 00:09:36 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id va17so250565ejb.0
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 17:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Kre5cz4l5Tf0VTuUpoElE2gdZV8MsECS9JN4JXo2R0=;
        b=AWRq3jVXftz43iikcTXj5ErIBHPO5xGsl61/iSsZIJgeaDyYrxrJ+CqcvHKgmtLnNi
         DoW3+TTA3MSV8dJIUvWq30swSalzhV6PCcy5pjFV/0nX/tFxotW7Jl8/pmlJMYBONup3
         Hyzv4uyk819g0FkPUZKKmRV/1qePIFc4RsIHIVxV5lJXPgdL5Hh1gKSpy2v/xy6cETJ+
         1OxYO3cxNck6zBKvKAlkxpZzOc4ehfk1xHKXQjmkySFk2AClxze0j4x4Vy3o2Qka7947
         0Q9ur+SoQsaTA2jrpl8EJpTJgTY6D5e5mlGCwySnL3x/TfcZ2QX+AkRC+sW52K1oQB4E
         GV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Kre5cz4l5Tf0VTuUpoElE2gdZV8MsECS9JN4JXo2R0=;
        b=k2zum22os1X93Ns5WOfToX214Z6nLDISiJmF3BM/Ie16mhMtz5vR3ymy+5JzoO4Yov
         xwTwN2jKPZO0R3SkV3sDaFbhJRLE/tOYuuG1KLKhuIysJAd4v4pJGlmtBy51FGWlOSWV
         sJTK997dFWg44uTISibIduVl+A5eVWUmDR4g5Nx2Xe3svWEQ5lpK0LYFTMNmEWXHBabQ
         vQxvKsodijR/zD3d0tFU+VuJ/NGKKdMqZxcfh3I1nZpnMbzSa/zxGLegD4PPgNRDOKGG
         zHqx5DbGbb6pWWHizrP94nCHpOIte7YL3kX38y8O37Leic1bYug6ZTASPAbUIa945rCa
         7HRQ==
X-Gm-Message-State: AJIora/ptQuDAJ5Rt8yuyy4GI4Vh0ZTygqmkv48/p7MiQ+7GCHOUJ5zc
	+4AhBgm3Gq/dTvXrxlP2JrgsjHA4iEJQ+XaoCf28Og==
X-Google-Smtp-Source: AGRyM1t0nY+KGPSZvS28pWTlJJjpkvrJngzngq9dm5rNV1Y6hdJx8eIZiDUw3C4gkDHMadOpmMGuXwSg+LEhnasix/c=
X-Received: by 2002:a17:906:8a45:b0:72b:31d4:d537 with SMTP id
 gx5-20020a1709068a4500b0072b31d4d537mr2312274ejc.170.1657325375105; Fri, 08
 Jul 2022 17:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220708232653.556488-1-justinstitt@google.com> <CAKwvOdnhzwg0OswLc+RwgX0=Z4beF6EEO09w8Ezdhg-YyXQeJg@mail.gmail.com>
In-Reply-To: <CAKwvOdnhzwg0OswLc+RwgX0=Z4beF6EEO09w8Ezdhg-YyXQeJg@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Fri, 8 Jul 2022 17:09:24 -0700
Message-ID: <CAFhGd8rCXR=Vq918tN0KDgzohuDhR=YAYvbXmG6rqKsXU-BnkQ@mail.gmail.com>
Subject: Re: [PATCH] amd-xgbe: fix clang -Wformat warnings
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 8, 2022 at 4:48 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Fri, Jul 8, 2022 at 4:27 PM Justin Stitt <justinstitt@google.com> wrote:
> >
> > When building with Clang we encounter the following warning:
> > | drivers/net/ethernet/amd/xgbe/xgbe-dcb.c:234:42: error: format specifies
> > | type 'unsigned char' but the argument has type '__u16' (aka 'unsigned
> > | short') [-Werror,-Wformat] pfc->pfc_cap, pfc->pfc_en, pfc->mbc,
> > | pfc->delay);
> >
> > pfc->pfc_cap , pfc->pfc_cn, pfc->mbc are all of type `u8` while pfc->delay is
> > of type `u16`. The correct format specifiers `%hh[u|x]` were used for
> > the first three but not for pfc->delay, which is causing the warning
> > above.
> >
> > Variadic functions (printf-like) undergo default argument promotion.
> > Documentation/core-api/printk-formats.rst specifically recommends using
> > the promoted-to-type's format flag. In this case `%d` (or `%x` to
> > maintain hex representation) should be used since both u8's and u16's
> > are fully representable by an int.
> >
> > Moreover, C11 6.3.1.1 states:
> > (https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf) `If an int
> > can represent all values of the original type ..., the value is
> > converted to an int; otherwise, it is converted to an unsigned int.
> > These are called the integer promotions.`
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/378
> > Signed-off-by: Justin Stitt <justinstitt@google.com>
>
> Thanks for the patch, this fixes an instance of -Wformat I observe for
> x86_64 allmodconfig.  I thought you had already fixed this file up?
> https://lore.kernel.org/llvm/20220607191119.20686-1-jstitt007@gmail.com/
> which was merged. I'm guessing that was from a defconfig, while this
> was from an allmodconfig?
> Seems like there's a bunch of config ifdef'ery around the definition
> of netif_dbg.

Definitely different across configs but ALSO files are
ever-so-slightly different:
amd/xgbe/xgbe-drv.c      _v.s_      amd/xgbe/xgbe-dcb.c

>
> Either way, thanks for the patches and
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
>
> > ---
> > For clarification, the first three parameters given to netif_dbg did NOT
> > cause a -Wformat warning. I changed them simply to follow what the
> > standard and documentation recommend.
> >
> >  drivers/net/ethernet/amd/xgbe/xgbe-dcb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-dcb.c b/drivers/net/ethernet/amd/xgbe/xgbe-dcb.c
> > index 895d35639129..c68ace804e37 100644
> > --- a/drivers/net/ethernet/amd/xgbe/xgbe-dcb.c
> > +++ b/drivers/net/ethernet/amd/xgbe/xgbe-dcb.c
> > @@ -230,7 +230,7 @@ static int xgbe_dcb_ieee_setpfc(struct net_device *netdev,
> >         struct xgbe_prv_data *pdata = netdev_priv(netdev);
> >
> >         netif_dbg(pdata, drv, netdev,
> > -                 "cap=%hhu, en=%#hhx, mbc=%hhu, delay=%hhu\n",
> > +                 "cap=%d, en=%#x, mbc=%d, delay=%d\n",
> >                   pfc->pfc_cap, pfc->pfc_en, pfc->mbc, pfc->delay);
> >
> >         /* Check PFC for supported number of traffic classes */
> > --
> > 2.37.0.rc0.161.g10f37bed90-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
