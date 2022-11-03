Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E6229A8
	for <llvm@lists.linux.dev>; Thu,  3 Nov 2022 20:32:47 +0000 (UTC)
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9F0FD660295F;
	Thu,  3 Nov 2022 20:32:42 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667507565;
	bh=s7VMS6sqPzrxI8wodWazep6RmdDGQpqaH/k/O9pHKSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PyWTvoWWaPdngbDHe6Uw6YzacdFUVXdkGMEna87bwd7WXTwo7FBZlufZIkMHJJLEy
	 GHf4bVNU4VLMlQxhB+3hMwsKv/szkmIh8atjChM7QikeF3pQtpDvUT1TUh1ix3GyTA
	 Gt7Z0cqtZBPgBqcAf9onCOHOEoFlN6S4b/fC75qKhqu9oavCf0T3HMfqEkRisS1odX
	 WsAA1nTCMG5qF0aWuNAnC0fDyeCP9H0TaOEFwOJLFFqxyMdPg5pdbDPEeoavSrKRAQ
	 y1KhleAdaAeC1pxVT7LIbZ9gfHjNfp0eOXLf10t8XwpJhV6d28jeOFloLW1rRwnUKJ
	 RBu8+uxv8tkHA==
Date: Thu, 3 Nov 2022 16:32:38 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux@roeck-us.net, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev, singo.chang@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v27 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
Message-ID: <20221103203238.fryjwpgjtwccnjwu@notapiano>
References: <20221103032512.9144-1-nancy.lin@mediatek.com>
 <20221103032512.9144-6-nancy.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103032512.9144-6-nancy.lin@mediatek.com>

On Thu, Nov 03, 2022 at 11:25:06AM +0800, Nancy.Lin wrote:
[..]
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
[..]
> +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(mmsys->regs + offset);
> +	tmp = (tmp & ~mask) | val;

You should mask the value before writing to prevent bad values from overwriting
bits outside the mask.

	tmp = (tmp & ~mask) | (val & mask);

With that,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
