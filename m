Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B25320E8
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 03:40:08 +0000 (UTC)
X-UUID: 23a483dc1b82470ab70f394d42308179-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:8e621abb-c534-4821-b6f8-ebaec5a25666,OB:0,LO
	B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:53
X-CID-INFO: VERSION:1.1.4,REQID:8e621abb-c534-4821-b6f8-ebaec5a25666,OB:0,LOB:
	0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
	N:release,TS:53
X-CID-META: VersionHash:faefae9,CLOUDID:2fe49e2f-6199-437e-8ab4-9920b4bc5b76,C
	OID:31e3b17f8134,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
	,QS:0,BEC:nil
X-UUID: 23a483dc1b82470ab70f394d42308179-20220504
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1004933582; Wed, 04 May 2022 11:39:55 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 4 May 2022 11:39:54 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 May 2022 11:39:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 11:39:53 +0800
Message-ID: <334c76e4d22ed6de34e03a6c5b639bcd1ddf28e1.camel@mediatek.com>
Subject: Re: [PATCH v19 04/25] soc: mediatek: add mtk-mmsys ethdr and
 mdp_rdma components
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
Date: Wed, 4 May 2022 11:39:53 +0800
In-Reply-To: <20220503102345.22817-5-nancy.lin@mediatek.com>
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
	 <20220503102345.22817-5-nancy.lin@mediatek.com>
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

On Tue, 2022-05-03 at 18:23 +0800, Nancy.Lin wrote:
> Add new mmsys component: ethdr_mixer and mdp_rdma. These components
> will
> use in mt8195 vdosys1.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>  include/linux/soc/mediatek/mtk-mmsys.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> b/include/linux/soc/mediatek/mtk-mmsys.h
> index fb719fd1281c..b4388ba43341 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -28,7 +28,16 @@ enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_DSI1,
>  	DDP_COMPONENT_DSI2,
>  	DDP_COMPONENT_DSI3,
> +	DDP_COMPONENT_ETHDR_MIXER,
>  	DDP_COMPONENT_GAMMA,
> +	DDP_COMPONENT_MDP_RDMA0,
> +	DDP_COMPONENT_MDP_RDMA1,
> +	DDP_COMPONENT_MDP_RDMA2,
> +	DDP_COMPONENT_MDP_RDMA3,
> +	DDP_COMPONENT_MDP_RDMA4,
> +	DDP_COMPONENT_MDP_RDMA5,
> +	DDP_COMPONENT_MDP_RDMA6,
> +	DDP_COMPONENT_MDP_RDMA7,
>  	DDP_COMPONENT_MERGE0,
>  	DDP_COMPONENT_MERGE1,
>  	DDP_COMPONENT_MERGE2,

