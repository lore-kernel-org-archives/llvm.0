Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354C72F58
	for <llvm@lists.linux.dev>; Mon, 24 Apr 2023 20:42:20 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-63b73203e0aso30837484b3a.1
        for <llvm@lists.linux.dev>; Mon, 24 Apr 2023 13:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682368939; x=1684960939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5ZMC5VZS+YuBCnDNL+LpSQZtLatJs+u2JnjBvK8Odc=;
        b=DGbRYrvKbvAoKpxgR0HQbFQbYXIsz+xp2DGSkA2iOQ8mk1waOeWr+SQSqHjNuasxPf
         8n+vMTsSnPigKcKIoYZz5PxLBhE5efTfaOCZ8JQV/rP6KgWH3nnIBQVYIr26Po+rSVfL
         XKUeFmdh9NNpkHFwRbRXZrVl72cOFnBWI8Dgk+co7z1DsCZf3I+iGPR2qA6JciXH6DEX
         Qh0waztvz2vfOG82eC66kLBXYiKWml2zHWu/0w++9GWg6HxYxWvVKbS71C6Drwt+GaGj
         UnoKPfxkLl/YsG6phBs1KAw1BycVRWcxeqF4Q9S3pHsn0wCjS3bASvhbon6oYA/iVdX2
         4r2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682368939; x=1684960939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5ZMC5VZS+YuBCnDNL+LpSQZtLatJs+u2JnjBvK8Odc=;
        b=fv4RfOfamGCJ4Qa2I2LCIfkN6RHpODNFz9Ts2AhmxGl1gLe9XOxrg4I48Qc7gpE3v/
         B/pubthRY1DUYa/l9sK92nLkBi9vy4D27YNYl8GJGVsyf08n6WMjSS6DPn5fTAQSKVs+
         5k5EhTyLCuGAJGXdNFwEeKuualOPEV4lQ2k98/9CjJb6s/ah3dygzKiedL+kAYjwvnbZ
         BZY7ubtwN+13vJQh/u0IYDxi3U3eP+UMH5+IwlibLbTKzb9YpzIgNj1nYNeWTBH5CZvV
         tiiNfE/bAuZXzuBmOcBYELMfmwaaskB6CUuV8xNgL0x8EVTud+2HmwfFbOpNj7RNjdQL
         mT0Q==
X-Gm-Message-State: AAQBX9d8wdqiqtoCOyeXe7F12abt3Xt3oby1RyEZj99RAMnoFOo1j4dT
	aH1bnNY7KQnIVP96pAPpR6dfTRnbvHbb8RjMIWQQnA==
X-Google-Smtp-Source: AKy350bsHQq1EzNGt73/j+nTzeIplaa5l3Hebw0touKLhbf8se1E6Dle8Z8ftc4k7i07Zf4ORu/GiUefhBFP9DGqO5w=
X-Received: by 2002:a17:90a:6b43:b0:246:9517:30b6 with SMTP id
 x3-20020a17090a6b4300b00246951730b6mr22012160pjl.4.1682368939446; Mon, 24 Apr
 2023 13:42:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230413-fixes-for-mt8195-hdmi-phy-v2-0-bbad62e64321@baylibre.com>
 <20230413-fixes-for-mt8195-hdmi-phy-v2-1-bbad62e64321@baylibre.com> <20230421221330.GA3657732@dev-arch.thelio-3990X>
In-Reply-To: <20230421221330.GA3657732@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 24 Apr 2023 13:42:08 -0700
Message-ID: <CAKwvOd=5szkx5yA0bxcyktx85opAwLrB3_4n13SMV7p3m9x7LQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] phy: mediatek: hdmi: mt8195: fix uninitialized
 variable usage in pll_calc
To: Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Vinod Koul <vkoul@kernel.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 3:13=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Fri, Apr 14, 2023 at 06:07:46PM +0200, Guillaume Ranquet wrote:
> > The ret variable in mtk_hdmi_pll_calc() was used unitialized as reporte=
d
> > by the kernel test robot.
> >
> > Fix the issue by removing the variable altogether and testing out the
> > return value of mtk_hdmi_pll_set_hw()
> >
> > Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt81=
95")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> Can somebody pick this up? It fixes a rather obvious warning, which is
> breaking clang builds (as evidenced by three versions of the same fix).

$ ./scripts/get_maintainer.pl -f
drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | grep maintainer
Chunfeng Yun <chunfeng.yun@mediatek.com> (maintainer:ARM/Mediatek USB3
PHY DRIVER)
Matthias Brugger <matthias.bgg@gmail.com> (maintainer:ARM/Mediatek SoC supp=
ort)

Chunfeng, Matthias, can one of you pick this up, please?

Or Vinod who merged 45810d486bb44 FWICT?

>
> > ---
> >  drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/m=
ediatek/phy-mtk-hdmi-mt8195.c
> > index abfc077fb0a8..054b73cb31ee 100644
> > --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> > +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> > @@ -213,7 +213,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *h=
dmi_phy, struct clk_hw *hw,
> >       u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
> >       u8 txpredivs[4] =3D { 2, 4, 6, 12 };
> >       u32 fbkdiv_low;
> > -     int i, ret;
> > +     int i;
> >
> >       pixel_clk =3D rate;
> >       tmds_clk =3D pixel_clk;
> > @@ -292,13 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *=
hdmi_phy, struct clk_hw *hw,
> >       if (!(digital_div <=3D 32 && digital_div >=3D 1))
> >               return -EINVAL;
> >
> > -     mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> > +     return mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_lo=
w,
> >                           PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
> >                           txposdiv, digital_div);
> > -     if (ret)
> > -             return -EINVAL;
> > -
> > -     return 0;
> >  }
> >
> >  static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
> >
> > --
> > 2.40.0
> >
>


--=20
Thanks,
~Nick Desaulniers
