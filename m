Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C6E7A
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 10:08:21 +0000 (UTC)
X-UUID: ce2c967006b74899b0ccc8346247be61-20220314
X-UUID: ce2c967006b74899b0ccc8346247be61-20220314
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 826461066; Mon, 14 Mar 2022 18:08:10 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 14 Mar 2022 18:08:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Mar 2022 18:08:08 +0800
Message-ID: <abdf2bf18c57b8c622970252f58d4849823e48bd.camel@mediatek.com>
Subject: Re: [PATCH v15 19/22] drm/mediatek: modify mediatek-drm for mt8195
 multi mmsys support
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<wim@linux-watchdog.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <srv_heupstream@mediatek.com>, David Airlie
	<airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <llvm@lists.linux.dev>, Nick Desaulniers
	<ndesaulniers@google.com>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, Nathan Chancellor <nathan@kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Mon, 14 Mar 2022 18:08:08 +0800
In-Reply-To: <20220311015506.11232-20-nancy.lin@mediatek.com>
References: <20220311015506.11232-1-nancy.lin@mediatek.com>
	 <20220311015506.11232-20-nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N

Hi, Nancy:

On Fri, 2022-03-11 at 09:55 +0800, Nancy.Lin wrote:
> MT8195 have two mmsys. Modify drm for MT8195 multi-mmsys support.
> The two mmsys (vdosys0 and vdosys1) will bring up two drm drivers,
> only one drm driver register as the drm device.
> Each drm driver binds its own component. The last bind drm driver
> allocates and registers the drm device to drm core.
> Each crtc path is created with the corresponding drm driver data.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  24 +-
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h |   3 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 300 ++++++++++++++++++--
> ----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  10 +-
>  4 files changed, 246 insertions(+), 91 deletions(-)
> 
> 

[snip]

>  
>  static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data
> = {
>  	.main_path = mt8195_mtk_ddp_main,
>  	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
> +	.mmsys_dev_num = 2,

After apply this patch, vdosys0 only would not work. So I think this
should be set to 1 in this patch, and set to 2 in the patch that
support mt8195 vdosys1. With this modification,

Reviewed-by: CK Hu <ck.hu@mediatek.com>

>  };
>  
> 

