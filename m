Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D5E847C
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 17:42:04 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1a25c4f49b2so1147235ad.0
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 10:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680889324; x=1683481324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCJBn+LV6Sw7OAfizOJEGae3D9tERqlvcOUfu0w0v9w=;
        b=f2Hy+gUmypC61FZjpBgjNc/XgvxTOME7kxHD5CgsiiLONDJ0uGaPOd0VsvyK9IAcKM
         YCMZlfDwqFaEOSmOdtSE2HeLW/0quTgY7Ny0dhk8px8kavE9LUIYdthXog1GIX+rq2fE
         g8QS73QBlzrsxk6gaJ+O/XLCA2rqxISinXTYyUthkLmBrbZM7ZIFXt9S38ACofBHt7P+
         dptOeElYK2OgQ0wNuuT3DfiVwL3MzQyLTRnlUE0+IB/r4ycxDRicgexH0w6MJtyetQ1+
         IGrOxD8aNU79hee5zjeh76EgzLJ6mJ4Ruz4wxkM/ZC6EOIWhplr5BfzYNq6f2EmnRqac
         A5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680889324; x=1683481324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCJBn+LV6Sw7OAfizOJEGae3D9tERqlvcOUfu0w0v9w=;
        b=WIBQXgo19VMi4CtygLzF0ZVYzy0/J9HT8deCOX1aDuXnWZ6peLTcRTga/Z+PTumP36
         BUUGMOv1poF3zNbwBZlclgrh1bCwzWXR4wSI+7Eg3txcanI4McyA+W6v8JHLQIcKuoB/
         TRZ7DBs9wTmkxWuVStLpm8DDBJaohpBpbJZppZwZrfRzYZ67KMUzogsmHZ5rB2XjD/ZF
         oziFyvcav8DUnSybiiBQuILrs2foUVNm/OFXD83zgS2eDCG+WYkTp1w523BdV/N9ok7p
         axCBv5OYZWzyWXKqGLdXtJy8fmvyjiavqKfmgVAA98jJeA0virCxQ3aBUjXgijLB6RGj
         /38g==
X-Gm-Message-State: AAQBX9cHjf68HWutnGp5G/MGSDrmAEMsEw+gywmKGw8xJVIFAFmh67Wc
	6POZ3V+rDzRlRf61O1i07+JZIZGKA789pbdqzXmzQw==
X-Google-Smtp-Source: AKy350aUCyZLaAV21BNIhr8D01YQwfaMcMC3ERAqD6aKrlIBdnYZELskAEaom95VFSvRH3V0KPE/o9w3eCEDFaZkXdI=
X-Received: by 2002:a05:6a00:2d88:b0:625:c832:6a10 with SMTP id
 fb8-20020a056a002d8800b00625c8326a10mr1525908pfb.4.1680889324079; Fri, 07 Apr
 2023 10:42:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230324132649.2649166-1-trix@redhat.com>
In-Reply-To: <20230324132649.2649166-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 10:41:52 -0700
Message-ID: <CAKwvOd=rjd6+Di4GSm2kfKRdBmrMyyL-VdQ+CR28NX_G5p0AGQ@mail.gmail.com>
Subject: Re: [PATCH] phy: rockchip: remove unused hw_to_inno function
To: Tom Rix <trix@redhat.com>
Cc: vkoul@kernel.org, kishon@kernel.org, heiko@sntech.de, nathan@kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 6:27=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c:284:36: error:
>   unused function 'hw_to_inno' [-Werror,-Wunused-function]
> static inline struct inno_dsidphy *hw_to_inno(struct clk_hw *hw)
>                                    ^
> This function is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/p=
hy/rockchip/phy-rockchip-inno-dsidphy.c
> index 726928ff1273..401b0aabb159 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> @@ -281,11 +281,6 @@ struct inno_mipi_dphy_timing inno_mipi_dphy_timing_t=
able_max_2_5ghz[] =3D {
>         {2500000000, 0x15, 0x54, 0x7f, 0x15, 0x6a},
>  };
>
> -static inline struct inno_dsidphy *hw_to_inno(struct clk_hw *hw)
> -{
> -       return container_of(hw, struct inno_dsidphy, pll.hw);
> -}
> -
>  static void phy_update_bits(struct inno_dsidphy *inno,
>                             u8 first, u8 second, u8 mask, u8 val)
>  {
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
