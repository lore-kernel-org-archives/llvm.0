Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821767C
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 02:14:10 +0000 (UTC)
X-UUID: 48128d86c0544099a2bb2db2d7b411ca-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:fb02c172-ebb9-41e2-bc7b-e6d8a1230eb9,OB:70,L
	OB:60,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,A
	CTION:release,TS:50
X-CID-INFO: VERSION:1.1.5,REQID:fb02c172-ebb9-41e2-bc7b-e6d8a1230eb9,OB:70,LOB
	:60,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:50
X-CID-META: VersionHash:2a19b09,CLOUDID:9b85b67e-c8dc-403a-96e8-6237210dceee,C
	OID:78c8b171625a,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,QS:0,BEC:nil
X-UUID: 48128d86c0544099a2bb2db2d7b411ca-20220609
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 503280458; Thu, 09 Jun 2022 10:14:03 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Thu, 9 Jun 2022 10:14:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 9 Jun 2022 10:14:01 +0800
Message-ID: <a9e414d58dc14be072823d5a5c7ee8802275785d.camel@mediatek.com>
Subject: Re: [PATCH v22 20/24] drm/mediatek: add ovl_adaptor support for
 MT8195
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, "linux@roeck-us.net"
	<linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
	<Jason-JH.Lin@mediatek.com>, Yongqiang Niu
 =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?= <yongqiang.niu@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "llvm@lists.linux.dev"
	<llvm@lists.linux.dev>, Singo Chang
 =?UTF-8?Q?=28=E5=BC=B5=E8=88=88=E5=9C=8B=29?= <Singo.Chang@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 9 Jun 2022 10:14:01 +0800
In-Reply-To: <20220526110233.20080-21-nancy.lin@mediatek.com>
References: <20220526110233.20080-1-nancy.lin@mediatek.com>
	 <20220526110233.20080-21-nancy.lin@mediatek.com>
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

On Thu, 2022-05-26 at 19:02 +0800, Nancy.Lin wrote:
> Add ovl_adaptor driver for MT8195.
> Ovl_adaptor is an encapsulated module and designed for simplified
> DRM control flow. This module is composed of 8 RDMAs, 4 MERGEs and
> an ETHDR. Two RDMAs merge into one layer, so this module support 4
> layers.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---

[Bo-Chen: Test on MT8195 Tomato Chromebook with external display]
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

