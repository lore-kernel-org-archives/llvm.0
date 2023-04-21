Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D512C6FD7
	for <llvm@lists.linux.dev>; Fri, 21 Apr 2023 22:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB865C4339B;
	Fri, 21 Apr 2023 22:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682115213;
	bh=XZd3xOHh9hRBu/JySb+r9z3kK1JjV1tv32skF1cGDD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTwMl+eJzSMy03iFAPAUp2luKiUzmKPxD1vHfIkFe4Op2MvFaumks9ziuyiKumi0v
	 Kb/A8ohF449C24/uFul9iePPNOmLn95Zm4ndeWMsNRXj/rv9p/xW25pi4mfS/fVaTf
	 VFwB+RLND2DfSaBonTlBPJP1WiV8fiFmWzg4E84lUoQJzQ9GA+ndAvfyfCj0W1FnD4
	 m3EuUHMyJy4e15fVTJUwSxUh7WEUDFlfghF/VUXYforrGmxivzem48PrTb9o3XkUWl
	 qaF8VAirH/9KOwHFiHeOTm+Yga6UiorhrHPbmTSc+hc2glWjs/f1Eg5f/NB/e4vYra
	 wWAJqLWNq8X6g==
Date: Fri, 21 Apr 2023 15:13:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 1/2] phy: mediatek: hdmi: mt8195: fix uninitialized
 variable usage in pll_calc
Message-ID: <20230421221330.GA3657732@dev-arch.thelio-3990X>
References: <20230413-fixes-for-mt8195-hdmi-phy-v2-0-bbad62e64321@baylibre.com>
 <20230413-fixes-for-mt8195-hdmi-phy-v2-1-bbad62e64321@baylibre.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230413-fixes-for-mt8195-hdmi-phy-v2-1-bbad62e64321@baylibre.com>

On Fri, Apr 14, 2023 at 06:07:46PM +0200, Guillaume Ranquet wrote:
> The ret variable in mtk_hdmi_pll_calc() was used unitialized as reported
> by the kernel test robot.
> 
> Fix the issue by removing the variable altogether and testing out the
> return value of mtk_hdmi_pll_set_hw()
> 
> Fixes: 45810d486bb44 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Can somebody pick this up? It fixes a rather obvious warning, which is
breaking clang builds (as evidenced by three versions of the same fix).

> ---
>  drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> index abfc077fb0a8..054b73cb31ee 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c
> @@ -213,7 +213,7 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>  	u64 tmds_clk, pixel_clk, da_hdmitx21_ref_ck, ns_hdmipll_ck, pcw;
>  	u8 txpredivs[4] = { 2, 4, 6, 12 };
>  	u32 fbkdiv_low;
> -	int i, ret;
> +	int i;
>  
>  	pixel_clk = rate;
>  	tmds_clk = pixel_clk;
> @@ -292,13 +292,9 @@ static int mtk_hdmi_pll_calc(struct mtk_hdmi_phy *hdmi_phy, struct clk_hw *hw,
>  	if (!(digital_div <= 32 && digital_div >= 1))
>  		return -EINVAL;
>  
> -	mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
> +	return mtk_hdmi_pll_set_hw(hw, PLL_PREDIV, fbkdiv_high, fbkdiv_low,
>  			    PLL_FBKDIV_HS3, posdiv1, posdiv2, txprediv,
>  			    txposdiv, digital_div);
> -	if (ret)
> -		return -EINVAL;
> -
> -	return 0;
>  }
>  
>  static int mtk_hdmi_pll_drv_setting(struct clk_hw *hw)
> 
> -- 
> 2.40.0
> 
