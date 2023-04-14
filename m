Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B3D33C0
	for <llvm@lists.linux.dev>; Fri, 14 Apr 2023 15:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7CCC433EF;
	Fri, 14 Apr 2023 15:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681487364;
	bh=5DqrhCTzuzTjvwCGlt19FA3g4stRfeUyytfgLiO4ps8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+M4c8lZ8CKUyLB4075G4N7ODWaHSg88hJWbhdpIVYS8u7hwMnq7mfLEE+BniHyD6
	 asCaVPm64ZeLyeyNT+N0Y6+uXFBgz8E7bJygkylSKH+9QA5IJT9yttrVxK6jqwCZfv
	 mcev16XlcOWWVwZqZa3svHdx6UeQN9splmLRfZ6PUJB4OMfgKLqihc7YlLo9sHiy4Q
	 ENYiYmQlt6YadBkHXG74JdINOamfMUJaUkXICj/tm4hnGviEnjxRcTG8fREkzOHriy
	 Ove74Hq/km8t/N+sARfWLfYXXZsnOPXx4Kgf6P5LpHKBJ0i71O0haS/6m03hvzia75
	 FkmDD8tCgTO1g==
Date: Fri, 14 Apr 2023 08:49:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
	chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	ndesaulniers@google.com, granquet@baylibre.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
Message-ID: <20230414154921.GB1931632@dev-arch.thelio-3990X>
References: <20230414122253.3171524-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414122253.3171524-1-trix@redhat.com>

On Fri, Apr 14, 2023 at 08:22:53AM -0400, Tom Rix wrote:
> clang reports
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>   'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>         if (ret)
>             ^~~
> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
> 
> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Angelo brought up a good point on another patch to fix this issue that
we should probably be returning ret instead of unconditionally returning
-EINVAL but it sounds like it does not really matter at the moment since
mtk_hdmi_pll_set_hw() can only return -EINVAL or 0.

https://lore.kernel.org/ada769e0-0141-634f-3753-eb3a50f0eee3@collabora.com/

> ---
>  drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index abfc077fb0a8..c63294e451d6 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -292,9 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>  	if (!(digital_div <= 32 && digital_div >= 1))
>  		return -EINVAL;
>  
> -	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> -			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
> -			    txposdiv, digital_div);
> +	ret = mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> +				  PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
> +				  txposdiv, digital_div);
>  	if (ret)
>  		return -EINVAL;
>  
> -- 
> 2.27.0
> 
