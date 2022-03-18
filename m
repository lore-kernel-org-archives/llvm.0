Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC77C4C60
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 13:04:28 +0000 (UTC)
X-UUID: e651d6028a3542a8b2e8a4c20047d2f4-20220318
X-UUID: e651d6028a3542a8b2e8a4c20047d2f4-20220318
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 163792457; Fri, 18 Mar 2022 21:04:16 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 18 Mar 2022 21:04:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Mar 2022 21:04:13 +0800
Message-ID: <4a59806ad9adbfcaa4c34cdf79d615e24e666442.camel@mediatek.com>
Subject: Re: [PATCH v15 19/22] drm/mediatek: modify mediatek-drm for mt8195
 multi mmsys support
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <srv_heupstream@mediatek.com>, David Airlie
	<airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
	<singo.chang@mediatek.com>, <llvm@lists.linux.dev>, Nick Desaulniers
	<ndesaulniers@google.com>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, Nathan Chancellor <nathan@kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Date: Fri, 18 Mar 2022 21:04:13 +0800
In-Reply-To: <abdf2bf18c57b8c622970252f58d4849823e48bd.camel@mediatek.com>
References: <20220311015506.11232-1-nancy.lin@mediatek.com>
	 <20220311015506.11232-20-nancy.lin@mediatek.com>
	 <abdf2bf18c57b8c622970252f58d4849823e48bd.camel@mediatek.com>
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

Hi CK,

Thanks for the review.

On Mon, 2022-03-14 at 18:08 +0800, CK Hu wrote:
> Hi, Nancy:
> 
> On Fri, 2022-03-11 at 09:55 +0800, Nancy.Lin wrote:
> > MT8195 have two mmsys. Modify drm for MT8195 multi-mmsys support.
> > The two mmsys (vdosys0 and vdosys1) will bring up two drm drivers,
> > only one drm driver register as the drm device.
> > Each drm driver binds its own component. The last bind drm driver
> > allocates and registers the drm device to drm core.
> > Each crtc path is created with the corresponding drm driver data.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  24 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.h |   3 +-
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 300 ++++++++++++++++++--
> > ----
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.h  |  10 +-
> >  4 files changed, 246 insertions(+), 91 deletions(-)
> > 
> > 
> 
> [snip]
> 
> >  
> >  static const struct mtk_mmsys_driver_data
> > mt8195_vdosys0_driver_data
> > = {
> >  	.main_path = mt8195_mtk_ddp_main,
> >  	.main_len = ARRAY_SIZE(mt8195_mtk_ddp_main),
> > +	.mmsys_dev_num = 2,
> 
> After apply this patch, vdosys0 only would not work. So I think this
> should be set to 1 in this patch, and set to 2 in the patch that
> support mt8195 vdosys1. With this modification,
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

OK, I will fix it.

Regards,
Nancy


> >  };
> >  
> > 
> 
> 

