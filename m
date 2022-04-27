Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3030621
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 07:22:51 +0000 (UTC)
X-UUID: b3911aacd24a466d917e8c2559b9f8f4-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:4aceea38-7c87-4b50-b791-a0b0c2871e93,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:51
X-CID-INFO: VERSION:1.1.4,REQID:4aceea38-7c87-4b50-b791-a0b0c2871e93,OB:0,LOB:
	0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:51,FILE:0,RULE:Release_Ham,ACTIO
	N:release,TS:51
X-CID-META: VersionHash:faefae9,CLOUDID:700ade2e-6199-437e-8ab4-9920b4bc5b76,C
	OID:91dffe5af84e,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
	,QS:0,BEC:nil
X-UUID: b3911aacd24a466d917e8c2559b9f8f4-20220427
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1784283442; Wed, 27 Apr 2022 15:22:46 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 27 Apr 2022 15:22:46 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 27 Apr
 2022 15:22:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 15:22:44 +0800
Message-ID: <9053a481cbe752b458997cff5f0fe7d3040fc22b.camel@mediatek.com>
Subject: Re: [PATCH v17 06/21] soc: mediatek: add cmdq support of mtk-mmsys
 config API for mt8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 27 Apr 2022 15:22:43 +0800
In-Reply-To: <eca7f22a-9a04-dd67-aaad-3cf64a909090@gmail.com>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
	 <20220416020749.29010-7-nancy.lin@mediatek.com>
	 <eca7f22a-9a04-dd67-aaad-3cf64a909090@gmail.com>
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

Hi Matthias,

Thanks for the review.

On Fri, 2022-04-22 at 13:37 +0200, Matthias Brugger wrote:
> 
> On 16/04/2022 04:07, Nancy.Lin wrote:
> > Add cmdq support for mtk-mmsys config API.
> > The mmsys config register settings need to take effect with the
> > other
> > HW settings(like OVL_ADAPTOR...) at the same vblanking time.
> > 
> > If we use CPU to write the mmsys reg, we can't guarantee all the
> > settings can be written in the same vblanking time.
> > Cmdq is used for this purpose. We prepare all the related HW
> > settings
> > in one cmdq packet. The first command in the packet is "wait stream
> > done",
> > and then following with all the HW settings. After the cmdq packet
> > is
> > flush to GCE HW. The GCE waits for the "stream done event" to
> > coming
> > and then starts flushing all the HW settings. This can guarantee
> > all
> > the settings flush in the same vblanking.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >   drivers/soc/mediatek/mtk-mmsys.c       | 50 ++++++++++++++++++---
> > -----
> >   include/linux/soc/mediatek/mtk-mmsys.h | 15 +++++---
> >   2 files changed, 47 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index 7b262cefef85..ea04aa2c3840 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -177,6 +177,7 @@ struct mtk_mmsys {
> >   	spinlock_t lock; /* protects mmsys_sw_rst_b reg */
> >   	struct reset_controller_dev rcdev;
> >   	phys_addr_t io_start;
> > +	struct cmdq_client_reg cmdq_base;
> >   };
> >   
> >   static int mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
> > @@ -280,46 +281,61 @@ static const struct reset_control_ops
> > mtk_mmsys_reset_ops = {
> >   	.reset = mtk_mmsys_reset,
> >   };
> >   
> > -static void mtk_mmsys_write_reg(struct device *dev, u32 offset,
> > u32 mask, u32 val)
> > +static void mtk_mmsys_write_reg(struct device *dev, u32 offset,
> > u32 mask, u32 val,
> > +				struct cmdq_pkt *cmdq_pkt)
> >   {
> >   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> >   	u32 tmp;
> >   
> > -	tmp = readl(mmsys->regs + offset);
> > -	tmp = (tmp & ~mask) | val;
> > -	writel(tmp, mmsys->regs + offset);
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	if (cmdq_pkt && mmsys->cmdq_base.size) {
> > +		cmdq_pkt_write_mask(cmdq_pkt, mmsys->cmdq_base.subsys,
> > +				    mmsys->cmdq_base.offset + offset,
> > val,
> > +				    mask);
> 
> If we put here:
> 
>     return;
> }
> #endif
> 
> > +	} else {
> > +#endif
> > +		tmp = readl(mmsys->regs + offset);
> > +		tmp = (tmp & ~mask) | val;
> > +		writel(tmp, mmsys->regs + offset);
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	}
> > +#endif
> 
> Then we can get rid of this IS_REACHABLE. Other then that patch looks
> good.
> 
> Matthias
> 

Thanks for your suggestion. I will refine it in the next revision.

