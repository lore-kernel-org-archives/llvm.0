Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7713E17C9
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 01:36:26 +0000 (UTC)
X-UUID: 7b76a2315ff4434e95a226aa64066ef7-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:cee8f844-9481-479e-bc83-c47e6495e2cb,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:faefae9,CLOUDID:7d71992f-6199-437e-8ab4-9920b4bc5b76,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 7b76a2315ff4434e95a226aa64066ef7-20220504
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1770905408; Wed, 04 May 2022 09:36:20 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 4 May 2022 09:36:18 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 4 May 2022 09:36:18 +0800
Message-ID: <7707ae9a9e5ac1e860e0620b9e1009be1425c9cc.camel@mediatek.com>
Subject: Re: [PATCH v19 06/25] soc: mediatek: add mtk_mmsys_write_reg API
From: Nancy.Lin <nancy.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 4 May 2022 09:36:18 +0800
In-Reply-To: <c6be6d95-35f0-fb62-2d10-53f974ba67e4@collabora.com>
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
	 <20220503102345.22817-7-nancy.lin@mediatek.com>
	 <c6be6d95-35f0-fb62-2d10-53f974ba67e4@collabora.com>
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

Hi Angelo,

Thanks for the review.

On Tue, 2022-05-03 at 14:19 +0200, AngeloGioacchino Del Regno wrote:
> Il 03/05/22 12:23, Nancy.Lin ha scritto:
> > Add mtk_mmsys_write_reg API. Simplify code for writing mmsys reg.
> > It is a preparation for adding support for mmsys config API.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-mmsys.c | 35 ++++++++++++++-------------
> > -----
> >   1 file changed, 15 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index ab3c5cbb0175..3e2e5e3f721d 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -191,22 +191,26 @@ static int
> > mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
> >   	return -EINVAL;
> >   }
> >   
> > +static void mtk_mmsys_write_reg(struct mtk_mmsys *mmsys, u32
> > offset, u32 mask, u32 val)
> > +{
> > +	u32 tmp;
> > +
> > +	tmp = readl_relaxed(mmsys->regs + offset);
> > +	tmp = (tmp & ~mask) | val;
> > +	writel_relaxed(tmp, mmsys->regs + offset);
> > +}
> > +
> 
> Uhm... this is the equivalent of regmap_update_bits(): I fear that
> calling this
> mtk_mmsys_write_reg() may lead to confusion.
> 
> I think that a more appropriate name would be mtk_mmsys_update_bits()
> or
> something similar, recalling that this is not just a register write,
> but
> a RMW.
> 
> Regards,
> Angelo

Thanks for your suggestion. I will refine the function name in the next
revision.

Regards,
Nancy

