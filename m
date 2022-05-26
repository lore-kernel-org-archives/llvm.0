Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD332EC4
	for <llvm@lists.linux.dev>; Thu, 26 May 2022 07:08:46 +0000 (UTC)
X-UUID: 8269ac6b732f4c13af0950215420d768-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:b15ec10b-6098-4f21-995b-6a4bd6e9e238,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:45
X-CID-INFO: VERSION:1.1.5,REQID:b15ec10b-6098-4f21-995b-6a4bd6e9e238,OB:0,LOB:
	0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
	N:release,TS:45
X-CID-META: VersionHash:2a19b09,CLOUDID:0b768c47-4fb1-496b-8f1d-39e733fed1ea,C
	OID:c3fa04fb1107,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,QS:0,BEC:nil
X-UUID: 8269ac6b732f4c13af0950215420d768-20220526
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1084779265; Thu, 26 May 2022 15:03:34 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 26 May 2022 15:03:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 26 May 2022 15:03:32 +0800
Message-ID: <995c91a5dbad4512aadc8b2e12502e88b335af5b.camel@mediatek.com>
Subject: Re: [PATCH v21 00/25] Add MediaTek SoC DRM (vdosys1) support for
 mt8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 26 May 2022 15:03:32 +0800
In-Reply-To: <79863f1b-7bdd-61c7-2209-23011d8e1558@collabora.com>
References: <20220512053128.31415-1-nancy.lin@mediatek.com>
	 <8c6ceb14be7e53a7dab9d6f045a48deaef54f683.camel@mediatek.com>
	 <79863f1b-7bdd-61c7-2209-23011d8e1558@collabora.com>
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

On Wed, 2022-05-25 at 12:08 +0200, AngeloGioacchino Del Regno wrote:
> Il 18/05/22 04:47, Rex-BC Chen ha scritto:
> > On Thu, 2022-05-12 at 13:31 +0800, Nancy.Lin wrote:
> > > The hardware path of vdosys1 with DPTx output need to go through
> > > by
> > > several modules, such as, OVL_ADAPTOR and MERGE.
> > > 
> > > Add DRM and these modules support by the patches below:
> > > 
> > > Changes in v21:
> > > - fix reviewer comment
> > >    - fix rdma and ethdr binding doc and dts
> > > 
> 
> ..snip..
> 
> > 
> > Hello Matthias,
> > 
> > Could you also spare some time to give us some suggestion for the
> > mmsys
> > and mutex patches of this series?
> > If we can improve anything, we can do it before 5.19.
> > Thanks for your big support!
> > 
> > BRs,
> > Rex
> > 
> 
> Even though there may be something to further improve, keep in mind
> that we're
> already at v21... that's... a lot of versions, and vdosys0/1 are
> practically
> tied together even though they're coming from two different
> engineers.
> 
> I can confirm that this entire stack works on the new HW as intended
> and that
> there's no regression on older ones, so on all patches you can add
> my:
> 
> [Tested on MT6795, MT8173, MT8192, MT8195]
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> 
> 
> .... BUT! ....
> 
> 
> This series won't apply cleanly anymore on next-20220525 (same for
> vdosys0,
> already pinged Jason about it) because of the commits adding support
> for MT8186,
> so *please rebase this series once again*.
> 
> 
> Cheers,
> Angelo

Hi Angelo,

I will rebase to next-20220525 and resend it soon.

Regards,
Nancy

