Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB8A2115
	for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 18:36:39 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id o18so2082901pji.1
        for <llvm@lists.linux.dev>; Fri, 13 Jan 2023 10:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j4F3gMakR5EjuEaFBMZ7D8qgSZpXpMhQV5Lb3h6YkX4=;
        b=sqwP3bvcIkIkHlOHuaj7PzhrogErMceNfkIz1l7wmrEJ52RKt1ZoLaNFxbpOSA3UpL
         wq1sh1ojD/X7Iy6a9obxqvPAX82NCW94JSqZoXJ4VPostzzk8OBUzRW2QZCxPsty/wXb
         9IXClLbv/GxUW9SLkr6zfzlHZd7HpiTaZ8Yvy9soWUs1OemOk/v/NO8MYlwrCl9zXF5+
         HCfWR+ud6GaZDcvdGETTwikzINdoumIpGP5pl8ezxXEzc3zwN5BIhZBeMaQiCdi43Xmr
         yAQ8h9uEbmzXOuUyEHA/9lDV/SU+Yesi9ACAmnts4FF2odbDNYPf5Uon+/q/RdhTXpub
         HMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4F3gMakR5EjuEaFBMZ7D8qgSZpXpMhQV5Lb3h6YkX4=;
        b=vDHE0d6MXY+wIjyCRYQnFF1YHN2ZLRdjLmGHPycYiiLustfjD2yY9c10+kBD8LA3i+
         XydrkoicK9U5lBMb645gGY2J8EHMmVXBEm4JyCmX3AeWwVfzIHfo/ldolgwQLW1me9CJ
         7JLD6hGNMvYBRiERc+SCTB5WEukS6G9uJ7XGBbPsGkeI2Z91xN91V9bpR5xXVzfKYs90
         XEcgE73liDaZ0KZ5j1NcqpGAyDzY9ob0J+iYO5jp4VdqRPqU/VXeM3zx2kU+hYNDarFu
         X1VqER25V47vqqwIpZbJ2BHxopziEKIVZdx7SZjvCZWG3zGBXec7Yza191lIqjNjplPE
         8JrA==
X-Gm-Message-State: AFqh2kobHJJWi3IM+I2wT8G8Rg1ZEN3Op5hU1JREz2a/LWX10Ja0kT+M
	/pC3kgHqDOub+oWAeXqCEZlktqQ10dKJhunc32QBKQ==
X-Google-Smtp-Source: AMrXdXut+ZVz9p9DBkW4zfz3GUwV90SnmUswJaW85cGYlU4XXpHCwXHrnm3bYtlfE6P1Eb4qY9jWr4Npr5okcAdcplU=
X-Received: by 2002:a17:90a:488a:b0:226:b5f4:d420 with SMTP id
 b10-20020a17090a488a00b00226b5f4d420mr3958048pjh.102.1673634998456; Fri, 13
 Jan 2023 10:36:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230104132646.7100-1-chunfeng.yun@mediatek.com>
In-Reply-To: <20230104132646.7100-1-chunfeng.yun@mediatek.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 13 Jan 2023 10:36:27 -0800
Message-ID: <CAKwvOdnMF4LRhTnQ3Rg+q3hd7jm2tS0aTHmwU6isKJHL2u9Q-g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] phy: mediatek: fix build warning caused by clang
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Eddie Hung <eddie.hung@mediatek.com>, 
	kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 5:26 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> Remove the temporary @mask_, this may cause build warning when use clang
> compiler for powerpc, but can't reproduce it when compile for arm64.
> the build warning is -Wtautological-constant-out-of-range-compare, and
> caused by
> "BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask)"

Can you please include the text of the observed warning?

>
> After removing @mask_, there is a "CHECK:MACRO_ARG_REUSE" when run
> checkpatch.pl, due to @mask is constant, no reuse problem will happen.
>
> Fixes: 84513eccd678 ("phy: mediatek: fix build warning of FIELD_PREP()")

Uh, why was 84513eccd678 sent/reviewed/merged if it didn't fix the
issue correctly in the first place?

Is the issue perhaps that your mask isn't wide enough in the first
place, and should be?  See:
commit cfd6fb45cfaf ("crypto: ccree - avoid out-of-range warnings from clang")
for inspiration.

> Reported-by: kernel test robot <lkp@intel.com>

Can you please include the Link: tag to the lore URL of the report?

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v6: modify the title
> v5: no changes
> v4 new patch, I'm not sure it can fix build warning, due to I don't cross compile
>     it for powerpc using clang in office.
> ---
>  drivers/phy/mediatek/phy-mtk-io.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/phy/mediatek/phy-mtk-io.h b/drivers/phy/mediatek/phy-mtk-io.h
> index d20ad5e5be81..58f06db822cb 100644
> --- a/drivers/phy/mediatek/phy-mtk-io.h
> +++ b/drivers/phy/mediatek/phy-mtk-io.h
> @@ -39,8 +39,8 @@ static inline void mtk_phy_update_bits(void __iomem *reg, u32 mask, u32 val)
>  /* field @mask shall be constant and continuous */
>  #define mtk_phy_update_field(reg, mask, val) \
>  ({ \
> -       typeof(mask) mask_ = (mask);    \
> -       mtk_phy_update_bits(reg, mask_, FIELD_PREP(mask_, val)); \
> +       BUILD_BUG_ON_MSG(!__builtin_constant_p(mask), "mask is not constant"); \
> +       mtk_phy_update_bits(reg, mask, FIELD_PREP(mask, val)); \
>  })
>
>  #endif
> --
> 2.18.0
>


-- 
Thanks,
~Nick Desaulniers
