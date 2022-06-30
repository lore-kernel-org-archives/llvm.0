Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB6AEBB
	for <llvm@lists.linux.dev>; Thu, 30 Jun 2022 09:41:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1o6qfO-0006FH-Vp; Thu, 30 Jun 2022 11:40:55 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1o6qfH-003Z1L-B7; Thu, 30 Jun 2022 11:40:50 +0200
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1o6qfJ-0003vf-W9; Thu, 30 Jun 2022 11:40:50 +0200
Message-ID: <c22c3421942b5d2a74694c1d5530c0dd5fdc34b3.camel@pengutronix.de>
Subject: Re: [PATCH v24 01/10] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, wim@linux-watchdog.org,  AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Thu, 30 Jun 2022 11:40:49 +0200
In-Reply-To: <20220622130824.29143-2-nancy.lin@mediatek.com>
References: <20220622130824.29143-1-nancy.lin@mediatek.com>
	 <20220622130824.29143-2-nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: llvm@lists.linux.dev

On Mi, 2022-06-22 at 21:08 +0800, Nancy.Lin wrote:
> Add vdosys1 reset control bit for MT8195 platform.
>=20
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
