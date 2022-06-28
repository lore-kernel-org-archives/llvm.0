Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA067A
	for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 01:39:41 +0000 (UTC)
X-UUID: 6bb4eaf9c6294e3795417ee8402c3cfb-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:4b9c0c03-4fe5-4054-956c-07cc1ee20e9f,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:87442a2,CLOUDID:e8a0cb62-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 6bb4eaf9c6294e3795417ee8402c3cfb-20220628
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 607049979; Tue, 28 Jun 2022 09:39:36 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 28 Jun 2022 09:39:35 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jun 2022 09:39:34 +0800
Message-ID: <839dc551443077a8b94ca06e926c531f504bc7a9.camel@mediatek.com>
Subject: Re: [PATCH v23 07/14] drm/mediatek: add display merge async reset
 control
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<wim@linux-watchdog.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
	<llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Nathan
 Chancellor" <nathan@kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Date: Tue, 28 Jun 2022 09:39:35 +0800
In-Reply-To: <20220620091930.27797-8-nancy.lin@mediatek.com>
References: <20220620091930.27797-1-nancy.lin@mediatek.com>
	 <20220620091930.27797-8-nancy.lin@mediatek.com>
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

On Mon, 2022-06-20 at 17:19 +0800, Nancy.Lin wrote:
> Add merge async reset control in mtk_merge_stop. Async hw doesn't do
> self
> reset on each sof signal(start of frame), so need to reset the async
> to
> clear the hw status for the next merge start.

Applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> index 2e13d2fb429e..6428b6203ffe 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -8,6 +8,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
>  
>  #include "mtk_drm_ddp_comp.h"
> @@ -67,6 +68,7 @@ struct mtk_disp_merge {
>  	struct cmdq_client_reg		cmdq_reg;
>  	bool				fifo_en;
>  	bool				mute_support;
> +	struct reset_control		*reset_ctl;
>  };
>  
>  void mtk_merge_start(struct device *dev)
> @@ -101,6 +103,9 @@ void mtk_merge_stop_cmdq(struct device *dev,
> struct cmdq_pkt *cmdq_pkt)
>  
>  	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
>  		      DISP_REG_MERGE_CTRL);
> +
> +	if (priv->async_clk)
> +		reset_control_reset(priv->reset_ctl);
>  }
>  
>  static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,
> @@ -264,6 +269,12 @@ static int mtk_disp_merge_probe(struct
> platform_device *pdev)
>  		return PTR_ERR(priv->async_clk);
>  	}
>  
> +	if (priv->async_clk) {
> +		priv->reset_ctl =
> devm_reset_control_get_optional_exclusive(dev, NULL);
> +		if (IS_ERR(priv->reset_ctl))
> +			return PTR_ERR(priv->reset_ctl);
> +	}
> +
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>  	ret = cmdq_dev_get_client_reg(dev, &priv->cmdq_reg, 0);
>  	if (ret)

