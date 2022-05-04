Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70C62110
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 09:54:29 +0000 (UTC)
X-UUID: 05633f7d53cf42deb769150493a697db-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4,REQID:0da1c78c-4e58-4d58-afe2-5477d4fdc9bf,OB:0,LO
	B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:8
X-CID-META: VersionHash:faefae9,CLOUDID:b3412816-2e53-443e-b81a-655c13977218,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 05633f7d53cf42deb769150493a697db-20220504
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 246735322; Wed, 04 May 2022 17:54:25 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 4 May 2022 17:54:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 17:54:24 +0800
Message-ID: <85f79f5c23e98a12703c721b343425469cace550.camel@mediatek.com>
Subject: Re: [PATCH v20 02/25] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
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
Date: Wed, 4 May 2022 17:54:24 +0800
In-Reply-To: <20220504091440.2052-3-nancy.lin@mediatek.com>
References: <20220504091440.2052-1-nancy.lin@mediatek.com>
	 <20220504091440.2052-3-nancy.lin@mediatek.com>
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

On Wed, 2022-05-04 at 17:14 +0800, Nancy.Lin wrote:
> Add vdosys1 reset control bit for MT8195 platform.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  include/dt-bindings/reset/mt8195-resets.h | 45
> +++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

