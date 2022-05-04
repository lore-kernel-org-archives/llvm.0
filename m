Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6881020F7
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 06:07:06 +0000 (UTC)
X-UUID: e82c32c82fe8487aba153338b45f979d-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:74de2192-db95-4e65-a77f-c2f86332ab79,OB:0,LO
	B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:8
X-CID-META: VersionHash:faefae9,CLOUDID:87fca32f-6199-437e-8ab4-9920b4bc5b76,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: e82c32c82fe8487aba153338b45f979d-20220504
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1570805905; Wed, 04 May 2022 14:07:00 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 4 May 2022 14:06:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 14:06:59 +0800
Message-ID: <dbfd045b65c4acec1fe11e96ed64c9c041b769f3.camel@mediatek.com>
Subject: Re: [PATCH v19 02/25] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<wim@linux-watchdog.org>, "AngeloGioacchino Del Regno"
	<angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 4 May 2022 14:06:59 +0800
In-Reply-To: <ab2ca5755069df3e9efb467d028a4d10004d9420.camel@mediatek.com>
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
	 <20220503102345.22817-3-nancy.lin@mediatek.com>
	 <ab2ca5755069df3e9efb467d028a4d10004d9420.camel@mediatek.com>
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

Hi Rex,

Thanks for the review.

On Wed, 2022-05-04 at 11:50 +0800, Rex-BC Chen wrote:
> On Tue, 2022-05-03 at 18:23 +0800, Nancy.Lin wrote:
> > Add vdosys1 reset control bit for MT8195 platform.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  include/dt-bindings/reset/mt8195-resets.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/include/dt-bindings/reset/mt8195-resets.h
> > b/include/dt-
> > bindings/reset/mt8195-resets.h
> > index a26bccc8b957..aab8d74496a6 100644
> > --- a/include/dt-bindings/reset/mt8195-resets.h
> > +++ b/include/dt-bindings/reset/mt8195-resets.h
> > @@ -26,4 +26,16 @@
> >  
> >  #define MT8195_TOPRGU_SW_RST_NUM               16
> >  
> > +/* VDOSYS1 */
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC          25
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC          26
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC          27
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC          28
> > +#define MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC          29
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC     51
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC     52
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC     53
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC     54
> > +#define MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC      55
> > +
> >  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8195 */
> 
> Hello Nancy,
> 
> From my previous experience, this should be "index".
> I think you can list all of them from 0 to 55.
> 
> BRs,
> Rex

Thanks for your advice. I will list all vdosys1 reset bits.
> 

Regards,
Nancy

