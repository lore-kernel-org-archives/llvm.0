Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C340193
	for <llvm@lists.linux.dev>; Fri, 19 Aug 2022 02:10:04 +0000 (UTC)
X-UUID: f064b3eaf3eb4633b58ae4b6d69b89dc-20220819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=h+l8o7r9XPTFomhUEyaLhpaCiOEqcWb83H4GxU7r5Ng=;
	b=cClyh/60WEUymLdlcqu28SR4XchPdZZrmbudxu+Rvy60LIn4kc9TJ3/LaFVX9Jy9ezPXdKkLsrpZSRH/iFqI5QbN+2LjbeiIJMLxeHrrPyiLQHPEvn/cF3ZDDHoH8D3NCf6fG+/ApLOFYgav7BuY5lyGKaO5ov/+DSRBjpxyvxg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:66196f3b-fb2a-4bbf-a2c9-a0fcea7a917a,OB:0,L
	OB:30,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Relea
	se_Ham,ACTION:release,TS:73
X-CID-INFO: VERSION:1.1.10,REQID:66196f3b-fb2a-4bbf-a2c9-a0fcea7a917a,OB:0,LOB
	:30,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Spam_GS
	981B3D,ACTION:quarantine,TS:73
X-CID-META: VersionHash:84eae18,CLOUDID:f7fb179d-da39-4e3b-a854-56c7d2111b46,C
	OID:e8b0f48844ab,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:40|20,QS:nil,BEC:nil,COL:0
X-UUID: f064b3eaf3eb4633b58ae4b6d69b89dc-20220819
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 625443391; Fri, 19 Aug 2022 10:09:59 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 10:09:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Aug 2022 10:09:57 +0800
Message-ID: <d7ccb3fb2630c1c0b6dda2990cff72169e5e5d0b.camel@mediatek.com>
Subject: Re: [PATCH v25 07/10] soc: mediatek: mmsys: add mmsys for support
 64 reset bits
From: Nancy.Lin <nancy.lin@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 19 Aug 2022 10:09:57 +0800
In-Reply-To: <20220818214715.spbyic34szubx3gi@notapiano>
References: <20220711075245.10492-1-nancy.lin@mediatek.com>
	 <20220711075245.10492-8-nancy.lin@mediatek.com>
	 <20220818214715.spbyic34szubx3gi@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N

Hi Nicolas,

Thanks for the review.

On Thu, 2022-08-18 at 17:47 -0400, Nícolas F. R. A. Prado wrote:
> Hi Nancy,
> 
> On Mon, Jul 11, 2022 at 03:52:42PM +0800, Nancy.Lin wrote:
> [..]
> >  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data
> > = {
> >  	.clk_driver = "clk-mt2701-mm",
> >  	.routes = mmsys_default_routing_table,
> > @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data
> > mt8173_mmsys_driver_data = {
> >  	.routes = mmsys_default_routing_table,
> >  	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> >  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> >  };
> >  
> >  static const struct mtk_mmsys_match_data mt8173_mmsys_match_data =
> > {
> > @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data
> > mt8183_mmsys_driver_data = {
> >  	.routes = mmsys_mt8183_routing_table,
> >  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> >  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> >  };
> >  
> >  static const struct mtk_mmsys_match_data mt8183_mmsys_match_data =
> > {
> > @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data
> > mt8186_mmsys_driver_data = {
> >  	.routes = mmsys_mt8186_routing_table,
> >  	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
> >  	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> >  };
> 
> [..]
> > @@ -351,18 +362,6 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >  		return ret;
> >  	}
> >  
> > -	spin_lock_init(&mmsys->lock);
> > -
> > -	mmsys->rcdev.owner = THIS_MODULE;
> > -	mmsys->rcdev.nr_resets = 32;
> 
> The number of resets was previously always set to 32, and now you're
> instead
> setting it based on num_resets from each machine. The issue is,
> you're
> forgetting a bunch of them.
> 
> mt8192 didn't get a num_reset, so this commit breaks the display on
> mt8192 based
> devices. But mt8192 isn't the only one, there are other platforms
> missing this
> property. Please set num_resets to 32 in every single one of them,
> otherwise
> there will be display regressions.
> 
> Thanks,
> Nícolas

It's my mistake. I will set num_resets to 32 for every mmsys driver.

Thanks,
Nancy