Regards,
Nancy

> >   }
> >   
> > -void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> > width, int height)
> > +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> > width,
> > +				  int height, struct cmdq_pkt
> > *cmdq_pkt)
> >   {
> >   	mtk_mmsys_write_reg(dev, MT8195_VDO1_MERGE0_ASYNC_CFG_WD + 0x10
> > * idx,
> > -			    ~0, height << 16 | width);
> > +			    ~0, height << 16 | width, cmdq_pkt);
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_merge_async_config);
> >   
> > -void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> > be_height)
> > +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> > be_height,
> > +			   struct cmdq_pkt *cmdq_pkt)
> >   {
> >   	mtk_mmsys_write_reg(dev, MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
> > -			    be_height << 16 | be_width);
> > +			    be_height << 16 | be_width, cmdq_pkt);
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_confing);
> >   
> >   void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool
> > alpha_sel, u16 alpha,
> > -			       u8 mode, u32 biwidth)
> > +			       u8 mode, u32 biwidth, struct cmdq_pkt
> > *cmdq_pkt)
> >   {
> >   	mtk_mmsys_write_reg(dev, MT8195_VDO1_MIXER_IN1_ALPHA + (idx -
> > 1) * 4, ~0,
> > -			    alpha << 16 | alpha);
> > +			    alpha << 16 | alpha, cmdq_pkt);
> >   	mtk_mmsys_write_reg(dev, MT8195_VDO1_HDR_TOP_CFG, BIT(19 +
> > idx),
> > -			    alpha_sel << (19 + idx));
> > +			    alpha_sel << (19 + idx), cmdq_pkt);
> >   	mtk_mmsys_write_reg(dev, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1)
> > * 4,
> > -			    GENMASK(31, 16) | GENMASK(1, 0), biwidth <<
> > 16 | mode);
> > +			    GENMASK(31, 16) | GENMASK(1, 0),
> > +			    biwidth << 16 | mode, cmdq_pkt);
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_config);
> >   
> > -void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> > bool channel_swap)
> > +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> > bool channel_swap,
> > +				     struct cmdq_pkt *cmdq_pkt)
> >   {
> >   	mtk_mmsys_write_reg(dev, MT8195_VDO1_MIXER_IN1_PAD + (idx - 1)
> > * 4, BIT(4),
> > -			    channel_swap << 4);
> > +			    channel_swap << 4, cmdq_pkt);
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_channel_swap);
> >   
> > @@ -377,6 +393,12 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >   		mmsys->data = match_data->drv_data[0];
> >   	}
> >   
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +	ret = cmdq_dev_get_client_reg(dev, &mmsys->cmdq_base, 0);
> > +	if (ret)
> > +		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
> > +#endif
> > +
> >   	platform_set_drvdata(pdev, mmsys);
> >   
> >   	clks = platform_device_register_data(&pdev->dev, mmsys->data-
> > >clk_driver,
> > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > b/include/linux/soc/mediatek/mtk-mmsys.h
> > index fe620929b0f9..7a73305390ba 100644
> > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > @@ -6,6 +6,10 @@
> >   #ifndef __MTK_MMSYS_H
> >   #define __MTK_MMSYS_H
> >   
> > +#include <linux/mailbox_controller.h>
> > +#include <linux/mailbox/mtk-cmdq-mailbox.h>
> > +#include <linux/soc/mediatek/mtk-cmdq.h>
> > +
> >   enum mtk_ddp_comp_id;
> >   struct device;
> >   
> > @@ -73,13 +77,16 @@ void mtk_mmsys_ddp_disconnect(struct device
> > *dev,
> >   			      enum mtk_ddp_comp_id cur,
> >   			      enum mtk_ddp_comp_id next);
> >   
> > -void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> > width, int height);
> > +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> > width,
> > +				  int height, struct cmdq_pkt
> > *cmdq_pkt);
> >   
> > -void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> > be_height);
> > +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> > be_height,
> > +			   struct cmdq_pkt *cmdq_pkt);
> >   
> >   void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool
> > alpha_sel, u16 alpha,
> > -			       u8 mode, u32 biwidth);
> > +			       u8 mode, u32 biwidth, struct cmdq_pkt
> > *cmdq_pkt);
> >   
> > -void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> > bool channel_swap);
> > +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> > bool channel_swap,
> > +				     struct cmdq_pkt *cmdq_pkt);
> >   
> >   #endif /* __MTK_MMSYS_H */
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!0pXxTj2b3mnxU4EoC9pD9oDKrMfP94xbd8LbZmH458oNOSzit_MOSnjS6RhGvUhR$
>  

