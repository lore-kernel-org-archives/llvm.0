Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2315A2
	for <llvm@lists.linux.dev>; Fri, 19 Aug 2022 02:07:01 +0000 (UTC)
X-UUID: 50bdaa07ed2e4f058ab41840d83d7c07-20220819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=j+jij6rP5UZ59u1I5lN0gCJQwmvORQQf/bMnAxyJg10=;
	b=QnM/kQ/YAsT1q6oq13kg3f6ecCJXwgmYNkZVP6866nq4aboQe00Ubtaz1bQtpUxnRAMVRE85hfLE3ko3hedGeTTMxkiNv88LqmYLRtg+EMTiPH5BUTOGJaSvc2C6YtwsdrvVjsjVzOkKzrZ5CHfbfz0x+BvIngjUhAYwym4Em1Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:cafc5e2f-ba08-43b7-8ca1-bff3da1a405a,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Releas
	e_Ham,ACTION:release,TS:73
X-CID-INFO: VERSION:1.1.10,REQID:cafc5e2f-ba08-43b7-8ca1-bff3da1a405a,OB:0,LOB
	:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:28,RULE:Spam_GS9
	81B3D,ACTION:quarantine,TS:73
X-CID-META: VersionHash:84eae18,CLOUDID:90e1179d-da39-4e3b-a854-56c7d2111b46,C
	OID:7ef0119edc35,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:40|20,QS:nil,BEC:nil,COL:0
X-UUID: 50bdaa07ed2e4f058ab41840d83d7c07-20220819
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1601548016; Fri, 19 Aug 2022 10:06:50 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 10:06:48 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Aug 2022 10:06:48 +0800
Message-ID: <b047015e91b261ffd5ff48cf076c4335b4765084.camel@mediatek.com>
Subject: Re: [PATCH v25 1/7] dt-bindings: mediatek: add ethdr definition for
 mt8195
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
Date: Fri, 19 Aug 2022 10:06:48 +0800
In-Reply-To: <20220818204231.zvq6tipjyzen33oi@notapiano>
References: <20220804072827.22383-1-nancy.lin@mediatek.com>
	 <20220804072827.22383-2-nancy.lin@mediatek.com>
	 <20220818204231.zvq6tipjyzen33oi@notapiano>
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


On Thu, 2022-08-18 at 16:42 -0400, Nícolas F. R. A. Prado wrote:
> Hi Nancy,
> 
> On Thu, Aug 04, 2022 at 03:28:21PM +0800, Nancy.Lin wrote:
> > Add vdosys1 ETHDR definition.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Reviewed-by: AngeloGioacchino Del Regno
> >  <angelogioacchino.delregno@collabora.com>
> 
> Some line-wrapping happened to your patch when sending, so it's
> corrupted and
> won't apply:
> 
> 	$ b4 am 
> https://lore.kernel.org/all/20220804072827.22383-1-nancy.lin@mediatek.com/
> 	$ git am
> ./v25_20220804_nancy_lin_add_mediatek_soc_drm_vdosys1_support_for_mt8
> 195.mbx
> 	Applying: dt-bindings: mediatek: add ethdr definition for
> mt8195
> 	error: corrupt patch at line 228
> 
> Fix whatever causes this in your setup and re-send. Tinghan also had
> this issue
> recently [1].
> 
> [1] 
> https://lore.kernel.org/all/96e66425-ff2a-4640-8b96-48fa39943bf9@linaro.org/
> 
> Thanks,
> Nícolas


The email issue was fixed recently, I will resend patches soon.

Thanks,
Nancy


